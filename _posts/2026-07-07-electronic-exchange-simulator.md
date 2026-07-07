---
title: "From a Simple Exercise to a Full-Stack Low-Latency Exchange"
date: 2026-07-06 00:00:00 +0800
categories: [Careers, Tech, Portfolio]
tags: [Tech, C++, Systems Engineering, AI, LinkedIn]
---

![Exchange web look](/assets/img/exchange.png)

It all started as a simple practice exercise: build a basic C++ matching engine. But if you’ve ever caught the performance optimization bug, you know how quickly things escalate. 

My relentless pursuit of lower latency and higher throughput turned that single component into a massive learning journey. What I ended up with is a complete, high-performance exchange ecosystem built from scratch—and an entirely new perspective on modern software engineering.

Here’s the story of how it evolved and what I learned along the way.

### Down the Systems Engineering Rabbit Hole

Once the core deterministic matching logic was working (supporting strict price-time priority, partial fills, and rapid cancellations), I realized the real bottleneck wasn't the matching algorithms—it was the I/O. 

To fix this, I had to completely decouple the system architecture. I dove into modern C++ memory management, engineering lock-free shared memory (SHM) ring buffers and memory-mapped (Mmap) files to achieve ultra-fast, zero-copy Inter-Process Communication. For the networking gateways, I implemented WebSocket streaming and utilized zero-allocation FlatBuffers for serialization to practically eliminate garbage collection overhead.

But then I hit a classic engineering wall: *You can’t optimize what you can’t measure.* 

While my comfort zone was application-level C++, I knew I had to go deeper. I integrated a Linux eBPF latency tracer. By observing hardware Performance Monitoring Unit (PMU) metrics and hooking into the network stack, I was able to mathematically isolate kernel network overhead from my application processing time. I started experimenting with OS-level tuning—like thread CPU affinity and scheduling—just to see how much more performance I could squeeze out of the Linux environment.

### The Secret Weapon: AI-Assisted Development

Building an ecosystem this complex alone is daunting, but I didn't work entirely alone. I deeply integrated AI assistants into my daily engineering workflow. 

Rather than just generating boilerplate code, I used AI as a true pair-programmer. We co-worked to rapidly implement new features, iteratively revise system architectures, and aggressively drive Test-Driven Development (TDD). This workflow was a massive force multiplier. It allowed me to efficiently break down complex problems and confidently overcome technical hurdles (like learning eBPF or building a modern web app) that were initially outside my immediate expertise.

### Tying it All Together

A low-latency backend isn't very useful if it breaks under pressure or freezes the client. To prove the system's resilience, I wrote automated trading agents in C++ and Python (a Market Maker and a Stress Trader) to simulate high-frequency market chaos and rigorously load-test the infrastructure.

Then, I built a premium React/TypeScript frontend. I implemented dynamic data throttling and state decoupling so the UI could effortlessly handle massive bursts of live order book updates without the browser freezing up. 

Finally, because I believe in true end-to-end ownership, I ensured the project was production-ready by writing automated tests, containerizing it with Docker, and setting up robust CI/CD pipelines via GitHub Actions, preparing it for cloud deployment (AWS/GCP).

### What's Next?

This project was a labor of love, but it proved to me that with a proactive problem-solving mindset, a strong foundation across multiple languages (C/C++, Python, Shell), and modern AI tools, there is no stack too deep or too broad to master.

I am now looking for my next challenge. I'm actively seeking opportunities to join a team where I can leverage these skills to solve hard problems in systems engineering, high-performance applications, or core backend infrastructure. 

If your team is building fast, robust software and values engineers who take ownership from the kernel all the way up to the cloud—let’s connect!
