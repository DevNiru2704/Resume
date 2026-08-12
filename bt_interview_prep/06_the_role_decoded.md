---
title: "The Role, Decoded"
subtitle: "What a Service Reliability Engineer at BT actually does, line by line from the JD"
author: "Nirmalya Mandal - BT Group Interview Prep"
date: "Study pack - part 6 of 10"
---

# Read the title carefully

"Service Reliability Engineer" sounds like the Google-style **Site** Reliability Engineer role - writing automation and code to keep large software systems up. **It is not that.** Read BT's own words:

> "**1st Line support** for various Enterprise Discovery, Inventory, Service Mapping, Automation. Ensure **queue management** and handle incidents that are escalated by the Level 1 team for both system generated events and user related queries. Ensure **fault resolution and escalations** are handled in a timely manner."

This is **network and service assurance** - a first-line operations role inside BT's enterprise services. The value of understanding this is enormous: it tells you what to emphasise (calm, structured troubleshooting, communication, willingness to learn networks) and what to stop selling (framework knowledge, feature development, product ownership).

**If they ask "what do you think this role involves?" - a real possibility - having the right answer immediately separates you from everyone who only read the title.**

---

# The JD translated, line by line

## "1st Line support for Enterprise Discovery, Inventory, Service Mapping, Automation"

These four are the tooling that big enterprise networks are run with. In plain terms:

- **Discovery** - software that automatically scans the network and finds out what is actually connected: which devices exist, what they are, what they are running. Nobody can maintain an accurate list of thousands of devices by hand.
- **Inventory** - the resulting record of every device, circuit, service and customer. The single source of truth about what BT owns and what each customer has.
- **Service Mapping** - linking that raw inventory to the **services customers actually pay for**. This is the important one: it lets you say "this switch is down, and it happens to carry the WAN link for three branches of a particular bank" rather than just "a device is down". It turns a device alarm into a business impact.
- **Automation** - the scripts and workflows that do repetitive work automatically: auto-creating a ticket when an alarm fires, auto-testing a link, auto-closing an incident when the alarm clears.

**Being first line for these** means you are the first person who looks when one of these systems raises something - an alarm, a discovery failure, an inventory mismatch - or when a user reports a problem with them.

*Say it as:* "As I understand it, it's being first response for the systems that keep track of what's on the network and which customer services depend on it - so when something alarms or doesn't match, I'd be the first to look at it, fix what I can, and escalate what I can't."

## "Ensure queue management"

Tickets and alarms arrive in a **queue**. Queue management means: picking work up promptly, working the highest-priority items first, not letting anything sit unlooked-at, keeping ticket notes updated, and handing over cleanly at shift end.

This is why "ability to co-ordinate and interact with various teams... and organise workload" is in the JD. **It is as much an organisation and communication skill as a technical one**, which is good news for you.

## "Handle incidents escalated by the Level 1 team, for both system generated events and user related queries"

Two different sources of work:

- **System generated events** - an alarm from a monitoring system. A link went down, a device stopped responding, an interface is throwing errors, CPU is high. Nobody reported it; the network told you.
- **User related queries** - a human raised it. "Our office in Leeds can't reach the application." Vaguer, needs questions asked, may not even be a network fault.

*The good answer if asked which is harder:* "The user-reported ones, I'd think - an alarm tells you what and where. A user tells you the symptom, and you have to work back to the cause, and often the first job is asking the right questions to narrow it down."

## "Ensure fault resolution and escalations are handled in a timely manner"

Two halves, and **the second matters as much as the first**:

- **Resolution** - fix what is within your scope.
- **Escalation** - recognise quickly when it is *not* within your scope and pass it on, with everything you have already found, before the clock runs out.

**Escalating is not failure.** In first-line operations, the cardinal sin is holding onto a ticket too long out of pride while an SLA expires. If they ask "when would you escalate?", the correct answer is: "As soon as I've established it's beyond what I can do or access, or if it's high priority and I'm not making progress - and when I escalate I'd pass on everything I've already checked, so the next person doesn't repeat my work."

That answer alone shows you understand operations culture.

## "Ability to interact effectively at all levels with sensitivity to cultural diversity"

You would be in India supporting a business whose customers and colleagues are largely in the UK and worldwide. This means clear, plain, unhurried English; not using slang or heavy jargon; confirming understanding; and being patient with accents and time zones on both sides.

## "Good communication skills, be an active listener, quick ability to diagnose the customer pain area"

This appears **twice** in the JD - the only requirement that does. Take the hint. In your answers:

- Let them finish the question. Do not start answering over the top of it.
- If a question is ambiguous, ask a clarifying question. In an ops role, that is a demonstration of the skill, not a weakness.
- "Diagnose the customer pain area" means: work out what is actually hurting the customer, which is often not what they first said. A user who says "the internet is slow" may actually have one application timing out.

## "CCNP certificate in Routing & Switching (Desired)" / "Typically requires 1-3 years relevant experience"

**Desired, not required** - and you have neither. Do not pretend otherwise, and do not apologise for it either. See the honest scripts in document 02. What you can offer instead is applied networking from the server side, evidence that you learn fast, and genuine interest in getting certified.

## "Adherence to information security under the Information Security Directive and acceptable use policy"

Standard for any telecom. If it comes up, the sensible things to say are: you follow least privilege, you do not share credentials, you use key-based SSH rather than passwords, you do not move customer data outside approved systems, and you would follow whatever the company's policy says rather than improvising.

---

# A day in the role, as you should describe it

> "I'd imagine it starts with picking up the queue and the handover from the previous shift - seeing what's open and what's priority. Then it's a mix: alarms coming in from the monitoring systems that I'd need to check and either resolve or escalate, and tickets raised by users that need diagnosing. Between those, keeping the ticket notes accurate so anyone picking it up knows what's been done, and coordinating with the teams who own the parts I can't touch. And at the end, a clean handover."

If that is roughly right, they will tell you the details. If it is wrong in places, they will correct you - and being corrected on a reasonable, honest guess costs you nothing.

---

# ITIL vocabulary - twenty minutes of learning that makes you sound experienced

ITIL is the framework almost every large IT operation uses for this work. You do not need to have studied it. Knowing these six words is worth a surprising amount:

| Term | Meaning |
|---|---|
| **Incident** | An unplanned interruption or reduction in quality of a service. The goal is to **restore service as fast as possible** - not necessarily to find the root cause |
| **Problem** | The underlying cause of one or more incidents. Problem management finds and removes it. **Incident = stop the bleeding; problem = why did it bleed** |
| **Change** | A planned modification to the environment. It goes through approval so that changes do not cause incidents. The JD's "implement a change in accordance with change plan" refers to exactly this |
| **SLA** | Service Level Agreement - the contractual commitment for response and restoration time. Priority levels exist because different SLAs apply |
| **Priority (P1-P4)** | Set from **impact** (how many people/how critical) x **urgency** (how fast it must be fixed). A P1 is major - a whole site down, or a critical service |
| **RCA** | Root Cause Analysis - the write-up after a major incident explaining what happened and how it will be prevented |

**The one distinction most likely to be tested:** *incident vs problem*. Incident = restore service now. Problem = find and remove the underlying cause so it stops happening.

**Change management is the second most likely.** "Implement a change in accordance with the change plan" means: you follow the approved plan, at the approved time, with a rollback plan ready - you do not improvise on a live network.

---

# The troubleshooting mindset they are hiring for

If you get a scenario question - "a customer says their site is down, what do you do?" - they are testing **method**, not knowledge. Use this:

1. **Understand the fault.** What exactly is not working? For whom? One user, one site, everyone? When did it start? Did anything change?
2. **Check the scope.** Is it one service or all of them? That single question separates an application fault from a network fault.
3. **Check what the systems already know.** Is there an alarm on that circuit? A known outage? A change made recently?
4. **Work the layers.** Physical, then IP, then routing, then application - the same order as question 58 in document 01.
5. **Fix or escalate.** If it is yours, fix it and confirm with the customer that it is genuinely resolved. If not, escalate **with your findings attached**.
6. **Document.** Notes on the ticket, so the next person starts where you finished.

**Two things to say explicitly, because they score:**

- **"Did anything change recently?"** - in real operations, most incidents follow a change. Asking this marks you as someone who has thought about it.
- **"I'd confirm with the customer that it's actually fixed before closing it."** - closing tickets that are not really fixed is the classic first-line failure.

---

# Honest self-positioning for this role

If they ask directly "why should we take you when you have no network experience?", do not oversell. Say something close to this:

> "I'd be starting behind someone with networking experience, and I know that. What I'd bring is that I'm not new to systems being broken - I've spent a lot of evenings working out why a server wasn't responding, and I've learned to be methodical about it rather than guessing. I'm comfortable with Linux, with logs, with the protocol side of things from the software end. And I learn fast when someone shows me something once. The networking hardware side is a gap, but it's a gap I'm actively interested in closing, which isn't true of every gap."
