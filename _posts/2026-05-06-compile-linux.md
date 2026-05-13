---
title: "Linux Kernel 編譯紀錄"
date: 2026-05-06 00:00:00 +0800
categories: [Careers, Tech]
tags: [Linux, Tech]
---

## 安裝必要套件和編譯 Linux 核心

```sh
sudo apt update
sudo apt install -y \
    build-essential \
    libncurses-dev \
    bison flex \
    libssl-dev \
    libelf-dev \
    qemu-system-x86 \
    bc \
    dwarves \
    cpio

git clone --depth=1 https://github.com/torvalds/linux.git
cd linux

make defconfig
make -j$(nproc)
```

## 準備 root filesystem

```sh
mkdir rootfs
cd rootfs
mkdir -p bin sbin proc sys dev etc

sudo apt install busybox-static
cp /bin/busybox ./bin/
cd bin
ln -s busybox sh
cd ..
vim init # paste the following text
```

```sh
#!/bin/sh

mount -t proc none /proc
mount -t sysfs none /sys
mount -t devtmpfs none /dev

echo "Boot success!"
exec /bin/sh
```

## 執行

```sh
chmod +x init
find . | cpio -o --format=newc > ../initramfs.cpio
cd ..

qemu-system-x86_64 \
    -kernel arch/x86/boot/bzImage \
    -initrd initramfs.cpio \
    -nographic \
    -append "console=ttyS0"
```

## Debug

```sh
qemu-system-x86_64 \
    -kernel arch/x86/boot/bzImage \
    -initrd initramfs.cpio \
    -nographic \
    -append "console=ttyS0 nokaslr" \
    -s -S
```

開另一個終端

```sh
gdb vmlinux

(gdb) target remote :1234
(gdb) set pagination off
(gdb) b start_kernel
(gdb) b rest_init
(gdb) b kernel_init
# ... Other kernel funtion you want to trace
(gdb) c
```

