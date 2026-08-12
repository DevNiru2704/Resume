---
title: "Cloud and Virtualisation"
subtitle: "The cloud questions BT can ask, weighted the way BT actually uses cloud"
author: "Nirmalya Mandal - BT Group Interview Prep"
date: "Study pack - part 8 of 9"
---

# Why this document exists - the evidence

Three separate signals say cloud can come up:

1. **Your own faculty's question list already contains it.** Question 67 is "What is cloud computing?" and question 68 is "What is virtualization?" - sitting inside the networking section, not as an afterthought.
2. **BT-specific guidance says so.** Indeed's guide to British Telecom interviews states plainly: *"Hiring managers often check your knowledge of network devices, cloud computing and computer networks."* Those three together - which is exactly the shape of your Round 1.
3. **Cloud connectivity is a BT product.** BT sells enterprises their connections *into* the cloud. Its **Global Fabric** network-as-a-service platform offers **Google Cloud Partner Interconnect in 50 of the world's top cloud locations, expanding to 70 during 2026, with a 99.99% reliability SLA**. Separately, BT signed a **five-year agreement with AWS** making it the preferred cloud provider for BT's own internal applications.

**The conclusion that matters:** at BT, cloud questions will lean toward **connectivity and reliability** - how enterprises reach cloud providers, how you keep that link up - rather than developer topics like container orchestration. Weight your revision that way. This document is ordered accordingly: fundamentals first (because that is what a fresher gets asked), then virtualisation, then the cloud *networking* section, which is the part with BT's fingerprints on it.

**Time budget: 30-40 minutes.** This is insurance, not your main event. Networking is still two of the three rounds.

---

# Part A - Cloud fundamentals

## What is cloud computing?

Using computing resources - servers, storage, databases, networking, software - over the internet from a provider, instead of buying and running the hardware yourself. You pay only for what you use and can scale up or down on demand.

**The five characteristics** (if they want the textbook answer): on-demand self-service, broad network access, resource pooling, rapid elasticity, and measured service.

## The three service models

| Model | You get | You manage | Example |
|---|---|---|---|
| **IaaS** - Infrastructure as a Service | Raw virtual machines, storage, networks | The OS, runtime and your application | AWS EC2, Azure VMs, a DigitalOcean droplet |
| **PaaS** - Platform as a Service | A ready platform to deploy code onto | Just your application | Heroku, App Engine, Azure App Service |
| **SaaS** - Software as a Service | Finished software | Nothing but your data and settings | Gmail, Salesforce, Microsoft 365 |

*Simple way to say it:* "IaaS is renting the kitchen, PaaS is renting a kitchen with the equipment set up, SaaS is ordering the meal."

**Honest positioning for you:** "I've worked at the IaaS level - I've rented Linux VPS instances and set them up myself with Nginx, certificates and firewall rules. I haven't worked at scale on the big providers."

## The four deployment models

- **Public cloud** - shared infrastructure from a provider (AWS, Azure, Google Cloud). Cheapest, most elastic.
- **Private cloud** - dedicated infrastructure for one organisation, on-premises or hosted. More control, used where regulation or security demands it.
- **Hybrid cloud** - a mix, with the two connected. Very common in large enterprises: sensitive systems stay private, elastic workloads go public.
- **Multi-cloud** - using more than one public provider, to avoid lock-in or to use the best service from each.

**This is the BT-relevant one.** BT's enterprise customers are almost all hybrid or multi-cloud, and BT sells them the network that joins it all together.

## The main benefits, and the honest trade-offs

**Benefits:** no upfront hardware cost (**CapEx becomes OpEx**), scale in minutes instead of months, pay only for what you use, global reach, built-in redundancy and backup, and the provider handles the physical infrastructure.

**Trade-offs - mention one if asked, it shows balance:** ongoing cost can exceed owning hardware at steady high usage, you depend on someone else's uptime, **vendor lock-in** is real, data residency and compliance get complicated, and **you now depend completely on your network connection** - which is precisely why BT sells dedicated cloud connectivity rather than letting customers reach the cloud over the ordinary internet.

## Terms they may test

- **Scalability vs elasticity** - scalability is being able to grow to handle more load; elasticity is doing it *automatically*, up **and** back down, as demand changes.
- **Vertical vs horizontal scaling** - vertical (scale up) means a bigger machine, simple but capped and usually needs a restart. Horizontal (scale out) means more machines behind a load balancer, harder but effectively unlimited and gives redundancy.
- **Region vs Availability Zone** - a **region** is a geographic area (say Mumbai). An **AZ** is one or more isolated data centres inside that region. You spread across AZs so one data centre failure does not take your service down.
- **High availability vs disaster recovery** - HA keeps the service running through a failure (redundancy, failover). DR is how you recover after a serious loss (backups, a second region). **HA is about not falling over; DR is about getting back up.**
- **RTO and RPO** - Recovery Time Objective is how long you may take to restore. Recovery Point Objective is how much data you may lose. Both are contractual in enterprise deals.
- **The shared responsibility model** - the provider secures the cloud *itself* (hardware, hypervisor, physical sites); the customer secures what they put *in* it (their data, access control, OS patching, configuration). Most cloud breaches are the customer's side - a misconfigured storage bucket, not a hacked data centre.
- **Uptime "nines"** - 99.9% is about **8.8 hours** of downtime a year. **99.99%** is about **52 minutes**. 99.999% is about 5 minutes. *BT and Google Cloud quote 99.99% for Partner Interconnect - so if you say "four nines is roughly 52 minutes a year", that lands well.*

---

# Part B - Virtualisation and containers

## What is virtualisation?

Running multiple virtual machines on one physical machine, each with its own operating system, managed by a **hypervisor**. It exists because a physical server running one application typically wastes most of its capacity. Virtualisation gives better hardware use, isolation between workloads, and the ability to create or destroy a machine in minutes. **It is the foundation the whole cloud is built on.**

## Hypervisor types

- **Type 1 (bare metal)** - runs directly on the hardware. VMware ESXi, Hyper-V, KVM, Xen. Faster and more secure; this is what cloud providers use.
- **Type 2 (hosted)** - runs as an application on top of a normal OS. VirtualBox, VMware Workstation. Used on laptops for testing.

## VMs vs containers - the most likely question here

| | Virtual machine | Container |
|---|---|---|
| Contains | A full guest OS | Just the app and its dependencies |
| Uses | The host's hardware, via a hypervisor | The host's **kernel**, shared |
| Size | Gigabytes | Megabytes |
| Start time | Minutes | Seconds |
| Isolation | Stronger (full OS boundary) | Weaker (shared kernel) |

*Say it as:* "A VM virtualises the hardware and runs a whole operating system. A container virtualises the operating system - it shares the host kernel and only packages the app and its dependencies. That's why containers are megabytes and start in seconds, while VMs are gigabytes and take minutes. The trade-off is isolation: a VM boundary is stronger."

**You can speak from experience here** - you have used Docker. Keep it honest and specific:

> "I've used Docker for deployment. The thing it solved for me was that the application ran the same on my machine and on the server - no more 'it works locally'. I haven't used Kubernetes; I know it orchestrates containers across many machines, handling scheduling, scaling and restarts, but I haven't run it."

**Docker terms, briefly:** an **image** is the read-only template; a **container** is a running instance of that image. A **Dockerfile** describes how to build the image. **Docker Compose** runs several containers together. **Kubernetes** orchestrates containers across a cluster of machines.

---

# Part C - Cloud networking - the BT-shaped part

**This is the section to spend your time on.** It sits exactly where cloud meets networking, which is both what BT sells and what your two networking rounds are about.

## Virtual networks

- **VPC / VNet** - Virtual Private Cloud (AWS) or Virtual Network (Azure). Your own logically isolated network inside the provider's cloud, with an address range you choose - all the subnetting from document 02 applies unchanged.
- **Public vs private subnet** - a public subnet has a route to an internet gateway, so its resources can be reached from the internet. A private subnet does not - databases go there. **This is exactly a DMZ design, just in software.**
- **NAT gateway** - lets instances in a private subnet reach *out* to the internet (for updates) without being reachable *from* it. Same NAT concept as question 12 in document 01.
- **Security group vs network ACL** - a security group is a **stateful** firewall attached to an instance (a reply to allowed outbound traffic is automatically allowed back). A network ACL is **stateless** and applies at the subnet level, so you must write both directions. **The stateful/stateless distinction is a favourite question.**
- **Load balancer** - distributes traffic across instances, across availability zones. Same idea as question 70 in document 01.
- **CDN** - a content delivery network caches content at edge locations near users to cut latency. CloudFront, Cloud CDN.
- **Cloud DNS** - Route 53 (AWS), Cloud DNS (Google). Same DNS from document 01, run as a managed service, usually with health checks so it can route around a failed region.

## Getting an enterprise *into* the cloud - three ways, in order of quality

| Method | What it is | Trade-off |
|---|---|---|
| **Over the public internet** | Just reach the cloud like any website | Cheapest, zero setup, but unpredictable latency and no guarantee |
| **Site-to-site VPN** | Encrypted IPsec tunnel from the office router to the cloud | Secure and cheap, but still rides the public internet, so performance varies |
| **Dedicated interconnect** | A private circuit into the provider - **AWS Direct Connect**, **Azure ExpressRoute**, **Google Cloud Interconnect / Partner Interconnect** | Consistent low latency, higher bandwidth, an SLA, and traffic never touches the public internet. Costs more and takes time to provision |

**This table is the single most valuable thing in this document.** It is the bridge between "cloud computing" and "what BT actually sells", and it reuses the site-to-site VPN and MPLS material from document 02.

*The sentence to have ready:* "The interesting part to me is that once a company's systems are in the cloud, the network becomes the thing everything depends on - so how you connect matters. You can go over the public internet, or over an IPsec VPN, or take a dedicated interconnect like Direct Connect or Google's Partner Interconnect, where you get consistent latency and an actual SLA. That's the part BT provides."

## BT's own cloud story - two facts, said confidently

- **Global Fabric** is BT's network-as-a-service platform. Through it BT offers **Google Cloud Partner Interconnect in 50 of the world's top cloud locations, going to 70 during 2026, with a 99.99% reliability SLA**, along with Google's Cloud WAN service. The point of the platform is that a multinational can turn connectivity to clouds, AI services and SaaS up and down on demand rather than ordering circuits for months.
- **BT and AWS** signed a **five-year agreement** making AWS the preferred cloud provider for BT's own internal applications, moving legacy systems toward cloud-native microservices.

**How to use this:** do not recite it. Deploy one line if cloud comes up: *"I read that BT offers Google Cloud Partner Interconnect through Global Fabric with a 99.99% SLA - which made the point to me that BT isn't just a customer of cloud, it sells the connectivity into it."* That single sentence proves you researched the company **and** understood the role, in one move.

---

# Part D - What you can honestly claim

Keep this tight. Claim only these:

- **Linux VPS deployment** - you have rented and configured Linux servers yourself: Nginx as a reverse proxy, DNS records, Let's Encrypt TLS certificates, firewall rules, SSH key access.
- **Docker** - you have containerised and deployed applications.
- **Managed cloud services** - you have used managed platforms (a hosted PostgreSQL, media storage) rather than running everything yourself.

**Do not claim:** AWS or Azure certifications, Kubernetes in production, designing cloud architectures, or Terraform. If asked about any of them, use the formula from document 02 - **admit, give the adjacent thing you do know, say how you would find out.**

> "I haven't used AWS properly - my deployments have been on plain Linux VPS instances that I set up myself. Which honestly means I've done the underlying work by hand: the reverse proxy, the certificates, the firewall, the DNS. I'd expect that to transfer, and the managed services to be the new part."

That answer is genuinely strong. Someone who configured Nginx and DNS by hand understands what a load balancer and Route 53 are *doing*, and that is a better foundation than someone who has only clicked through a console.

---

# The likely questions, with short answers

**"What is cloud computing?"** → Computing resources over the internet from a provider instead of owning hardware, paid for as you use them, scaled on demand.

**"IaaS, PaaS, SaaS?"** → Raw infrastructure / a platform to deploy onto / finished software. Kitchen, equipped kitchen, delivered meal.

**"Public, private, hybrid?"** → Shared provider infrastructure / dedicated to one organisation / a connected mix. Most large enterprises are hybrid or multi-cloud.

**"Advantages of cloud?"** → No upfront hardware cost, scale in minutes, pay per use, global reach, built-in redundancy. Trade-offs: ongoing cost, dependency on the provider and on your network link, lock-in, data residency.

**"What is virtualisation?"** → Running multiple virtual machines on one physical machine via a hypervisor - better hardware use and isolation. It is what the cloud is built on.

**"VM vs container?"** → A VM carries a full guest OS; a container shares the host kernel and packages only the app. Gigabytes and minutes versus megabytes and seconds; VMs isolate more strongly.

**"Have you used AWS?"** → Honest answer above. VPS, Docker, managed services; not the large providers at scale.

**"How would a company connect its office to the cloud?"** → Public internet, site-to-site IPsec VPN, or a dedicated interconnect like Direct Connect / ExpressRoute / Google Partner Interconnect. Increasing cost, increasing predictability and an SLA.

**"What is a security group?"** → A stateful firewall on a cloud instance - return traffic for an allowed connection is permitted automatically. A network ACL is stateless and works at the subnet level.

**"What does 99.99% availability mean?"** → About 52 minutes of downtime a year. 99.9% is about 8.8 hours.

**"Why does cloud matter to a telecom company?"** → Because when a customer's systems move to the cloud, their business now depends entirely on the network path to it. That turns connectivity into a critical service with SLAs attached - which is why BT sells dedicated cloud interconnects, and why service assurance on those links matters.

*That last answer ties cloud, networking and the job together. If cloud comes up at all, aim to land there.*

---

# Quick-fire table

| Thing | Answer |
|---|---|
| Cloud, in one line | Computing resources over the internet, pay as you use, scale on demand |
| IaaS / PaaS / SaaS | Infrastructure / platform / finished software |
| Deployment models | Public, private, hybrid, multi-cloud |
| Hypervisor types | Type 1 bare metal (cloud), Type 2 hosted (laptop) |
| VM vs container | Full guest OS vs shared host kernel; GB/minutes vs MB/seconds |
| Region vs AZ | Geographic area vs isolated data centre within it |
| Scalability vs elasticity | Can grow vs grows and shrinks automatically |
| Vertical vs horizontal | Bigger machine vs more machines |
| Security group vs NACL | Stateful, per instance vs stateless, per subnet |
| Public vs private subnet | Has a route to the internet gateway vs does not |
| NAT gateway | Private instances reach out, cannot be reached in |
| Cloud connectivity options | Internet, IPsec VPN, dedicated interconnect |
| AWS / Azure / Google names | Direct Connect / ExpressRoute / Cloud Interconnect |
| Shared responsibility | Provider secures the cloud, customer secures what is in it |
| 99.99% | ~52 minutes downtime per year |
| HA vs DR | Don't fall over vs get back up |
| BT's platform | Global Fabric - Google Cloud Partner Interconnect, 50 locations to 70 in 2026, 99.99% SLA |

---

# Sources

- BT and Google Cloud, Global Fabric, Partner Interconnect and the 99.99% SLA - [BT newsroom](https://newsroom.bt.com/driving-ahead-with-google-cloud/)
- BT's five-year AWS agreement as preferred cloud provider for internal applications - [BT newsroom](https://newsroom.bt.com/bt-signs-five-year-agreement-with-aws-as-preferred-cloud-provider-for-internal-applications-to-accelerate-its-digital-transformation/), [Computer Weekly](https://www.computerweekly.com/news/366629803/BT-Group-ramps-up-its-cloud-transformation-efforts-with-another-five-year-AWS-deal)
- "Hiring managers often check your knowledge of network devices, cloud computing and computer networks" - [Indeed, British Telecom interview questions](https://in.indeed.com/career-advice/interviewing/british-telecom-interview-questions)
- Questions 67 and 68 of your placement cell's list - `bt_questions_email.md`
