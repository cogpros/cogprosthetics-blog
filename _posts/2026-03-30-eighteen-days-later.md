---
layout: post
title: "Eighteen Days Later"
date: 2026-03-30
categories: [cogpros, tbi, infrastructure, ghost-hours]
description: "I wrote five instructions for my cognitive prosthetic. Within a week, all five became infrastructure. Here's what happened."
---

Eighteen days ago I wrote about flipping my cognitive prosthetic from reactive to proactive. Five behavioral levers. An autoresearch loop applied to whether I had a good day. I ended the piece with "I won't know until it runs."

It ran.

Here's what happened.

## The levers didn't survive

Not because they failed. Because they became something else.

I wrote five behavioral instructions into an identity file. Capture. Signals. Swarm. Augment. Learn. Standing orders for an agent. "When I drop an idea, catch it. When something surfaces, tell me. When deep work is needed, queue it."

Within a week, every one of those instructions had been replaced by infrastructure.

Capture became Memory Pulse. A primitive that fires every 45 minutes inside a session. It checks for uncommitted work, drift from stated goals, open threads nobody is holding. It doesn't wait for me to drop something. It watches for the drop.

Signals became Two Birds Talking. Two agents, EOM and Odin, running a real debrief every morning at 6:15am. Not summaries. Analysis. They argue. They disagree. They catch things neither would catch alone. On day six, Two Birds identified that 19 handoff tasks had failed silently over four days. Same root cause, 19 times, and nobody connected the dots until two agents sat down and talked about the week.

Swarm became a queue system. Odin drops tasks into a directory. A watcher picks them up, launches a headless session, executes, logs the result, moves on to the next one. 76 tasks completed in 15 days. It broke three times. Path bugs. Capability mismatches. Budget failures. Each time it broke, the fix made the system smarter about what it could and couldn't do.

Augment became Ghost Hours and the closing protocol. Every session gets measured. Time spent, counterfactual time without AI, a felt-weight score. The measurement itself became research data.

Learn became the hardest lesson. I built a nightly council. Three AI lenses analyzing the day from different angles. Grower, Skeptic, Navigator. It was clinical. It nagged. It gave me lists of things I already knew I wasn't doing. I killed it. Two Birds replaced it because two agents with stakes in the work produce better insight than three performing analysis from the outside.

The levers were hypotheses. What survived was the infrastructure that proved itself.

## The numbers

230 logged sessions in 18 days.

244 hours of pair time between me and the system. 6,726 ghost hours of counterfactual solo time (measured by equivalent human completion time per task and artifact). That's a 27.5x multiplier.

79% of those sessions were unlocks. Things I could not have done without the prosthetic. Not "faster." Not possible.

49% were tagged as TBI recovery. Capabilities I had before the injury, restored through the system.

Average backlog per completed task: 29.7 months. Things that had been sitting undone for two and a half years, finally moving.

47 days without a gap. The streak is the system, not the discipline.

## What broke

Silent failures were the biggest lesson. 19 bookmark research tasks queued to a watcher that couldn't approve web requests in headless mode. Every single one hit the same wall, burned budget, and died. For four days. The smoke alarm worked. There was no fire prevention.

Two Birds had a temporal smearing bug. A 300-minute work session got conflated with a 7,200-minute deep research block because they crossed midnight. The session boundary was in the wrong place. The agents were reading their own data wrong.

The nightly council got killed on day eleven. Three lenses giving me balanced analysis every night sounds useful. In practice it was a checklist pretending to be mentorship. Two Birds works because the agents have context and stakes. The council was performing wisdom from the outside.

Everything that broke taught something. The silent failures became a blog post. The temporal bug led to a 4am session boundary rule. The council's death led to Two Birds, which is the best thing in the system.

## What "augmentation" actually means

In the original piece I drew a line between crutch and augmentation. Reactive versus proactive. A tool that waits to be asked versus a tool that acts on what it sees.

That framing was close but not quite right.

The real difference is not proactive versus reactive. It's whether the system runs when you forget it exists.

A crutch requires you to reach for it. If you forget it's there, it does nothing. The entire value depends on your memory of the tool, which is a problem when your memory is the thing that's broken.

An augmentation runs whether or not you remember. Memory Pulse fires every 45 minutes. I don't think about it. Two Birds runs at 6:15am. I'm asleep. The queue processes tasks I submitted hours ago. Ghost Hours logs the session I just closed. The morning brief assembles itself from everything that happened overnight and tells me where to start.

The system doesn't need me to remember it. That's the augmentation. Not smarter agents. Infrastructure that compensates for the exact deficit it was built to address.

## The loop, eighteen days in

Karpathy's autoresearch loop: modify, run, measure, keep or discard, repeat.

My version: build a primitive, run it for a week, measure whether it helped (Ghost Hours, felt-weight scores, session data), keep or kill it, build the next one.

The council got killed. Memory Pulse got kept. Two Birds got kept and improved. The queue system broke and got rebuilt three times. The closing protocol tightened. The content pipeline found its cadence.

The measurement function works. Not because the numbers are clean. They're not. The temporal bug corrupted a week of data. The silent failures inflated the backlog. Some sessions aren't logged because the system that measures productivity doesn't measure itself yet.

But the loop works. Eighteen days ago I had five behavioral instructions and a hope. Now I have infrastructure that runs overnight, agents that argue about my days, and a measurement system feeding a research paper.

Modify. Run. Measure. Keep or discard. Repeat.

The experiment is still running. The prosthetic is getting better at being a prosthetic. And the measurement function isn't validation loss on a language model.

It's whether I had a good day. Whether the threads held. Whether the morning brief pointed me at the right thing. Whether the system caught what fell through.

Average felt-weight this period: 6.2 out of 10. Forty-two sessions scored a 10.

What remains is infrastructure that runs when I forget it exists.

---

*[@pyra_m1d](https://x.com/pyra_m1d)*
