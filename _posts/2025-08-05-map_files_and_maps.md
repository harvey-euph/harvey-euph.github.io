---
title: "為什麼 Process 的 root 可能不是系統的 root"
# description: 
date: 2025-08-11 12:00:00 +0800
categories: [Careers, Linux]
tags: [Tech, Linux]
---

>本頁施工中，尚未整理完成
{: .prompt-warning }

### map_files and maps

它們其實是差不多的內容，但有一點細微差異
- `map_files`: 整理出指向對應檔案的 `symlink`，方便程式操作
- `maps`: 以純文字列出該 `process` 的記憶體映射區段，方便閱讀

```
root@LAPTOP-HARVEY:/proc/287/map_files# ls -l
total 0
lr-------- 1 root root 64 Aug 10 17:18 5912f9abf000-5912f9ac2000 -> /usr/sbin/agetty
lr-------- 1 root root 64 Aug 10 17:18 5912f9ac2000-5912f9ac9000 -> /usr/sbin/agetty
lr-------- 1 root root 64 Aug 10 17:18 5912f9ac9000-5912f9acb000 -> /usr/sbin/agetty
lr-------- 1 root root 64 Aug 10 17:18 5912f9acc000-5912f9acd000 -> /usr/sbin/agetty
lr-------- 1 root root 64 Aug 10 17:18 5912f9acd000-5912f9ace000 -> /usr/sbin/agetty
lr-------- 1 root root 64 Aug 10 17:18 7cc76d400000-7cc76d428000 -> /usr/lib/x86_64-linux-gnu/libc.so.6
lr-------- 1 root root 64 Aug 10 17:18 7cc76d428000-7cc76d5bd000 -> /usr/lib/x86_64-linux-gnu/libc.so.6
lr-------- 1 root root 64 Aug 10 17:18 7cc76d5bd000-7cc76d615000 -> /usr/lib/x86_64-linux-gnu/libc.so.6
lr-------- 1 root root 64 Aug 10 17:18 7cc76d615000-7cc76d616000 -> /usr/lib/x86_64-linux-gnu/libc.so.6
lr-------- 1 root root 64 Aug 10 17:18 7cc76d616000-7cc76d61a000 -> /usr/lib/x86_64-linux-gnu/libc.so.6
lr-------- 1 root root 64 Aug 10 17:18 7cc76d61a000-7cc76d61c000 -> /usr/lib/x86_64-linux-gnu/libc.so.6
lr-------- 1 root root 64 Aug 10 17:18 7cc76d6b2000-7cc76d709000 -> /usr/lib/locale/C.utf8/LC_CTYPE
lr-------- 1 root root 64 Aug 10 17:18 7cc76d70f000-7cc76d716000 -> /usr/lib/x86_64-linux-gnu/gconv/gconv-modules.cache
lr-------- 1 root root 64 Aug 10 17:18 7cc76d718000-7cc76d71a000 -> /usr/lib/x86_64-linux-gnu/ld-linux-x86-64.so.2
lr-------- 1 root root 64 Aug 10 17:18 7cc76d71a000-7cc76d744000 -> /usr/lib/x86_64-linux-gnu/ld-linux-x86-64.so.2
lr-------- 1 root root 64 Aug 10 17:18 7cc76d744000-7cc76d74f000 -> /usr/lib/x86_64-linux-gnu/ld-linux-x86-64.so.2
lr-------- 1 root root 64 Aug 10 17:18 7cc76d750000-7cc76d752000 -> /usr/lib/x86_64-linux-gnu/ld-linux-x86-64.so.2
lr-------- 1 root root 64 Aug 10 17:18 7cc76d752000-7cc76d754000 -> /usr/lib/x86_64-linux-gnu/ld-linux-x86-64.so.2
```

```
root@LAPTOP-HARVEY:/proc/287# cat maps
5912f9abf000-5912f9ac2000 r--p 00000000 08:30 17375                      /usr/sbin/agetty
5912f9ac2000-5912f9ac9000 r-xp 00003000 08:30 17375                      /usr/sbin/agetty
5912f9ac9000-5912f9acb000 r--p 0000a000 08:30 17375                      /usr/sbin/agetty
5912f9acc000-5912f9acd000 r--p 0000c000 08:30 17375                      /usr/sbin/agetty
5912f9acd000-5912f9ace000 rw-p 0000d000 08:30 17375                      /usr/sbin/agetty
5912f9ace000-5912f9ad0000 rw-p 00000000 00:00 0
591309bbd000-591309bde000 rw-p 00000000 00:00 0                          [heap]
7cc76d400000-7cc76d428000 r--p 00000000 08:30 114531                     /usr/lib/x86_64-linux-gnu/libc.so.6
7cc76d428000-7cc76d5bd000 r-xp 00028000 08:30 114531                     /usr/lib/x86_64-linux-gnu/libc.so.6
7cc76d5bd000-7cc76d615000 r--p 001bd000 08:30 114531                     /usr/lib/x86_64-linux-gnu/libc.so.6
7cc76d615000-7cc76d616000 ---p 00215000 08:30 114531                     /usr/lib/x86_64-linux-gnu/libc.so.6
7cc76d616000-7cc76d61a000 r--p 00215000 08:30 114531                     /usr/lib/x86_64-linux-gnu/libc.so.6
7cc76d61a000-7cc76d61c000 rw-p 00219000 08:30 114531                     /usr/lib/x86_64-linux-gnu/libc.so.6
7cc76d61c000-7cc76d629000 rw-p 00000000 00:00 0
7cc76d6b2000-7cc76d709000 r--p 00000000 08:30 113992                     /usr/lib/locale/C.utf8/LC_CTYPE
7cc76d709000-7cc76d70c000 rw-p 00000000 00:00 0
7cc76d70f000-7cc76d716000 r--s 00000000 08:30 154117                     /usr/lib/x86_64-linux-gnu/gconv/gconv-modules.cache
7cc76d716000-7cc76d718000 rw-p 00000000 00:00 0
7cc76d718000-7cc76d71a000 r--p 00000000 08:30 114515                     /usr/lib/x86_64-linux-gnu/ld-linux-x86-64.so.2
7cc76d71a000-7cc76d744000 r-xp 00002000 08:30 114515                     /usr/lib/x86_64-linux-gnu/ld-linux-x86-64.so.2
7cc76d744000-7cc76d74f000 r--p 0002c000 08:30 114515                     /usr/lib/x86_64-linux-gnu/ld-linux-x86-64.so.2
7cc76d750000-7cc76d752000 r--p 00037000 08:30 114515                     /usr/lib/x86_64-linux-gnu/ld-linux-x86-64.so.2
7cc76d752000-7cc76d754000 rw-p 00039000 08:30 114515                     /usr/lib/x86_64-linux-gnu/ld-linux-x86-64.so.2
7ffeb9c4b000-7ffeb9c6c000 rw-p 00000000 00:00 0                          [stack]
7ffeb9ddc000-7ffeb9de0000 r--p 00000000 00:00 0                          [vvar]
7ffeb9de0000-7ffeb9de2000 r-xp 00000000 00:00 0                          [vdso]
```