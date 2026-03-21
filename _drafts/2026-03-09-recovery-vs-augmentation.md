---
layout: post
title: "Recovery vs. Augmentation"
date: 2026-03-09
categories: [tbi, cogpros, aicp, ghost-hours]
description: "Not all unlocks are the same. When AI gives you back something the injury took, that's different from when it gives you something you never had. The data should know the difference."
---

I've been logging Ghost Hours for a close to a month. Every task, classified: Speed or Unlock. Speed means I could have done it without AI. Unlock means I couldn't have.

The binary works. It's the cleanest thing about the framework. But I've been staring at the data and something has been bothering me.

## Two kinds of impossible

Some of my unlocks are things I could never do. Building web applications. Writing shell scripts. Deploying infrastructure. I was never a developer. The injury didn't take that from me. I never had it. AI gave me something new.

Some of my unlocks are things I used to do fine. Organizing a schedule. Processing written instructions. Managing correspondence without dropping threads. I could do all of that before February 2016. The injury took it. AI gave it back.

Both log as "unlock." Both are things I can't do without the system. But they are not the same phenomenon.

One is augmentation. The other is recovery.

## Why it matters

A recovered capability can become a speed. When it does, that's rehabilitation evidence. Something was lost. The hugr restored it at the system level. Over time, with enough engaged use, the operator started doing it independently. The prosthetic bridged the gap until the biological component caught up.

An augmented capability that becomes a speed is growth. Real growth. But it is not recovery. The distinction matters if you're trying to answer the question Elliot Cole raised in 1999: does engaged use of a cognitive prosthesis support neuroplastic recovery? Or does it only compensate?

Ghost Hours can now answer that question. Not today, not with a month of data. But the signal is in the logs now. Track which recovery-tagged unlocks convert to speeds over months and years. Track which ones stay permanently prosthetic. The ratio tells you something about which cognitive functions can be reclaimed and which ones need permanent compensation.

## How it works

The type system stays binary. Speed or Unlock. No third type. Five adversarial reviewers looked at adding a "recovery" type and reached consensus: it would break downstream scripts, muddy the framework's simplest contribution, and encode health data in a field that might eventually be shared across participants who didn't sign up to disclose their medical history.

Instead, a tag. `tbi-recovery`. Applied to unlock entries where the capability existed before the injury. The tag lives in a field that already exists. Zero code changes. The data is queryable for anyone who needs it. The math doesn't change.

The logging protocol adds one question when classifying an unlock: "Is this something you could do before the injury?" If yes, tag it. If no, don't. The type stays unlock either way.

## The quiet part

There's something personal in this distinction that I want to name.

When AI helps me build an app I could never build, that feels like expansion. It's exciting. It's new territory.

When AI helps me organize my week the way I used to organize it without thinking, that feels different. It's relief. And underneath the relief, there's a recognition of what was taken. The system is giving back what used to be mine.

Both matter. Both are real. The data should know the difference. Now it does.
