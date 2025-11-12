---
title: "一邊執行程式一邊修改程式"
date: 2025-10-27 00:00:00 +0800
categories: [Careers, Tech]
tags: [C++, Tech]
---

> 本篇提及內容為危險操作，不建議使用在正式運行環境
{: .prompt-tip }

讓我們看這段程式碼

```cpp
#include <stdio.h>
#include <stdint.h>
#include <unistd.h>
#include <sys/mman.h>
#include <string.h>

__attribute__((noinline, noclone)) void hello() { puts("Hello"); }

int main()
{
    unsigned char *p = (unsigned char*) (uintptr_t) hello;

    long pagesize = sysconf(_SC_PAGESIZE);
    void *page = (void*)((uintptr_t)p & ~(pagesize - 1));

    if (mprotect(page, pagesize, PROT_READ | PROT_WRITE | PROT_EXEC) != 0) {
        perror("mprotect");
        return 1;
    }

    p[0] = 0xC3;

    __builtin___clear_cache((char*)page, (char*)page + pagesize);
    
    puts("==============");
    hello();
    puts("==============");

    return 0;
}
```
{: file='test.cpp'}

這裡定義了一個函數 hello，會印出 "Hello"，並且在 main 函數做了一些操作之後呼叫了 hello，輸出的結果是:

```
Program returned: 0
Program stdout
==============
==============
```

本該出現的 "Hello" 不見了!

這是因為呼叫 hello() 之前，我們做的事是:

1. 找到 hello 函數的地址
2. 獲取該函數所在的記憶體頁面
3. 將頁面屬性改為可寫 (程式碼所在的 .text 段原本是不可寫的)
4. 將該函數進入的第一個指令改為 0xC3，這在 x86 的架構是 return 的指令，所以如果硬體不是 x86 的話會出錯
5. 清理 CPU 快取，避免 hello 修改前的指令已經被載入了，確保稍後載入的指令是修改後的結果

因此在呼叫 hello 時，一進入函數馬上就被 return 了，就不會印出 "Hello" 了

> 再次強調直接修改記憶體中的程式碼是非常危險的操作，很容易出現錯誤，或者直接被作業系統的安全機制擋住
{: .prompt-tip }

<!-- 儘管這是一個危險的操作，但我們可以從這短短的 30 行程式學到一些很重要的東西，想順便整理一下 -->

<!-- 1. memory page and its attr -->

<!-- 2. asm instruction in x86 -->
<!-- 3. CPU cache -->
<!-- 4. 函數呼叫 -->

