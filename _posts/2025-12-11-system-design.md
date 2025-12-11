---
title: "筆記: System Design"
date: 2025-12-10 00:00:00 +0800
categories: [Life, Travel]
tags: [Japan, Travel]
math: true
---

打算先看 [System Design Walkthroughs](https://www.youtube.com/playlist?list=PL5q3E8eRUieWtYLmRU3z94-vGRcwKr9tM) 影片來學

## Apporach

1. Requirements
    - Functional Requirements: Allowed operations/Features of the system.
    - Non-Functional Requirements: Quality of the system. (scalability, availability, reliability, fault tolerance)
2. Core Entities
3. APIs
4. High-Level Design
    - Primary Goal: Satisfy Functional Requirements.
5. Deep Dives
    - Primary Goal: Satisfy Non-Functional Requirements.

## Cases

### [Design Ticketmaster](https://www.youtube.com/watch?v=fhdPyoO6aXI)

An online platform that allows users to purchase tickets for concerts, sports, and other live entertainment. Has around 100M DAU.

1. Requirements

    - Functional Requirements
        - Book a ticket.
        - View contents
        - Search for events.

    - Non-Functional Requirements
        - Inter-mediate ans: consistency >> availability: no double booking.
        - Senoir ans: Strong consistency for booking ticket & high availability for searching and viewing events.
        - read >> write
        - scalability to handle surges from popular events.

    ---
    
    - Out of scope
        - GDPR compliance
        - fault tolerance
        - etc.

2. Core Entities
3. APIs
4. High-Level Design
    - Primary Goal: Satisfy Functional Requirements.
5. Deep Dives
    - Primary Goal: Satisfy Non-Functional Requirements.