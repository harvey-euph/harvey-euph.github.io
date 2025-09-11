---
title: "實驗筆記: Latency Debug"
date: 2025-07-27 00:00:00 +0800
categories: [Careers, Notes]
tags: [Tech, Computer Architecture]
---

## 前置準備

### Step 1: 建立工作目錄
```bash
mkdir latency_debug_$(date +%Y%m%d_%H%M)
cd latency_debug_$(date +%Y%m%d_%H%M)
```

> 以下內容來自 LLM 且未經整理以及實證，實驗過後的確認有用的內容會搬到上面
{: .prompt-tip }


### Step 2: 確認程式狀態
```bash
# 找到程式 PID
ps aux | grep trade_server
export PID=$(pgrep trade_server)
echo "Trade Server PID: $PID"

# 確認程式正在運行
if [ -z "$PID" ]; then
    echo "程式未運行，請先啟動 ./trade_server"
    exit 1
fi
```

## 階段一：快速診斷

### Step 3: 系統資源快照
```bash
# 建立基準資料
echo "=== 系統資源快照 ===" > baseline.txt
echo "時間: $(date)" >> baseline.txt
echo "" >> baseline.txt

# CPU 使用率
echo "CPU 使用率:" >> baseline.txt
top -b -n1 -p $PID | tail -n +8 >> baseline.txt
echo "" >> baseline.txt

# 記憶體使用
echo "記憶體使用:" >> baseline.txt
cat /proc/$PID/status | grep -E "VmRSS|VmSize" >> baseline.txt
echo "" >> baseline.txt

# 網路連線狀態
echo "網路連線:" >> baseline.txt
ss -tuln | grep -E ":.*LISTEN|:.*ESTAB" >> baseline.txt
```

### Step 4: 效能採樣
```bash
# 背景監控 CPU 使用率
(while true; do 
    echo "$(date +%H:%M:%S),$(top -b -n1 -p $PID | tail -1 | awk '{print $9}')" 
    sleep 1
done) > cpu_usage.csv &
CPU_MON_PID=$!

echo "正在收集 5 分鐘基準資料..."
sleep 300

# 停止監控
kill $CPU_MON_PID
```

## 階段二：系統呼叫分析

### Step 5: 系統呼叫追蹤
```bash
echo "開始系統呼叫追蹤 (30秒)..."

# 追蹤系統呼叫頻率
strace -c -p $PID -o syscall_summary.txt &
STRACE_PID=$!
sleep 30
kill -INT $STRACE_PID

echo "系統呼叫統計完成"
```

### Step 6: 網路相關系統呼叫詳細追蹤
```bash
echo "追蹤網路系統呼叫 (60秒)..."

# 詳細追蹤網路相關呼叫
timeout 60 strace -tt -T -p $PID -e trace=network -o network_syscalls.txt

echo "網路系統呼叫追蹤完成"
```

## 階段三：CPU 效能分析

### Step 7: CPU Profiling
```bash
echo "開始 CPU profiling (2分鐘)..."

# 檢查是否有 perf 權限
if ! sudo perf record --help > /dev/null 2>&1; then
    echo "警告: 無 perf 權限，跳過 CPU profiling"
else
    # CPU 熱點分析
    sudo perf record -g -p $PID -o perf_cpu.data -- sleep 120
    
    # 產生報告
    sudo perf report -i perf_cpu.data --stdio > cpu_hotspots.txt
    
    # Cache miss 分析
    sudo perf record -e cache-misses,cache-references -p $PID -o perf_cache.data -- sleep 60
    sudo perf report -i perf_cache.data --stdio > cache_analysis.txt
fi
```

### Step 8: 即時 CPU 監控
```bash
# 如果有 perf 權限，做即時監控
if sudo perf --help > /dev/null 2>&1; then
    echo "即時 CPU 監控 (30秒) - 按 Ctrl+C 結束"
    timeout 30 sudo perf top -p $PID > perf_top_output.txt
fi
```

## 階段四：網路延遲分析

### Step 9: 網路封包捕獲
```bash
echo "開始網路封包分析..."

# 找出程式使用的網路介面和埠號
NETWORK_INFO=$(ss -tulnp | grep $PID)
echo "網路連線資訊: $NETWORK_INFO" > network_info.txt

# 提取埠號 (簡化版，可能需要調整)
PORTS=$(echo "$NETWORK_INFO" | grep -oE ':[0-9]+' | cut -d: -f2 | sort -u)
echo "監控埠號: $PORTS"

# 捕獲 2 分鐘的網路封包
if [ ! -z "$PORTS" ]; then
    PORT_FILTER=$(echo $PORTS | sed 's/ / or port /g' | sed 's/^/port /')
    echo "開始封包捕獲 (2分鐘)..."
    timeout 120 sudo tcpdump -i any -tt -nn "$PORT_FILTER" -w network_capture.pcap -c 10000
else
    echo "無法確定監控埠號，跳過封包捕獲"
fi
```

### Step 10: 網路中斷檢查
```bash
echo "檢查網路中斷配置..."

# 網路中斷統計
cat /proc/interrupts | head -1 > interrupt_analysis.txt
cat /proc/interrupts | grep -E "eth|em|p[0-9]p[0-9]" >> interrupt_analysis.txt

# 檢查 IRQ balance
echo "IRQ Balance 狀態:" >> interrupt_analysis.txt
systemctl status irqbalance >> interrupt_analysis.txt 2>&1
```

## 階段五：程式特定分析 (10分鐘)

### Step 11: 程式執行緒和親和性
```bash
echo "分析程式執行緒配置..."

# 執行緒資訊
echo "執行緒列表:" > thread_analysis.txt
ps -T -p $PID >> thread_analysis.txt

# CPU 親和性
echo "" >> thread_analysis.txt
echo "CPU 親和性:" >> thread_analysis.txt
for tid in $(ps -T -p $PID | tail -n +2 | awk '{print $2}'); do
    echo "TID $tid: $(taskset -cp $tid 2>/dev/null)" >> thread_analysis.txt
done

# 排程優先權
echo "" >> thread_analysis.txt
echo "排程優先權:" >> thread_analysis.txt
chrt -p $PID >> thread_analysis.txt 2>&1
```

### Step 12: 記憶體使用分析
```bash
echo "記憶體使用分析..."

# 詳細記憶體資訊
cat /proc/$PID/status > memory_status.txt
cat /proc/$PID/smaps > memory_maps.txt

# 檢查記憶體鎖定狀態
echo "記憶體鎖定狀態:" > memory_locks.txt
cat /proc/$PID/status | grep -E "VmLck|VmPin" >> memory_locks.txt
```

## 階段六：結果整理和初步建議 (5分鐘)

### Step 13: 產生分析報告
```bash
cat > analysis_report.txt << 'EOF'
# HFT Latency Debug 分析報告

## 執行資訊
- 程式: trade_server
- PID: 程式PID
- 分析時間: 分析時間
- 分析師: 分析師名稱

## 發現的問題

### 高 CPU 使用率函數 (從 cpu_hotspots.txt)
- 待填入: 檢查 CPU 熱點

### 系統呼叫瓶頸 (從 syscall_summary.txt)
- 待填入: 高頻率系統呼叫

### 記憶體問題
- 待填入: 記憶體使用異常

### 網路延遲
- 待填入: 網路相關問題

## 優化建議

### 立即可執行
1. CPU 親和性設定
2. 程式優先權調整
3. 網路中斷最佳化

### 需要程式碼修改
1. 熱點函數最佳化
2. 系統呼叫減少
3. 記憶體分配最佳化

### 系統層級調整
1. 核心參數調整
2. 網路卡設定
3. 大頁面配置

EOF

# 填入實際資訊
sed -i "s/程式PID/$PID/g" analysis_report.txt
sed -i "s/分析時間/$(date)/g" analysis_report.txt
```

### Step 14: 清理和總結
```bash
echo "分析完成！"
echo ""
echo "產生的檔案："
ls -la *.txt *.csv *.pcap *.data 2>/dev/null

echo ""
echo "下一步建議："
echo "1. 查看 analysis_report.txt 了解整體狀況"
echo "2. 檢查 cpu_hotspots.txt 找出 CPU 瓶頸"
echo "3. 分析 syscall_summary.txt 確認系統呼叫模式"
echo "4. 如有網路問題，用 wireshark 開啟 network_capture.pcap"

# 壓縮所有分析結果
tar -czf latency_debug_results_$(date +%Y%m%d_%H%M).tar.gz *.txt *.csv *.pcap *.data 2>/dev/null
echo "所有結果已打包至: latency_debug_results_$(date +%Y%m%d_%H%M).tar.gz"
```

## 執行這個流程

將上述流程儲存為 `latency_debug.sh`，然後：

```bash
chmod +x latency_debug.sh
./latency_debug.sh
```

整個流程大約需要 70 分鐘，會產生完整的分析報告和建議。

=================================================

# Latency Debug 文件解讀和修正指南

## 1. baseline.txt - 系統資源基準

### 如何解讀
```
CPU 使用率:
PID USER      PR  NI    VIRT    RES    SHR S  %CPU %MEM     TIME+ COMMAND
12345 trader   20   0  2.5g    1.2g   10m S  85.3  7.5   1:23.45 trade_server

記憶體使用:
VmRSS:	 1234567 kB    (實際使用記憶體)
VmSize:	 2345678 kB    (虛擬記憶體大小)
```

### 警告指標
- **CPU > 80%**: 可能有 CPU 瓶頸
- **VmRSS 持續增長**: 記憶體洩漏
- **大量 SHR 記憶體**: 可能有不必要的共享函式庫

### 修正方案
```bash
# 如果 CPU 使用率過高
# 1. 設定 CPU 親和性
taskset -cp 1,2 12345

# 2. 提高程式優先權
sudo chrt -f 95 -p 12345

# 如果記憶體使用異常
# 檢查是否有記憶體碎片
cat /proc/buddyinfo
```

## 2. cpu_usage.csv - CPU 使用率趨勢

### 如何解讀
```
09:30:15,78.2
09:30:16,82.1
09:30:17,91.5  <- 突然飆高
09:30:18,85.3
```

### 分析重點
- **CPU 尖峰**: 找出高 CPU 使用的時間點
- **週期性模式**: 是否有定期的高負載
- **平均值**: 長期 CPU 使用趨勢

### 修正方案
```python
# 分析 CPU 使用模式
import pandas as pd
df = pd.read_csv('cpu_usage.csv', names=['time', 'cpu'])
print(f"平均 CPU 使用率: {df.cpu.mean():.1f}%")
print(f"最高 CPU 使用率: {df.cpu.max():.1f}%")
print(f"CPU > 90% 的次數: {(df.cpu > 90).sum()}")
```

## 3. syscall_summary.txt - 系統呼叫統計

### 如何解讀
```
% time     seconds  usecs/call     calls    errors syscall
------ ----------- ----------- --------- --------- ----------------
 45.23    0.234567        1234     190234         recvfrom
 23.45    0.123456         234     527891         sendto
 12.34    0.064321         123     522345         futex
  8.90    0.046234         456     101234         epoll_wait
  5.67    0.029456         234     125678         write
```

### 關鍵指標
- **% time**: 該系統呼叫占總時間比例
- **usecs/call**: 平均每次呼叫耗時（微秒）
- **calls**: 總呼叫次數
- **errors**: 錯誤次數

### 警告信號
- `recvfrom/sendto` 的 `usecs/call > 100`: 網路延遲高
- `futex` 呼叫頻繁: 鎖競爭嚴重
- `epoll_wait` 耗時長: I/O 等待過多
- `write/read` 錯誤率高: I/O 問題

### 修正方案
```cpp
// 如果 recvfrom 延遲高 - 改用非阻塞 I/O
int flags = fcntl(sockfd, F_GETFL, 0);
fcntl(sockfd, F_SETFL, flags | O_NONBLOCK);

// 如果 futex 呼叫多 - 減少鎖使用
// 改用無鎖資料結構或 atomic 操作
std::atomic<int> counter{0};

// 如果 epoll_wait 耗時 - 調整 timeout
epoll_wait(epfd, events, MAX_EVENTS, 1); // 改為 1ms timeout
```

## 4. network_syscalls.txt - 網路系統呼叫詳情

### 如何解讀
```
09:30:15.123456 recvfrom(4, "market_data...", 1024, 0, NULL, NULL) = 256 <0.000123>
09:30:15.123580 sendto(5, "order_data...", 128, 0, {sa_family=AF_INET...}) = 128 <0.000045>
09:30:15.123625 recvfrom(4, 0x7fff..., 1024, MSG_DONTWAIT, NULL, NULL) = -1 EAGAIN <0.000005>
```

### 分析重點
- **時間戳精度**: 微秒級別的網路操作時序
- **返回值**: 實際傳輸的位元組數
- **耗時**: `<>` 內的時間（秒）
- **錯誤碼**: EAGAIN, EWOULDBLOCK 等

### 常見問題和修正
```cpp
// 問題 1: 頻繁的 EAGAIN 錯誤
// 解決: 使用 epoll 而非輪詢
struct epoll_event ev, events[MAX_EVENTS];
int epollfd = epoll_create1(0);
ev.events = EPOLLIN | EPOLLET; // 邊緣觸發
epoll_ctl(epollfd, EPOLL_CTL_ADD, sockfd, &ev);

// 問題 2: sendto 延遲高
// 解決: 使用更大的 socket buffer
int sndbuf = 1048576; // 1MB
setsockopt(sockfd, SOL_SOCKET, SO_SNDBUF, &sndbuf, sizeof(sndbuf));
```

## 5. cpu_hotspots.txt - CPU 熱點分析

### 如何解讀
```
# Overhead  Command      Shared Object        Symbol
# ........  ...........  ...................  .............................
    25.67%  trade_server  trade_server         [.] order_matching_engine
    18.45%  trade_server  trade_server         [.] market_data_parser
    12.34%  trade_server  libc-2.31.so         [.] __memcpy_avx_unaligned
     8.90%  trade_server  trade_server         [.] price_calculation
     6.78%  trade_server  libstdc++.so.6       [.] std::_Hash_impl::_M_hash_bytes
```

### 分析策略
- **自寫函數 > 20%**: 需要立即最佳化
- **系統函數高**: 可能演算法選擇問題
- **記憶體操作多**: 可能有 cache miss

### 修正範例
```cpp
// 問題: order_matching_engine 占用 25.67% CPU
// 原始程式碼（低效）
for (auto& order : all_orders) {
    if (order.price == target_price) {
        matching_orders.push_back(order);
    }
}

// 最佳化後
// 使用有序容器和二分搜尋
auto range = price_ordered_map.equal_range(target_price);
for (auto it = range.first; it != range.second; ++it) {
    matching_orders.push_back(it->second);
}
```

## 6. cache_analysis.txt - Cache 效能分析

### 如何解讀
```
# Overhead  Command      Shared Object     Symbol
# ........  ...........  ................  .............................
    45.23%  trade_server  trade_server      [.] data_structure_traverse
    23.45%  trade_server  trade_server      [.] hash_table_lookup

Performance counter stats:
     1,234,567      cache-references
       123,456      cache-misses              #   10.00% of all cache refs
```

### 關鍵指標
- **Cache miss rate > 5%**: 記憶體存取模式需要最佳化
- **特定函數 cache miss 高**: 資料結構或演算法問題

### 修正方案
```cpp
// 問題: cache miss rate 高
// 原始程式碼（cache 不友善）
struct Order {
    int64_t timestamp;    // 8 bytes
    char symbol[16];      // 16 bytes  
    double price;         // 8 bytes
    char side;            // 1 byte
    // padding 7 bytes
    int32_t quantity;     // 4 bytes
    // padding 4 bytes
};  // 總計 48 bytes，有 11 bytes padding

// 最佳化後（緊湊佈局）
struct Order {
    int64_t timestamp;    // 8 bytes
    double price;         // 8 bytes
    int32_t quantity;     // 4 bytes
    char symbol[16];      // 16 bytes
    char side;            // 1 byte
    char padding[3];      // 明確的 padding
};  // 總計 40 bytes，減少 cache line 浪費
```

## 7. network_info.txt & network_capture.pcap

### network_info.txt 解讀
```
tcp   LISTEN    0      128    *:12345                *:*                users:(("trade_server",pid=12345,fd=4))
tcp   ESTAB     0      0      192.168.1.100:56789   192.168.1.200:12345 users:(("trade_server",pid=12345,fd=5))
```

### 網路問題檢測
- **大量 LISTEN 埠**: 可能有不必要的服務
- **連線狀態異常**: 檢查連線穩定性

### 使用 Wireshark 分析 network_capture.pcap
```bash
# 命令列分析封包延遲
tshark -r network_capture.pcap -Y "tcp" -T fields -e frame.time_relative -e tcp.analysis.ack_rtt
```

### 網路最佳化
```cpp
// 減少 TCP 延遲
int flag = 1;
setsockopt(sockfd, IPPROTO_TCP, TCP_NODELAY, &flag, sizeof(flag));

// 設定 socket 優先權
int priority = 6;
setsockopt(sockfd, SOL_SOCKET, SO_PRIORITY, &priority, sizeof(priority));
```

## 8. interrupt_analysis.txt - 中斷分析

### 如何解讀
```
           CPU0       CPU1       CPU2       CPU3       
  24:       1234       5678       2345       3456   PCI-MSI eth0-rx-0
  25:       2345       1234       3456       4567   PCI-MSI eth0-tx-0
```

### 問題診斷
- **中斷不均衡**: 所有中斷集中在一個 CPU
- **中斷頻率過高**: 可能需要中斷合併

### 修正方案
```bash
# 設定網路卡中斷親和性
echo 2 > /proc/irq/24/smp_affinity  # 綁定 rx 中斷到 CPU1
echo 4 > /proc/irq/25/smp_affinity  # 綁定 tx 中斷到 CPU2

# 調整網路卡中斷合併
ethtool -C eth0 rx-usecs 50 rx-frames 32
```

## 9. thread_analysis.txt - 執行緒分析

### 如何解讀
```
執行緒列表:
  PID  SPID TTY          TIME CMD
12345 12345 ?        00:01:23 trade_server
12345 12346 ?        00:00:45 trade_server
12345 12347 ?        00:02:10 trade_server

CPU 親和性:
TID 12345: 0-7
TID 12346: 0-7  
TID 12347: 0-7
```

### 最佳化策略
```bash
# 將關鍵執行緒綁定到專用 CPU
taskset -cp 1 12345    # 主執行緒綁定到 CPU1
taskset -cp 2 12346    # 網路執行緒綁定到 CPU2
taskset -cp 3 12347    # 計算執行緒綁定到 CPU3
```

## 10. memory_status.txt & memory_maps.txt

### memory_status.txt 關鍵指標
```
VmRSS:	 1234567 kB    # 實際使用記憶體
VmLck:	       0 kB    # 鎖定記憶體 (應該 > 0 for HFT)
VmSwap:	       0 kB    # swap 使用 (應該為 0)
```

### 記憶體最佳化
```cpp
// 鎖定記憶體避免 swap
if (mlockall(MCL_CURRENT | MCL_FUTURE) != 0) {
    perror("mlockall failed");
}

// 使用大頁面
void* ptr = mmap(NULL, size, PROT_READ|PROT_WRITE, 
                 MAP_PRIVATE|MAP_ANONYMOUS|MAP_HUGETLB, -1, 0);
```

## 綜合分析和優先修正順序

### 1. 立即執行（無需重編譯）
```bash
# CPU 親和性和優先權
taskset -cp 1,2 $(pgrep trade_server)
sudo chrt -f 95 $(pgrep trade_server)

# 網路最佳化
echo 'net.core.busy_poll=50' >> /etc/sysctl.conf
sysctl -p
```

### 2. 系統層級調整（需重開機）
```bash
# 開機參數 (/etc/default/grub)
GRUB_CMDLINE_LINUX="isolcpus=1,2,3 nohz_full=1,2,3 hugepages=1024"
```

### 3. 程式碼修正（按重要性排序）
1. **CPU 熱點函數**：最佳化占用最多 CPU 的函數
2. **系統呼叫減少**：減少高頻系統呼叫
3. **Cache 最佳化**：改善資料結構佈局
4. **記憶體管理**：使用記憶體池，避免動態分配
5. **網路最佳化**：使用更高效的 I/O 模型

### 驗證修正效果
```bash
# 重新執行相同的 latency debug 流程
./latency_debug.sh

# 比較前後差異
diff baseline_before.txt baseline_after.txt
```

每次修正後都要重新測量，確保改善真的有效，避免過度最佳化反而降低效能。




==============================================================

# 針對關鍵函數進行研究
# 精確 Latency Debug - 針對特定函數分析

## 能達到的分析精度

### 1. 函數級別的微秒延遲分析

```bash
# 專門追蹤你的關鍵函數
sudo perf record -g -e cpu-cycles,cache-misses,branch-misses \
  --call-graph dwarf -p $PID -- sleep 120

# 只看你關心的函數
sudo perf report --stdio | grep -A 20 -B 5 "handleIncrementalRefresh\|execute_request"
```

### 2. 端到端延遲測量腳本

```bash
#!/bin/bash
# 建立精確的延遲測量

# 創建專用的分析目錄
mkdir -p hft_precision_debug_$(date +%Y%m%d_%H%M)
cd hft_precision_debug_$(date +%Y%m%d_%H%M)

PID=$(pgrep trade_server)

# 1. 專門追蹤關鍵函數的 CPU 使用
echo "開始精確函數分析..."
sudo perf record -g -e cpu-cycles \
  --call-graph dwarf -p $PID -o perf_functions.data -- sleep 300 &

# 2. 同時追蹤系統呼叫 - 只看網路相關
strace -tt -T -p $PID -e trace=network -f \
  -o network_detailed.trace &

# 3. 記錄記憶體存取模式
sudo perf record -e cache-misses,cache-references,dTLB-misses \
  -p $PID -o memory_pattern.data -- sleep 180 &

wait
echo "數據收集完成，開始分析..."
```

## 具體能分析的內容

### A. handleIncrementalRefresh 函數分析

```bash
# 提取 handleIncrementalRefresh 的詳細效能
sudo perf annotate -i perf_functions.data handleIncrementalRefresh > refresh_analysis.txt

# 分析這個函數的：
# 1. CPU cycles 分佈
# 2. Cache miss 位置  
# 3. 分支預測失敗點
# 4. 熱點程式碼行
```

**能得到的資訊**：
- 函數內哪幾行程式碼最耗時
- 記憶體存取模式是否效率
- 分支預測失敗的 if 條件
- Cache miss 發生在哪些資料結構存取

### B. execute_request 函數分析

```bash
# 分析訂單執行函數
sudo perf report -i perf_functions.data --symbol-filter=execute_request --stdio

# 看函數呼叫鏈
sudo perf report -i perf_functions.data --call-graph graph,0.5 --stdio | 
  grep -A 50 execute_request
```

**能分析**：
- 從決策到送出訂單的完整路徑
- 每個子函數的耗時比例
- 網路發送的實際延遲
- 序列化/反序列化開銷

### C. 端到端延遲路徑分析

```bash
# 建立完整的延遲路徑圖
cat > trace_critical_path.sh << 'EOF'
#!/bin/bash

# 使用 perf probe 在關鍵函數設置探測點
sudo perf probe -a 'handleIncrementalRefresh'
sudo perf probe -a 'execute_request'

# 記錄函數執行時間
sudo perf record -e probe:handleIncrementalRefresh,probe:execute_request \
  -p $PID -o function_timeline.data -- sleep 60

# 分析時間線
sudo perf script -i function_timeline.data > execution_timeline.txt

# 清理探測點
sudo perf probe -d handleIncrementalRefresh
sudo perf probe -d execute_request
EOF
```

## 精確診斷腳本

### 1. 市場數據處理延遲分析

```bash
cat > market_data_latency.sh << 'EOF'
#!/bin/bash

PID=$(pgrep trade_server)

echo "=== 市場數據處理延遲分析 ==="

# A. 網路到應用程式的延遲
echo "1. 捕獲市場數據封包 (2分鐘)..."
timeout 120 sudo tcpdump -i any -tt -s0 port 4001 -w market_packets.pcap &

# B. 同時追蹤 handleIncrementalRefresh 的系統呼叫
echo "2. 追蹤 market data handler..."
sudo strace -tt -T -p $PID -e trace=network,read,write \
  -o market_syscalls.trace &

# C. 專門分析 handleIncrementalRefresh 效能
echo "3. CPU profiling market handler..."
sudo perf record -g -e cpu-cycles,cache-misses \
  --call-graph dwarf -p $PID -o market_perf.data -- sleep 120

wait

echo "分析市場數據處理路徑完成"
EOF
```

### 2. 訂單執行延遲分析

```bash
cat > order_execution_latency.sh << 'EOF'
#!/bin/bash

PID=$(pgrep trade_server)

echo "=== 訂單執行延遲分析 ==="

# A. 追蹤 execute_request 到網路發送
echo "1. 追蹤訂單發送..."
sudo strace -tt -T -p $PID -e trace=network,write \
  -o order_syscalls.trace &

# B. 同時捕獲外送的訂單封包  
echo "2. 捕獲訂單封包..."
timeout 120 sudo tcpdump -i any -tt -s0 port 4002 -w order_packets.pcap &

# C. 分析 execute_request 函數效能
echo "3. CPU profiling order execution..."
sudo perf record -g -e cpu-cycles,cache-misses,branch-misses \
  --call-graph dwarf -p $PID -o order_perf.data -- sleep 120

wait

echo "訂單執行路徑分析完成"
EOF
```

## 進階分析能力

### 1. 函數層級的延遲分解

```python
# Python 腳本分析 perf 數據
cat > analyze_function_latency.py << 'EOF'
#!/usr/bin/env python3
import subprocess
import re

def analyze_function_performance(perf_data_file, function_name):
    """分析特定函數的效能瓶頸"""
    
    # 提取函數的詳細報告
    cmd = f"sudo perf report -i {perf_data_file} --symbol-filter={function_name} --stdio"
    result = subprocess.run(cmd.split(), capture_output=True, text=True)
    
    print(f"\n=== {function_name} 效能分析 ===")
    
    # 解析 CPU 使用率
    cpu_match = re.search(r'(\d+\.\d+)%.*' + function_name, result.stdout)
    if cpu_match:
        cpu_percent = float(cpu_match.group(1))
        print(f"CPU 使用率: {cpu_percent}%")
        
        if cpu_percent > 15:
            print("⚠️  警告: CPU 使用率過高，需要最佳化")
    
    # 分析子函數呼叫
    print("\n子函數呼叫分析:")
    for line in result.stdout.split('\n'):
        if function_name in line and '%' in line:
            print(f"  {line.strip()}")

# 分析兩個關鍵函數
analyze_function_performance("market_perf.data", "handleIncrementalRefresh")  
analyze_function_performance("order_perf.data", "execute_request")
EOF
```

### 2. 記憶體存取模式分析

```bash
# 專門分析你的函數的記憶體行為
cat > memory_access_analysis.sh << 'EOF'
#!/bin/bash

PID=$(pgrep trade_server)

# 使用 perf c2c 分析 cache coherency 問題
sudo perf c2c record -p $PID -- sleep 60
sudo perf c2c report --stdio > cache_coherency.txt

# 分析 TLB miss (Translation Lookaside Buffer)
sudo perf record -e dTLB-misses,iTLB-misses -p $PID -o tlb_analysis.data -- sleep 60
sudo perf report -i tlb_analysis.data --stdio > tlb_report.txt

echo "記憶體存取分析完成"
EOF
```

### 3. 網路延遲精確測量

```bash
# 計算從網路封包到函數執行的精確延遲
cat > network_to_function_latency.py << 'EOF'
#!/usr/bin/env python3
import subprocess
from datetime import datetime

def correlate_network_and_function():
    """關聯網路封包時間和函數執行時間"""
    
    # 解析網路封包時間戳
    tshark_cmd = "tshark -r market_packets.pcap -T fields -e frame.time_epoch"
    packet_times = subprocess.check_output(tshark_cmd.split()).decode().strip().split('\n')
    
    # 解析函數執行時間戳  
    perf_cmd = "sudo perf script -i market_perf.data"
    perf_output = subprocess.check_output(perf_cmd.split()).decode()
    
    print("網路到函數執行延遲分析:")
    print("封包時間 -> 函數執行時間 -> 延遲(微秒)")
    
    # 這裡需要根據實際格式來解析和關聯
    # 能夠計算出從收到封包到函數開始執行的精確延遲
EOF
```

## 能產出的最佳化建議

### 1. 程式碼層級建議

```markdown
### handleIncrementalRefresh 最佳化建議

根據分析結果：
- **第 45 行**: `std::map::find()` 占用 23% CPU
  - 建議: 改用 `std::unordered_map` 或預分配的 array
  
- **第 67 行**: `memcpy()` 有大量 cache miss
  - 建議: 檢查資料對齊，考慮使用 `__builtin_prefetch()`
  
- **第 89 行**: 分支預測失敗率 45%
  - 建議: 重新排列 if-else 條件順序，或使用 `__builtin_expect()`
```

### 2. 系統層級建議

```bash
# 針對你的函數特性調整系統參數
echo 'net.core.busy_read=50' >> /etc/sysctl.conf  # 減少網路延遲
echo 2 > /proc/irq/24/smp_affinity_list           # 網路中斷綁定到專用 CPU
```

### 3. 編譯器最佳化建議

```makefile
# 針對你的熱點函數的編譯選項
CXXFLAGS += -O3 -march=native -mtune=native
CXXFLAGS += -fprofile-generate  # 第一次編譯
# 執行一段時間後
CXXFLAGS += -fprofile-use       # 使用 profile 資訊最佳化
```

## 總結：能達到的精度

1. **微秒級延遲測量**: 精確到函數內的每一行程式碼
2. **端到端路徑分析**: 從網路封包到訂單發送的完整時間線
3. **瓶頸定位**: 精確指出哪個函數、哪行程式碼、哪個資料結構有問題
4. **量化改善效果**: 最佳化前後的精確數值比較
5. **針對性建議**: 基於實際數據的具體程式碼修改建議

有了函數名稱，我們可以做到**手術刀般精確的效能分析**，而不是大範圍的系統監控。