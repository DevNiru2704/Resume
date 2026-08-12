---
title: "Networking Core Question Bank"
subtitle: "All 80 questions from your placement cell, answered the way you should say them"
author: "Nirmalya Mandal - BT Group Interview Prep"
date: "Study pack - part 1 of 10"
---

# How to use this document

These are the exact 80 questions your faculty sent. **The technical round is this document**, and it then moves on to your CV projects. You have already cleared the online assessment; this is the round the OA was filtering for.

Each answer is written **the length you should actually speak it** - two or three sentences. Not an essay. Say the short answer, then stop and let them ask more.

**Method for tonight:** read a question's answer, close your eyes, say it out loud in your own words. If it comes out, move on. If it does not, read it once more and try again. Do not read passively - you will feel like you know it and then freeze in the room.

Questions marked **[KEY]** are the ones most likely to be pushed on, because the JD names them directly.

---

# Basics

**1. What is a computer network?**

Two or more devices connected together so they can share data and resources. The connection can be by cable or wireless, and the devices follow agreed rules called protocols so they understand each other.

**2. What are the different types of networks (LAN, MAN, WAN, PAN)?**

- **PAN** - Personal Area Network. A few metres. Your phone and your Bluetooth earphones.
- **LAN** - Local Area Network. One building or campus. Your home Wi-Fi or an office floor. Fast, privately owned.
- **MAN** - Metropolitan Area Network. Across a city. A cable operator's network covering Kolkata, for example.
- **WAN** - Wide Area Network. Across cities or countries. The internet is the biggest WAN. Usually leased from a telecom provider - which is exactly what BT sells to enterprises.

**3. What is the Internet?**

A global network of networks. Millions of separate networks, run by different organisations, all connected and all speaking the TCP/IP protocol suite, which is what lets a device on one of them reach a device on another.

**4. What is an IP address?**

A logical address given to a device on a network so other devices can find it and send data to it. It works at the network layer, and unlike a MAC address it can change when the device moves to a different network.

**5. What is the difference between IPv4 and IPv6?** **[KEY]**

IPv4 is 32 bits, written as four numbers separated by dots like `192.168.1.1`, giving about 4.3 billion addresses - which we ran out of. IPv6 is 128 bits, written in hexadecimal with colons like `2001:0db8::1`, giving a practically unlimited number. IPv6 also has built-in IPsec support and no need for NAT.

**6. What is a MAC address?**

The physical hardware address burned into a network card by the manufacturer. It is 48 bits, written as six pairs of hex digits like `00:1A:2B:3C:4D:5E`, and it works at the data link layer. The first half identifies the manufacturer.

**7. What is the difference between an IP address and a MAC address?** **[KEY]**

A MAC address is physical, permanent, and only used within the local network segment. An IP address is logical, can change, and is used to route between networks. Good way to say it: **the IP address gets the packet to the right network, the MAC address gets the frame to the right device on that network.**

**8. What is a subnet mask?** **[KEY]**

A 32-bit number that tells a device which part of an IP address is the **network** portion and which part is the **host** portion. For example with `192.168.1.10` and mask `255.255.255.0`, the first three octets are the network and the last one identifies the host. It is how a device decides whether a destination is local or has to go via the gateway.

**9. What is a default gateway?**

The device - normally a router - that traffic is sent to when the destination is outside the local network. If my machine wants to reach something that is not on my subnet, it hands the packet to the default gateway and the gateway takes it from there.

**10. What is DNS?** **[KEY]**

Domain Name System. It translates human-readable names like `www.google.com` into IP addresses, because people remember names and machines route on numbers. It runs on **port 53**, mostly over UDP, and falls back to TCP for large responses like zone transfers.

**11. What is DHCP?** **[KEY]**

Dynamic Host Configuration Protocol. It automatically gives a device its IP address, subnet mask, default gateway and DNS server when it joins a network, instead of someone configuring each machine by hand. It uses UDP ports **67 (server) and 68 (client)**, and the four steps are **DORA** - Discover, Offer, Request, Acknowledge.

**12. What is NAT?** **[KEY]**

Network Address Translation. A router rewrites private IP addresses into one public IP address so many devices inside a network can share a single public address. It is the main reason IPv4 has lasted this long, and it also hides the internal addressing from outside. **PAT** (also called NAT overload) is the common version, which distinguishes the internal devices by port number.

**13. What is a modem?**

Modulator-demodulator. It converts the digital signals a computer produces into the analogue form a telephone or cable line carries, and back again at the other end. It is what connects your home to the provider's network.

**14. What is a router?**

A device that connects different networks and decides the best path for a packet to reach its destination. It works at **layer 3** using IP addresses, keeps a routing table, and breaks up broadcast domains.

**15. What is a switch?**

A device that connects devices within the same network and forwards frames only to the port where the destination device actually is. It works at **layer 2** using MAC addresses, and it learns which MAC is on which port by watching traffic and storing it in a MAC address table.

**16. What is a hub?**

An old layer-1 device that simply repeats any signal it receives out of every other port. It has no intelligence - everyone on a hub sees everyone's traffic, so it wastes bandwidth and causes collisions. Switches replaced hubs.

**17. What is the difference between a hub and a switch?** **[KEY]**

A hub broadcasts to every port; a switch forwards only to the correct port. A hub is layer 1, a switch is layer 2. A hub is one single collision domain shared by everyone; a switch gives **each port its own collision domain**. A switch is faster, more secure and more efficient.

**18. What is the difference between a router and a switch?** **[KEY]**

A switch connects devices **within** a network using MAC addresses at layer 2. A router connects **different** networks using IP addresses at layer 3 and decides the path between them. A switch breaks up collision domains, a router breaks up broadcast domains.

**19. What is Wi-Fi?**

Wireless networking based on the IEEE 802.11 standards. It carries the same network data as a cable does, but over radio waves in the 2.4 GHz, 5 GHz and now 6 GHz bands, with an access point acting as the connection point.

**20. What is the difference between Wi-Fi and Ethernet?**

Ethernet is wired and Wi-Fi is wireless. Ethernet is faster, more stable, lower latency and more secure because you need physical access to the cable. Wi-Fi trades some of that away for mobility and convenience, and it shares the medium so performance drops as more devices join.

**21. What is bandwidth?**

The maximum amount of data a link can carry per unit of time - measured in bits per second. Think of it as the **width of the pipe**, not the speed of the water.

**22. What is latency?**

The time a packet takes to travel from source to destination, measured in milliseconds. It is the **delay**, not the capacity. `ping` measures round-trip latency.

**23. What is throughput?**

The amount of data that is actually delivered successfully per unit of time. Bandwidth is the theoretical maximum; throughput is what you really get after overhead, congestion, errors and retransmissions.

*Nice one-liner if they ask all three together:* "Bandwidth is how wide the road is, latency is how long the journey takes, throughput is how many cars actually arrive."

**24. What is packet switching?**

Data is broken into small packets, each sent independently across the network, possibly by different paths, and reassembled at the destination. It uses the network efficiently because no one holds a dedicated circuit - the opposite approach is circuit switching, like an old telephone call.

**25. What is a packet?**

A unit of data at the network layer, containing a header with the source and destination IP addresses plus control information, and a payload with the actual data. Worth knowing the naming by layer: **segment** at transport, **packet** at network, **frame** at data link, **bits** at physical.

---

# OSI Model

**26. What is the OSI model?** **[KEY]**

Open Systems Interconnection - a seven-layer reference model that splits network communication into layers, each with a defined job. It is a teaching and troubleshooting framework rather than something actually implemented; the real world runs on TCP/IP. Its value is that it lets you isolate a fault to a layer: is this a cable problem, an IP problem, or an application problem?

**27. Name all seven layers of the OSI model.** **[KEY]**

Bottom to top: **Physical, Data Link, Network, Transport, Session, Presentation, Application.**

Mnemonic bottom-up: *Please Do Not Throw Sausage Pizza Away.*
Top-down: *All People Seem To Need Data Processing.*

**Learn this cold. It is the single most likely question in round 1, and you should be able to say the layers, their job, their data unit and their devices without hesitation.**

**28. Physical layer (Layer 1)?**

Transmits raw bits over the physical medium. It deals with cables, connectors, voltages, pins, radio signals and data rates. Devices: hubs, repeaters, cables, network interface hardware. Data unit: **bits**.

**29. Data Link layer (Layer 2)?** **[KEY]**

Moves frames between two directly connected devices on the same network, using MAC addresses. It handles framing, physical addressing, error detection with a CRC, and flow control. It has two sub-layers - **LLC** (Logical Link Control, which the JD names) handles flow and error control and identifies the network-layer protocol, and **MAC** controls access to the shared medium. Devices: switches and bridges. Data unit: **frames**.

**30. Network layer (Layer 3)?** **[KEY]**

Moves packets between different networks - logical addressing with IP, routing, path determination and fragmentation. Devices: routers and layer-3 switches. Protocols: IP, ICMP, ARP (often placed between layers 2 and 3), OSPF, BGP. Data unit: **packets**.

**31. Transport layer (Layer 4)?** **[KEY]**

End-to-end delivery between processes on two hosts. It handles segmentation, port addressing, and depending on the protocol, reliability, sequencing, acknowledgements, flow control and error recovery. Protocols: TCP and UDP. Data unit: **segments** (TCP) or **datagrams** (UDP).

**32. Session layer (Layer 5)?**

Establishes, manages and terminates sessions between applications, including dialogue control and adding checkpoints so a long transfer can resume rather than restart. Examples: NetBIOS, RPC, session management in APIs.

**33. Presentation layer (Layer 6)?**

Translation, encryption and compression. It makes sure data sent by one system is readable by another - character encoding, data formats like JPEG and ASCII, SSL/TLS encryption, and compression.

**34. Application layer (Layer 7)?**

The layer the user's application actually talks to. It provides network services to programs: HTTP, HTTPS, FTP, SMTP, DNS, SSH, Telnet, SNMP, DHCP.

**35. Which devices work at each OSI layer?** **[KEY]**

| Layer | Devices |
|---|---|
| 1 Physical | Hub, repeater, cables, modem, media converter |
| 2 Data Link | Switch, bridge, network interface card, wireless access point |
| 3 Network | Router, layer-3 switch |
| 4 Transport | Firewall (stateful), load balancer |
| 5-7 | Gateways, proxy servers, application firewalls |

---

# TCP/IP

**36. What is the TCP/IP model?** **[KEY]**

The model the internet actually runs on. Four layers: **Network Access (or Link), Internet, Transport, Application.** It was built from working protocols rather than designed as theory, which is why it is the practical model and OSI is the teaching model.

**37. Difference between the OSI and TCP/IP models?** **[KEY]**

OSI has seven layers, TCP/IP has four. TCP/IP combines OSI's physical and data link into Network Access, and combines session, presentation and application into one Application layer. OSI was defined before the protocols existed and is used as a reference; TCP/IP was built around existing protocols and is what is actually implemented.

**38. What is TCP?** **[KEY]**

Transmission Control Protocol. A **connection-oriented, reliable** transport protocol. It sets up a connection with a three-way handshake, numbers every byte, acknowledges what arrives, retransmits what does not, delivers data in order, and does flow control and congestion control. Used where correctness matters more than speed: web, email, file transfer, SSH, databases.

**39. What is UDP?** **[KEY]**

User Datagram Protocol. **Connectionless and unreliable** - it just sends datagrams with no handshake, no acknowledgement, no ordering and no retransmission. Because of that it is fast and has very little overhead. Used where speed matters more than perfection: DNS lookups, DHCP, video and voice streaming, online gaming, SNMP.

**40. Difference between TCP and UDP?** **[VERY LIKELY]** (near-certain question)

| | TCP | UDP |
|---|---|---|
| Connection | Connection-oriented (handshake first) | Connectionless |
| Reliability | Guaranteed delivery, retransmits lost data | No guarantee |
| Ordering | Delivers in order | No ordering |
| Speed | Slower, more overhead | Faster, minimal overhead |
| Header | 20 bytes | 8 bytes |
| Flow/congestion control | Yes | No |
| Uses | HTTP/HTTPS, FTP, SMTP, SSH | DNS, DHCP, VoIP, video streaming, SNMP |

*Say it simply:* "TCP is a phone call - you connect, you confirm the other person heard you. UDP is posting a letter - you send it and hope it arrives."

**41. What is a three-way handshake?** **[VERY LIKELY]**

How TCP opens a connection, in three steps:

1. **SYN** - the client sends a segment with the SYN flag set and its own starting sequence number.
2. **SYN-ACK** - the server replies acknowledging the client's sequence number and sending its own.
3. **ACK** - the client acknowledges the server's sequence number.

Now both sides have agreed sequence numbers and the connection is established. Closing it takes four steps - FIN, ACK, FIN, ACK - because each direction is shut down separately.

---

# Protocols

**42. What is HTTP?**

HyperText Transfer Protocol - the application-layer protocol browsers and servers use to exchange web pages and data. It runs over TCP on **port 80**, and it is **stateless**: each request stands alone, which is why cookies and tokens exist to carry identity between requests.

**43. What is HTTPS?** **[KEY]**

HTTP secured with SSL/TLS, running on **port 443**. The data is encrypted in transit so it cannot be read or tampered with, and the server's certificate proves the site is who it claims to be. I have set this up myself with Let's Encrypt certificates on Nginx.

**44. What is FTP?**

File Transfer Protocol, for moving files between a client and a server. It uses **two** TCP connections - **port 21** for commands and **port 20** for the data. It sends credentials in plain text, so in practice people use SFTP (over SSH, port 22) or FTPS.

**45. What is SMTP?**

Simple Mail Transfer Protocol - used to **send** email, from a client to a mail server and between mail servers. Port **25**, with **587** for authenticated submission and **465** for the older implicit-TLS version.

**46. What is POP3?**

Post Office Protocol version 3 - used to **retrieve** email. It normally downloads mail to one device and deletes it from the server, so it does not sync well across devices. Port **110**, or **995** with SSL.

**47. What is IMAP?**

Internet Message Access Protocol - also retrieves email, but keeps it on the server and syncs state such as read, folders and flags across all your devices. Port **143**, or **993** with SSL. IMAP is what almost everyone uses now.

*If they ask POP3 vs IMAP:* "POP3 downloads and removes, one device. IMAP keeps mail on the server and syncs everywhere."

**48. What is SSH?** **[KEY]**

Secure Shell - encrypted remote login and command execution on another machine, over TCP **port 22**. It replaced Telnet because Telnet sends everything, including passwords, in clear text. I use SSH every time I work on a server, usually with key-based authentication rather than passwords.

**49. What is Telnet?**

An old protocol for remote terminal access over **port 23**. It works, but everything is unencrypted, so it is considered insecure and is only used now for quick connectivity tests - for example `telnet host 80` to check whether a port is open.

**50. What is ICMP?** **[KEY]**

Internet Control Message Protocol - the network layer's messaging protocol for errors and diagnostics. It does not carry user data. It is what `ping` and `traceroute` use, and it produces messages like "destination unreachable", "time exceeded" and "echo request/reply".

**51. What is ARP?** **[KEY]**

Address Resolution Protocol - it finds the **MAC address that belongs to a known IP address** on the local network. The device broadcasts "who has 192.168.1.1?", the owner replies with its MAC, and the result is cached in the ARP table. RARP does the reverse and is obsolete.

---

# Ports

**52. What is a port number?** **[KEY]**

A 16-bit number that identifies a specific application or service on a device, so one machine with one IP address can run many services at once. IP gets you to the machine; the port gets you to the right program on it. Ranges: **0-1023 well known, 1024-49151 registered, 49152-65535 dynamic/ephemeral.**

**53. Default ports?** **[VERY LIKELY]** (memorise this table - it is a classic quick-fire round)

| Service | Port | Transport |
|---|---|---|
| FTP data / control | 20 / 21 | TCP |
| SSH / SFTP | 22 | TCP |
| Telnet | 23 | TCP |
| SMTP | 25 | TCP |
| DNS | 53 | UDP (TCP for zone transfers) |
| DHCP | 67 / 68 | UDP |
| TFTP | 69 | UDP |
| HTTP | 80 | TCP |
| POP3 | 110 | TCP |
| NTP | 123 | UDP |
| IMAP | 143 | TCP |
| SNMP | 161 / 162 (traps) | UDP |
| HTTPS | 443 | TCP |
| SMTPS / IMAPS / POP3S | 465 / 993 / 995 | TCP |
| RDP | 3389 | TCP |
| PostgreSQL / MySQL | 5432 / 3306 | TCP |

---

# Security

**54. What is a firewall?** **[KEY]**

A device or software that filters traffic between networks based on rules - source and destination IP, port, and protocol. A **stateful** firewall also tracks connections, so it knows a reply belongs to a request you made. On Linux servers I have used `ufw` and iptables rules to leave only ports 22, 80 and 443 open.

**55. What is a VPN?** **[KEY]**

Virtual Private Network - an encrypted tunnel across a public network, so two networks or a remote user and a network can communicate as if they were on the same private network. **Site-to-site VPN** connects two offices permanently; **remote-access VPN** connects an individual user. Common protocols: IPsec, OpenVPN, WireGuard. Site-to-site VPN is named in this job description.

**56. What is encryption?**

Converting readable data into an unreadable form so only someone with the correct key can read it. **Symmetric** encryption uses one shared key and is fast (AES). **Asymmetric** uses a public/private key pair and is slower but solves key exchange (RSA). Real systems use both - asymmetric to agree a key, symmetric for the actual data.

**57. What is SSL/TLS?** **[KEY]**

The protocol that encrypts data in transit and authenticates the server. SSL is the old name; **TLS** is the current standard - TLS 1.2 and 1.3. In a handshake the server presents a certificate signed by a certificate authority, the two sides agree on a session key, and everything after that is encrypted with it. HTTPS is just HTTP inside TLS.

---

# Troubleshooting

**58. How would you troubleshoot if the internet is not working?** **[VERY LIKELY]**

This is a **process** question - they want to hear a structured method, not a lucky guess. Work up the layers:

1. **Physical** - is the cable in, is the Wi-Fi connected, are the link lights on, is the router powered?
2. **Local IP** - `ipconfig` / `ip a`. Do I have a valid address, or a 169.254.x.x self-assigned one, which means DHCP failed?
3. **Loopback** - `ping 127.0.0.1`. Confirms the TCP/IP stack on my own machine works.
4. **Gateway** - `ping` the default gateway. Confirms the local network is reachable.
5. **Outside** - `ping 8.8.8.8`. If an IP works, routing to the internet is fine.
6. **DNS** - `ping google.com`. If the IP worked but the name does not, **it is a DNS problem** - check with `nslookup`.
7. **Path** - `traceroute` / `tracert` to see where it stops.
8. **Application** - if everything above works but one site fails, look at that service, the browser, or a firewall rule.

Then escalate with what you have found. **Saying "I'd work up the layers from physical to application" is worth more than any single command.**

**59. How do you check your IP address?**

Windows: `ipconfig`. Linux/Mac: `ip addr show` or `ifconfig`. For the public address as seen from outside, `curl ifconfig.me` or any what-is-my-IP site.

**60. What is the ping command?** **[KEY]**

It sends ICMP echo requests to a host and waits for echo replies. It tells you whether the host is reachable, the round-trip time, and whether any packets were lost. It is the first test for basic connectivity.

**61. What is traceroute (tracert)?** **[KEY]**

It shows every hop a packet passes through on the way to a destination, with the time to each. It works by sending packets with a **TTL of 1, then 2, then 3** and so on - each router that drops a packet for expired TTL sends back a "time exceeded" message, which reveals its address. It is how you find *where* along the path a connection is breaking.

**62. What is the ipconfig command?**

The Windows command that displays network interface configuration - IP address, subnet mask and default gateway. `ipconfig /all` adds MAC address, DHCP and DNS details; `/release` and `/renew` redo DHCP; `/flushdns` clears the DNS cache. The Linux equivalent is `ip` or `ifconfig`.

**63. What is the nslookup command?**

It queries DNS to resolve a name to an IP address, or the reverse, and lets you ask a specific DNS server. It is the tool for confirming whether a problem is DNS or something else. `dig` is the more detailed Linux equivalent.

---

# Basic Computer Networking

**64. What happens when you type "www.google.com" in a browser?** **[MOST LIKELY]**

**This is the single most likely deep question in the whole interview**, because it lets them walk you down every layer. Learn the sequence, and say it as a story:

1. The browser checks its own cache, then the OS cache, then the hosts file, for that name.
2. If not found, a **DNS** query goes out - to the local resolver, which may ask a root server, then the `.com` TLD server, then Google's authoritative name server - and comes back with an IP address.
3. The browser opens a **TCP connection** to that IP on port 443, using the **three-way handshake** (SYN, SYN-ACK, ACK).
4. Because it is HTTPS, a **TLS handshake** follows - certificate presented and verified, session key agreed.
5. The browser sends an **HTTP GET** request for the page.
6. Along the way, **ARP** resolved the gateway's MAC address so the frame could leave the machine, and each router used its **routing table** to forward the packet onward. NAT translated the private source address to a public one.
7. The server responds with HTML, and the browser then requests CSS, JavaScript and images, rendering the page as they arrive.
8. When finished, the TCP connection is closed (or kept alive for reuse).

*If you only remember one order:* **cache → DNS → TCP handshake → TLS handshake → HTTP request → response → render.**

**65. What is client-server architecture?**

A model where clients request services and a central server provides them. The server is always on and holds the resources; clients connect when they need something. Almost everything I have built works this way - a browser or mobile app as the client, and my backend on a server responding to requests.

**66. What is peer-to-peer networking?**

A model with no central server - every device is both client and server, sharing resources directly with the others. It scales well and has no single point of failure, but it is harder to secure and manage. BitTorrent is the classic example.

**67. What is cloud computing?**

Using computing resources - servers, storage, databases, networking - over the internet from a provider, instead of owning the hardware. You pay for what you use and can scale up or down. The three service models are **IaaS** (raw infrastructure), **PaaS** (a platform to deploy onto) and **SaaS** (finished software like Gmail).

**68. What is virtualization?** **[KEY]**

Running multiple virtual machines on one physical machine, each with its own operating system, managed by a **hypervisor**. It uses hardware far more efficiently and gives isolation between workloads. Containers such as Docker are a lighter version - they share the host kernel instead of running a full OS each, which is why they start in seconds. I have used Docker for this.

**69. What is a proxy server?** **[KEY]**

A server that sits between clients and other servers and forwards requests on their behalf. A **forward proxy** sits in front of clients - used for filtering, caching and hiding client identity. A **reverse proxy** sits in front of servers - used for load balancing, SSL termination, caching and security. **I have set up Nginx as a reverse proxy on my own deployments**, so requests hit Nginx on port 443 and it forwards them to my application running on a local port.

**70. What is load balancing?** **[KEY]**

Distributing incoming traffic across several servers so no one server is overloaded, which improves both performance and availability - if one server fails, traffic goes to the others. Common methods are **round robin**, **least connections** and **IP hash**. It can be done at layer 4 (by IP and port) or layer 7 (by URL or content). The JD mentions load balancing on Cisco routers, which is the same idea applied to network links rather than servers.

---

# Resume & Project questions (71-80)

These are covered properly in **document 03** (projects) and **document 07** (HR). Short versions here so this file is complete:

**71. Tell me about yourself.** → Document 00 has both scripts. Technical rounds: what you build, then the server/deployment side, then "I'd like to learn the network side properly". HR round: how you work and what you are looking for.

**72. Explain your final-year project.** → Lead with **ChatterBox**, the real-time chat application. It is the most networking-relevant thing on your CV and the one you have prepared most deeply. 30-second version: "A small chat app where two people can message each other and the message appears instantly. The interesting part for me was that instead of the browser asking the server for new messages over and over, I used WebSockets so one TCP connection stays open and either side can send at any time." Then stop.

**73. Why did you choose this project?** → "I wanted to understand how live applications actually stay connected. Most web work is request-response - you ask, you get an answer, the connection closes. Chat is different because the server has to push to you, and I wanted to see how that works underneath."

**74. What technologies did you use?** → Node.js with the `ws` library for the WebSocket server, plain HTML and JavaScript for the client, and PostgreSQL for users, chats and messages. Simple stack on purpose.

**75. What challenges did you face?** → Pick one, honestly: "Handling a connection dropping. If someone's Wi-Fi cuts out, the socket dies but the server does not always notice immediately, so I had to add a heartbeat - a ping every few seconds - and mark the user offline if there is no reply." That answer is *pure networking* and it is exactly where you want the conversation.

**76. What was your role in the project?** → "I built it myself - it is a personal project, so it is all mine, but it is also small. Around 500 lines."

**77. What improvements can be made?** → Have humility here, it scores well: "Plenty. Right now it does not scale beyond one server, because the open connections live in that server's memory - if I ran two servers, a user on one would not receive a message sent through the other. The usual fix is a shared message broker like Redis pub/sub. I also haven't done end-to-end encryption or delivery receipts properly."

**78. Why do you want to join British Telecom?** → Document 05.

**79. Why should we hire you?** → Document 07.

**80. What are your strengths and weaknesses?** → Document 07.

---

# The quick-fire table - read this at 07:30 tomorrow

| Thing | Answer |
|---|---|
| OSI layers | Physical, Data Link, Network, Transport, Session, Presentation, Application |
| Layer of a switch / router | 2 / 3 |
| Data unit by layer | bits, frames, packets, segments |
| TCP vs UDP | reliable + ordered + slower vs fast + no guarantees |
| Handshake | SYN, SYN-ACK, ACK |
| DHCP steps | Discover, Offer, Request, Acknowledge |
| ARP | IP → MAC on the local network |
| ICMP | ping and traceroute; errors and diagnostics |
| DNS port | 53 UDP |
| HTTP / HTTPS | 80 / 443 |
| SSH / Telnet | 22 / 23 |
| SMTP / POP3 / IMAP | 25 / 110 / 143 |
| SNMP | 161, traps on 162 |
| Private ranges | 10.0.0.0/8, 172.16.0.0/12, 192.168.0.0/16 |
| Hub vs switch | broadcasts to all vs forwards to one |
| Router vs switch | between networks (IP) vs within a network (MAC) |
| Collision domain | per port on a switch; one shared on a hub |
| Broadcast domain | broken by a router, or by VLANs on a switch |
| Traceroute mechanism | increasing TTL, "time exceeded" replies |
| Troubleshooting order | physical → IP → gateway → internet → DNS → application |
