---
title: "A High-Performance Exchange Ecosystem"
date: 2026-07-06 00:00:00 +0800
categories: [Careers, Tech, Portfolio]
tags: [Tech, C++, Systems Engineering, AI, LinkedIn, Low-Latency]
---

<img src="/assets/img/exchange.png" alt="Exchange web look" style="border-radius: 12px;">

## The Vision & Journey

What started as a simple exercise in building a C++ matching engine has evolved into a comprehensive, high-performance exchange ecosystem. This project serves as a showcase of my engineering capabilities and my continuous pursuit of system optimization. 

By pushing the boundaries of low-latency systems, I transformed a standalone engine into a fully-fledged trading platform that integrates every system design principle and technology stack I have mastered.

[**Live Demo / Web Interface**](https://harvey-exchange.duckdns.org/) | [**GitHub Repository**](https://github.com/harvey-euph/Electronic-Exchange-Simulator)

## Extreme Performance: 2-3 Million TPS

At the heart of the ecosystem is a deterministic, multi-core Matching Engine engineered for extreme throughput. Through rigorous benchmarking, continuous testing, and systematic bottleneck elimination, the core engine achieves an astonishing **2 to 3 Million Transactions Per Second (TPS)**. 

To accomplish this, I heavily relied on advanced low-level system engineering:
- **Lock-Free IPC**: Replaced traditional sockets with lock-free Shared Memory (SHM) Ring Buffers and Memory-Mapped (Mmap) files, ensuring ultra-fast, zero-copy Inter-Process Communication between the client gateway and the engine.
- **Decoupled Architecture via Shared Mmap Log**: Multiple downstream components (like market data publishers and database writers) share and read from the same Memory-Mapped (Mmap) append log. This completely decouples the Matching Engine from external I/O and business logic, minimizing its processing time and ensuring peak throughput.

## Deep Observability (eBPF)

You can't optimize what you can't measure. To truly understand and eliminate microsecond-level latency, I built custom Linux eBPF latency tracers.
- **Kernel-to-User Space Tracing**: By hooking into kernel network stacks (`kprobes`) and user-space C++ functions (`USDT`), the tracer breaks down the order lifecycle into multiple distinct stages.
- **Hardware-Level Profiling**: Leveraged Performance Monitoring Unit (PMU) metrics to track Cache Misses, Branch Misses, and Page Faults, which directly guided my data cache alignment and CPU affinity optimizations.

## A Complete Trading Infrastructure

Beyond the core engine, this project represents a complete, production-ready trading system:
- **Resilient Architecture & DB Design**: Designed robust database schemas with decoupled background polling, ensuring that database I/O never blocks the core matching logic.
- **Custom Trading APIs**: Developed WebSocket and HTTP protocols capable of handling algorithmic trading inputs and real-time execution reporting.
- **Automated Stress Testing**: Built custom C++ Market Makers and Chaos Stress Traders to simulate massive bursts of orders, validating system stability under high-frequency market chaos.
- **Dynamic Frontend**: With the assistance of AI, I developed a modern React/TypeScript web interface featuring dynamic data throttling. It seamlessly renders massive bursts of real-time L2/L3 orderbook updates without freezing the browser's main thread.

This ecosystem reflects my core philosophy as a Software Engineer: diving deep into OS-level optimizations while maintaining a broad, architectural vision to build reliable, scalable, and high-performance distributed systems.
