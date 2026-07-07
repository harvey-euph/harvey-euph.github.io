---
title: "筆記: Designing Data Intensive Applications"
date: 2026-05-23 00:00:00 +0800
categories: [Careers, Tech]
tags: [Tech, System Design]
---

<!-- ##  -->

## Watched Vedio

### Hello Interview

- Concurrency in Low-level Design Interviews w/ Staff Engineer

    - Correctness: Shared stats?
        - locks
        - atomic operations

    - Coordination: Work handoff?
        - blocking queue

    - Scarcity: Limited resources?
        - Semaphore
        - blocking queue


- Message Queues in System Design Interviews w/ Meta Staff Engineer

    - Guarentee for message processing:

        - At least once - set status
        - At most once - fire and forget 
        - Exact once (not really possible) - add amount

    - When to use a queue:

        - Async work - user doesn't need result immediately
        - Bursty traffic - Absorb spikes without dropping requests
        - Decoupling - Service scale and fail independency
        - Reliablility - Can afford to lose work. Queue holds messages

    - No good for low-latency

    - When using multiple partitions and consumers, need to tradeoff between ordering and distribution

    - When too much data: 

        - expand the queue size and add consumers
        - fail the producers

    - When comsumer fails:

        - Put into another mq (DLQ) and can investigate cause later

    - When MQ die

        - Replica

- Kafka vs RabbitMQ

    - They solve different problem, some apps may use both

    - Basics:
        - Kafka: Append only log, message lives in it, replay capability
        - RabbitMQ: Message broker

    - Ordering Guerantees:
        - Kafka: seperate message into partitions, ordering are preserved within partition/topic
        - RabbitMQ: Queue are strickly ordered, consumer can be parallel and thus we can trade throughput with ordering

    - Troughput
        - Kafka: Over 1 mm messages / sec
        - RabbitMQ: 40k - 100k messages / sec

    - Latency
        - Kafka: 5 - 50 ms
        - RabbitMQ: 1 - 5 ms for low-volume workloads