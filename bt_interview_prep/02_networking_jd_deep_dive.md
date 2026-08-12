---
title: "Networking Deep Dive - The Job Description Topics"
subtitle: "Subnetting, switching, routing, redundancy, WAN and the Cisco gap"
author: "Nirmalya Mandal - BT Group Interview Prep"
date: "Study pack - part 2 of 10"
---

# Why this document exists

Document 01 covers the 80 questions your faculty sent. But the BT job description names a second, harder set of topics that the faculty list does not touch:

> OSI, TCP/IP with LLC / flow control / link negotiation. IP addressing and subnetting. Bridging and switching. Ethernet, CSMA/CD, STP, RSTP, MSTP, VLAN tagging, LACP. Routing: RIP, OSPF, IGRP, EIGRP, BGP. VRRP, HSRP, GLBP. Core, distribution and edge switches - 3-tier architecture. WAN side protocols. Stacking, VLANs, L2, L3, 1G/10G, optical fibre SFP/SFP+. Cisco routers with load balancing, WAN failover, MPLS, site-to-site VPN, router HA. Application layer protocols: IP, ARP, ICMP, TCP, UDP, DNS, SNMP, TFTP, FTP, HTTP/HTTPS, BootP. Ethernet concepts and cabling. Device authentication, user authentication, SMTP.

**Be realistic about this.** They are describing someone with 1-3 years of network operations experience and ideally a CCNP. You are a final-year student. **You are not expected to know all of this**, and pretending you do is the fastest way to fail.

What is expected is that you **recognise every term, can say roughly what it does, and are visibly not scared of it.** That is achievable in two hours, and it is what this document gives you. There is a section at the end on how to say "I don't know that one" in a way that actually helps you.

---

# 1. Subnetting - the part you should actually practise

This is the topic most likely to be turned into a "work it out for me" question. Everything else in this document you can talk about; this one you may have to *do*.

## The CIDR table - memorise this

| CIDR | Subnet mask | Block size | Usable hosts |
|---|---|---|---|
| /24 | 255.255.255.0 | 256 | 254 |
| /25 | 255.255.255.128 | 128 | 126 |
| /26 | 255.255.255.192 | 64 | 62 |
| /27 | 255.255.255.224 | 32 | 30 |
| /28 | 255.255.255.240 | 16 | 14 |
| /29 | 255.255.255.248 | 8 | 6 |
| /30 | 255.255.255.252 | 4 | 2 |

**Usable hosts = block size - 2** (one address is the network address, one is the broadcast address).

The mask values only ever come from this sequence: **128, 192, 224, 240, 248, 252, 254, 255.**

## The method - use this every time

Given `192.168.10.100/26`:

1. **Block size** = 256 - 192 (the interesting octet of the mask) = **64**.
2. **Subnets start at multiples of the block size:** 0, 64, 128, 192.
3. **100 falls between 64 and 128**, so the network is **192.168.10.64**.
4. **Broadcast** = next network - 1 = **192.168.10.127**.
5. **Usable range** = **192.168.10.65 to 192.168.10.126**.
6. **Usable hosts** = 62.

**Practise these three on paper right now. Do not just read them.**

| Given | Network | Broadcast | First-last usable |
|---|---|---|---|
| 172.16.5.20/28 | 172.16.5.16 | 172.16.5.31 | .17 - .30 |
| 10.1.1.200/27 | 10.1.1.192 | 10.1.1.223 | .193 - .222 |
| 192.168.1.130/25 | 192.168.1.128 | 192.168.1.255 | .129 - .254 |

## Other subnetting facts they may ask

- **Private address ranges** (RFC 1918): `10.0.0.0/8`, `172.16.0.0/12`, `192.168.0.0/16`. These are not routable on the internet, which is why NAT exists.
- **Loopback:** `127.0.0.0/8`, usually `127.0.0.1`.
- **APIPA / link-local:** `169.254.0.0/16`. **If a machine has a 169.254 address, DHCP failed** - that is a very common troubleshooting question.
- **Class A/B/C:** A = 1-126 (/8), B = 128-191 (/16), C = 192-223 (/24). D = 224-239 multicast, E = 240-255 experimental. Classes are historical; CIDR replaced them.
- **Why subnet at all?** To reduce broadcast traffic, improve security by separating groups, and use address space efficiently.
- **VLSM** - Variable Length Subnet Masking - using different mask sizes for different subnets so you do not waste addresses on a link that only needs two.

---

# 2. Ethernet, cabling and the physical side

The JD says "software **and** hardware", and round 1 is explicitly both.

- **Ethernet** is the standard for wired LANs, defined in IEEE **802.3**. Data is carried in frames with a source MAC, destination MAC, type field, payload and a CRC for error checking.
- **CSMA/CD** - Carrier Sense Multiple Access with Collision Detection. The old rule for a shared medium: listen before you send (carrier sense); if two devices send at once, a collision occurs, both detect it, both stop, both wait a random backoff time and retry. **Modern switched full-duplex Ethernet has no collisions, so CSMA/CD is effectively obsolete** - but they may still ask it, and knowing it is disabled in full duplex is the impressive part of the answer.
- **CSMA/CA** - the Wi-Fi version, Collision *Avoidance*, because a wireless device cannot listen and transmit at the same time to detect a collision.
- **Half duplex vs full duplex** - half duplex is one direction at a time (collisions possible), full duplex is both directions simultaneously (no collisions). A duplex mismatch between two ends causes slow links and errors, a classic real fault.
- **Link negotiation / auto-negotiation** (named in the JD) - the two ends of a link automatically agree on the highest common speed and duplex mode. When it fails or is configured on only one end, you get a duplex mismatch.

## Cabling

| Type | Notes |
|---|---|
| **Cat5e** | Up to 1 Gbps, 100 m |
| **Cat6 / Cat6a** | 10 Gbps (Cat6 up to 55 m, Cat6a to 100 m) |
| **Straight-through** | Different device types - PC to switch, switch to router |
| **Crossover** | Same device types - switch to switch, PC to PC. Modern kit auto-detects with Auto-MDIX |
| **Rollover / console** | Connects to a switch or router console port for management |
| **Fibre - single mode** | Small core, laser, long distance (kilometres), more expensive |
| **Fibre - multi mode** | Larger core, LED, shorter distance (hundreds of metres), cheaper |

- **SFP / SFP+** (in the JD) - Small Form-factor Pluggable transceivers. Hot-swappable modules that plug into a switch port and take fibre or copper. **SFP** is 1 Gbps, **SFP+** is 10 Gbps. Being able to say "an SFP is the pluggable optic module in a switch port - SFP is 1G, SFP+ is 10G" covers this JD line completely.
- **Copper vs fibre:** fibre carries more, travels much further, and is immune to electrical interference. Copper is cheaper and easier to terminate. This is BT's whole business - Openreach is replacing copper with full fibre across the UK.

---

# 3. Switching - layer 2

- **How a switch learns:** when a frame arrives, the switch records the **source MAC and the port it came in on** in its MAC address table. When it needs to forward, it looks up the destination MAC. If it knows the port, it **forwards** to only that port; if not, it **floods** to all ports except the one it came from. Broadcasts are always flooded.
- **Collision domain vs broadcast domain:** each switch **port** is its own collision domain. All ports on a switch are one broadcast domain - **unless you use VLANs**. A router breaks up broadcast domains.
- **L2 vs L3 switch:** an L2 switch only forwards by MAC. An **L3 switch** can also route between VLANs using IP - a switch with routing built in, faster than sending traffic out to a router and back ("router on a stick").
- **Bridging** is the older, software-based two-port version of what a switch does in hardware across many ports.
- **Stacking** (in the JD) - physically connecting several switches with stacking cables so they behave as **one logical switch** with one management IP and one configuration. It simplifies management and lets a port-channel span physical units.

## VLANs and tagging

- A **VLAN** is a logical grouping of ports into a separate broadcast domain, even if the devices are on the same physical switch. So finance and engineering can share a switch but be isolated networks.
- **Why:** security isolation, smaller broadcast domains, and grouping by function instead of by physical location.
- **802.1Q tagging** - when a frame travels between switches on a shared link, the switch inserts a **4-byte tag containing the VLAN ID** so the far end knows which VLAN it belongs to.
- **Access port vs trunk port:** an **access port** carries one VLAN and connects to an end device, untagged. A **trunk port** carries many VLANs between switches and tags the frames.
- **Native VLAN** - the one VLAN sent untagged over a trunk. Default is VLAN 1; changing it is a standard security practice.
- **Inter-VLAN routing** - VLANs cannot talk to each other without a layer-3 device: either a router with subinterfaces ("router on a stick") or an L3 switch with SVIs.

## STP, RSTP, MSTP

- **The problem:** networks are built with redundant links so a failure does not cut anything off. But at layer 2, a loop is catastrophic - frames circle forever, broadcasts multiply into a **broadcast storm**, and the MAC table becomes unstable. Layer 2 has no TTL to stop it.
- **STP** (Spanning Tree Protocol, 802.1D) elects a **root bridge** (lowest bridge ID), then calculates the best path from every switch to it and **blocks** the remaining redundant ports. The physical loop stays, but the logical topology becomes a loop-free tree. If a link fails, a blocked port is unblocked.
- **Port states in STP:** blocking → listening → learning → forwarding. Convergence takes around **30-50 seconds**, which is slow.
- **RSTP** (Rapid STP, 802.1w) does the same thing but converges in a **few seconds** instead of tens of seconds, using proposal/agreement handshakes and new port roles (alternate, backup). It is the default in most modern networks.
- **MSTP** (Multiple STP, 802.1s) lets you map **groups of VLANs to a few spanning-tree instances**, instead of running one instance per VLAN. Same loop protection, far less CPU when you have hundreds of VLANs.

*The three-sentence summary to say:* "STP stops layer-2 loops by blocking redundant links and keeping a loop-free tree, with one root bridge. RSTP is the faster version - seconds rather than half a minute. MSTP groups VLANs into a small number of instances so you are not running a separate spanning tree for every VLAN."

## LACP and port channels

- **Link aggregation** bundles several physical links into one logical link. You get more bandwidth and redundancy - if one cable fails, the bundle keeps working.
- **LACP** (802.3ad) is the **standard protocol** that negotiates and monitors the bundle between the two ends. Cisco's proprietary equivalent is PAgP; you can also configure a static bundle with no protocol, which is riskier because nothing detects a misconfiguration.
- Traffic is distributed across the member links by a hash of source/destination MAC or IP, so **a single flow still uses one link** - four 1G links do not give one download 4 Gbps.

---

# 4. Routing - layer 3

- **A routing table** maps destination networks to the next hop and outgoing interface. **Longest prefix match wins** - the most specific route is used.
- **Static vs dynamic routing:** static routes are configured by hand - predictable, no overhead, but they do not adapt when a link fails and they do not scale. Dynamic routing protocols learn routes automatically and reconverge on failure.
- **Administrative distance** - when two protocols offer a route to the same network, the router trusts the one with the lower AD. Connected 0, static 1, EIGRP 90, OSPF 110, RIP 120, external BGP 20, internal BGP 200.
- **Metric** - how a single protocol picks between its own routes. RIP uses hop count, OSPF uses cost based on bandwidth, EIGRP uses bandwidth and delay.
- **IGP vs EGP** - Interior Gateway Protocols (RIP, OSPF, EIGRP) run *within* one organisation's network. Exterior (BGP) runs *between* organisations, across the internet.

## The five named protocols

| Protocol | Type | Metric | Notes |
|---|---|---|---|
| **RIP** | Distance vector | Hop count | Max 15 hops, slow convergence, simple. Largely obsolete. RIPv2 added subnet masks (classless) |
| **IGRP** | Distance vector | Composite (bandwidth, delay) | Cisco proprietary, obsolete, replaced by EIGRP |
| **EIGRP** | Advanced distance vector / hybrid | Bandwidth + delay | Cisco (now open). Fast convergence using the DUAL algorithm and pre-computed backup routes ("feasible successors") |
| **OSPF** | Link state | Cost (based on bandwidth) | Open standard. Every router builds a full map of the topology and runs **Dijkstra's shortest path**. Uses **areas**, with area 0 as the backbone. The most common enterprise IGP |
| **BGP** | Path vector | Path attributes, AS path length | The routing protocol **of the internet**. Routes between autonomous systems. Slow but extremely scalable, and policy driven rather than purely shortest-path |

*If they ask "distance vector vs link state":* "Distance vector routers only know what their neighbours tell them - direction and distance, like road signs. Link state routers each build a complete map of the network and compute the best path themselves. Link state converges faster and avoids loops better, but uses more CPU and memory."

*If they ask "why does the internet use BGP?":* "Because between organisations, the best route is not just the shortest - it is about business relationships and policy. BGP lets each network decide what it will accept and advertise, and it scales to hundreds of thousands of routes."

## First-hop redundancy: HSRP, VRRP, GLBP

**The problem they solve:** every device on a LAN is configured with one default gateway address. If that router dies, the whole subnet loses its way out - even if a second router is sitting right there. FHRPs let two or more routers **share one virtual IP address** that acts as the gateway.

| Protocol | Notes |
|---|---|
| **HSRP** | Cisco proprietary. One **active** router, one **standby**. Others idle. Virtual IP + virtual MAC |
| **VRRP** | The **open standard** version of the same idea. One **master**, one or more **backups** |
| **GLBP** | Cisco. Like HSRP but also **load balances** - multiple routers forward traffic simultaneously, instead of one doing everything while the other waits |

*One line that covers all three:* "They all give a LAN a virtual gateway IP shared by two or more routers, so if one fails the other takes over without touching any client. HSRP and GLBP are Cisco, VRRP is the open standard, and GLBP additionally load-balances instead of leaving the backup idle."

---

# 5. The 3-tier architecture (core, distribution, access)

The JD names this directly. It is the classic enterprise campus design:

| Tier | Job |
|---|---|
| **Access / edge** | Where end devices plug in - PCs, phones, access points. Port security, VLAN assignment, PoE. High port count, low cost |
| **Distribution** | Aggregates the access switches. This is where **routing between VLANs**, access control lists, filtering and policy happen. Usually L3 switches |
| **Core** | The high-speed backbone connecting distribution blocks. Its only job is to **switch packets as fast as possible** - no filtering, no policy, nothing that adds delay |

**Why design it this way:** it is modular, so you can add a new access block without redesigning anything; faults are contained; and each tier has one clear job. Redundancy is built in with two distribution switches per block and dual uplinks from every access switch - which is exactly *why* you need STP and FHRPs.

Smaller sites use a **collapsed core** (two tiers), where core and distribution are combined.

---

# 6. The WAN side

- **A WAN link** connects sites across long distances, usually leased from a carrier - which is BT's actual business.
- **Older WAN encapsulations:** **PPP** (Point-to-Point Protocol, supports authentication with PAP/CHAP), **HDLC** (Cisco's default on serial links), **Frame Relay** (legacy packet-switched service).
- **Leased line** - a dedicated private circuit between two sites with guaranteed bandwidth. Expensive and reliable.
- **MPLS** - Multi-Protocol Label Switching. Instead of every router doing a full IP lookup, the edge router attaches a **label** and the routers in the middle forward purely on that label, which is faster and lets the provider engineer traffic paths and offer quality-of-service guarantees. It is often called "layer 2.5" because it sits between layer 2 and layer 3. **MPLS VPNs are how a carrier gives an enterprise a private network across a shared backbone** - a core BT product.
- **SD-WAN** - the modern approach: use ordinary broadband and 4G/5G links, and steer traffic across them intelligently with software, often replacing or supplementing MPLS.
- **Site-to-site VPN** (in the JD) - an encrypted **IPsec** tunnel between two offices' routers over the public internet, so the two LANs behave like one private network. Much cheaper than a leased line; less predictable performance. IPsec has two parts: **IKE** to negotiate keys, then **ESP** to encrypt the traffic.
- **WAN failover** (in the JD) - if the primary WAN link goes down, traffic automatically shifts to a backup link (a second provider, or 4G). Usually driven by route tracking or IP SLA probes so the router notices the link is dead even when the interface still shows up.
- **Router HA / load balancing** - two routers configured so one takes over if the other fails (an FHRP, or a redundant pair), and traffic spread across multiple links using equal-cost multipath routing.

---

# 7. The remaining protocols in the JD

- **SNMP** - Simple Network Management Protocol. **How network devices are monitored.** A manager polls agents on routers and switches for data (interface status, CPU, errors), and devices can send **traps** to alert the manager without being asked. UDP **161**, traps on **162**. v3 adds authentication and encryption. **This is directly relevant to your role** - the alarms you would be handling at BT are largely generated from SNMP and similar telemetry.
- **TFTP** - Trivial File Transfer Protocol, UDP **69**. Very simple, no authentication. Used in network operations to back up and restore device configurations and load firmware images.
- **BootP** - the predecessor to DHCP. It gave a diskless machine an IP address and a boot image location. DHCP replaced it and is backward compatible, which is why they share ports 67/68.
- **NTP** - Network Time Protocol, UDP 123. Keeps device clocks in sync, which matters enormously in operations because correlating logs across devices is impossible if their timestamps disagree.
- **Syslog** - UDP 514. Devices send log messages to a central server. Alongside SNMP, this is what a network operations centre actually watches.

## Device and user authentication (in the JD)

- **AAA** - Authentication (who are you), Authorisation (what may you do), Accounting (what did you do).
- **RADIUS** - open standard, UDP, encrypts only the password, commonly used for user network access (Wi-Fi, VPN).
- **TACACS+** - Cisco, TCP 49, encrypts the **entire** payload and separates the three A's, which is why it is preferred for **device administration** - controlling who can log into a router and which commands they may run.
- **802.1X** - port-based network access control. A device plugging into a switch port must authenticate before the port allows any traffic. Three roles: supplicant (the device), authenticator (the switch), authentication server (RADIUS).

---

# 8. How to handle what you don't know

You will be asked something you have not touched. Cisco IOS commands, a CCNP-level routing detail, an MPLS internals question. **How you handle it is itself being assessed** - the JD asks for active listening and honest diagnosis, not bluffing.

## The formula

**Admit → offer the adjacent thing you do know → show how you'd find out.**

> "I haven't worked with Cisco hardware directly, so I don't want to guess at the command. What I do understand is what the protocol is doing - [say the concept]. If I hit that in the job, I'd check the device documentation and ask whoever on the team knows it, and I'd write it down so I don't have to ask twice."

That answer is *good*. It is honest, it demonstrates you understand the concept even without the hardware, and it shows you would not sit stuck in silence - which is the actual risk with a first-line engineer.

## Prepared honest answers for the likely gaps

**"Have you configured a router or switch?"**

> "Not physical enterprise kit, no. My hands-on networking has been from the server side - configuring Nginx as a reverse proxy, DNS records, firewall rules and ports, TLS certificates, and diagnosing connectivity with ping, traceroute, dig and netstat. So I know the protocols from where they land rather than from where they're routed. I've read enough about switching and routing to follow a conversation about it, and I'd genuinely enjoy learning the hardware side properly - it's the main reason this role appealed to me."

**"Do you have a CCNA or CCNP?"**

> "Not yet. I've been studying networking fundamentals seriously for this, and CCNA is the certification I'd want to work toward - it's the natural structure for what I'd be learning on the job anyway. If it's something BT supports, I'd start it."

*Do not say you are "currently doing CCNA" unless you actually are. If they ask a follow-up you cannot answer, the whole conversation turns.*

**"How much networking have you actually done?"**

> "Honestly - the applied parts of it, and not the enterprise infrastructure parts. I've set up and debugged the network side of servers I run, and I built a chat application over WebSockets where I had to understand what the TCP connection underneath was actually doing. I'm at the beginning of the network engineering side, and I know that. What I can promise is that I pick things up quickly and I ask questions rather than guessing."

## What never to do

- Never invent a command, a protocol behaviour, or an experience.
- Never say "yes I know that" and then go quiet.
- Never argue if they correct you. "Ah - thank you, I had that wrong" costs you nothing and reads as someone easy to work with. Arguing costs you the interview.

---

# The 10-minute revision list for this document

1. `/24` to `/30` mask and host counts. Block-size method.
2. 169.254 means DHCP failed. Private ranges 10, 172.16, 192.168.
3. CSMA/CD - collision detection on shared media, obsolete in full duplex.
4. VLAN = separate broadcast domain. 802.1Q adds a tag. Access vs trunk.
5. STP stops loops by blocking links. RSTP is faster. MSTP groups VLANs.
6. LACP bundles links for bandwidth and redundancy.
7. RIP hop count, OSPF cost/link-state/Dijkstra/areas, EIGRP Cisco fast, BGP the internet.
8. HSRP/VRRP/GLBP = shared virtual gateway IP; VRRP is the open one; GLBP load balances.
9. Core = fast, Distribution = routing and policy, Access = end devices.
10. MPLS = label switching, provider VPNs. Site-to-site VPN = IPsec tunnel over the internet.
11. SNMP 161/162 = how networks are monitored. TFTP 69 = config backups. Syslog 514.
12. When you don't know: admit, give the adjacent thing, say how you'd find out.
