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
    - Out of scope (Can list down and discuss/confirm whether need to reconsider the priority between other requirements)
2. Core Entities
3. APIs: Corresponds to Functional Requirements.
4. High-Level Design
    - Primary Goal: Satisfy Functional Requirements.
5. Deep Dives
    - Primary Goal: Satisfy Non-Functional Requirements.

發現其實畫線畫部件都簡單，難就難在你有哪些想法可以降低延遲增加 through-put

## Cases

### [Design Ticketmaster](https://www.youtube.com/watch?v=fhdPyoO6aXI)

An online platform that allows users to purchase tickets for concerts, sports, and other live entertainment. Has around 100M DAU.

1. Requirements

    - Functional Requirements
        - View contents
        - Search for events.
        - Book a ticket.

    - Non-Functional Requirements
        - Inter-mediate ans: consistency >> availability: no double booking.
        - Senoir ans: Strong consistency for booking ticket & high availability for searching and viewing events.
        - law-latency search
        - read >> write
        - scalability to handle surges from popular events.

    ---

    - Out of scope
        - GDPR compliance
        - fault tolerance
        - etc.

2. Core Entities
    - Event
    - Venue
    - Performer
    - Ticket

3. APIs
    - GET /event/:eventId -> Event & Venue & Performer & Ticket[]
    - GET /search?term={term}&location={location}&type={type}&date={date} -> Partial<Event>[]
    - POST /booking/reserve
      header: JWT | sessionToken
      body:{
        ticketId
      }
    - PUT /booking/confirm
      header: JWT | sessionToken
      body:{
        ticketId,
        paymentDetails
      }
4. High-Level Design
    - Primary Goal: Satisfy Functional Requirements.
5. Deep Dives
    - Primary Goal: Satisfy Non-Functional Requirements.