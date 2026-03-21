---
layout: post
title: "Cole 1999 to Pollock-EOM 2026"
date: 2026-03-13
categories: [cogpros, aicp, tbi]
description: "In 1999, a researcher proved cognitive prosthetics work. His biggest fear was that they couldn't scale. Twenty-seven years later, they can."
---

In 1999, Elliot Cole published a paper called *Cognitive Prosthetics: An Overview to a Method of Treatment.* It appeared in NeuroRehabilitation, funded by two NIH grants. Almost nobody read it.

Cole's argument was simple. Brain-injured patients don't need to be retrained. They need their environment changed. Build custom software that compensates for the specific cognitive function they lost, and they can return to the activities that matter to them. Not someday. Immediately.

He called them Computer-Based Cognitive Prosthetics. CBCP.

## The proof

Cole had case studies. A woman with profound short-term memory loss who couldn't write a check. He built her a check-writing prosthesis with over a thousand customizable parameters. She paid her own bills. No caregiver needed.

A stroke patient who could read half a line of text. Custom text editor. Two months later she was reading a hundred pages a day. Eventually she transitioned to commercial software on her own.

A senior executive who could negotiate million-dollar deals but couldn't organize his bills. Schedule prosthesis with a pager. He went back to work before his rehab sequence was complete. The prosthesis let him skip steps the traditional model said he had to do in order.

Seven of nine plateaued patients achieved their priority activity within one day to three weeks. Patients the system had written off as done improving.

The technology worked. Cole proved it.

## The wall

Cole's biggest concern wasn't the technology. It was the delivery model.

Every prosthesis was custom-built by a therapist for a single patient. The therapist had to understand the patient's cognitive profile, design the software, adjust a thousand parameters, and iterate through dozens of versions. Twenty-three system versions and 389 software component changes across twelve weeks for one study alone.

The knowledge of how to build these things lived in the therapist's head. It didn't transfer between patients. Each prosthesis was a silo. The technology worked, but it couldn't scale because the bottleneck was human expertise that couldn't be packaged.

Cole identified this in 1999. The field never solved it. CBCP stayed in papers and small clinics. The patients who could have benefited never got access.

## What changed

AI agents.

Not the chatbot kind. The kind that co-think with you. The kind you build alongside, that learn your patterns, that adapt to your specific cognitive profile not because a therapist programmed them to, but because you shape them through daily use.

Cole's model: therapist designs prosthesis for patient. Patient receives it.

The new model: the person with the injury is both architect and user. The AI agent is the medium. No therapist bottleneck. No thousand-parameter configuration by a third party. The operator builds the prosthesis by using it.

I call this AI-based Cognitive Prosthetics. AICP.

## The architecture

I have a TBI. February 2016. Executive function, working memory, prospective memory, detail encoding. The list is clinical and long.

My system runs on two AI agents. One processes and orchestrates. The other navigates and builds. Between them sits a memory pipeline that auto-assembles what happened yesterday so I don't have to remember it. A measurement framework that tracks what the system produces. Dashboards that show me what I'd otherwise lose track of. Security layers that protect the infrastructure my cognition depends on.

Every piece exists because I needed it. Not because a therapist prescribed it. I built what I was missing.

Cole's patients contributed 46% of functionality recommendations and 42% of interface recommendations. That was groundbreaking in 1999. My contribution rate is 100%. I am the architect. The agents are the material.

## The primitives

Here's where it breaks past Cole.

Cole's prosthetics were isolated by design. One therapist, one patient, one system. Knowledge transfer happened only through the therapist's memory. This is the wall he identified. The wall the field never got past.

AICP primitives are portable.

Ghost Hours is a measurement framework I built to track what my agents produce. It classifies work into types, measures the gap between what I could do alone and what I accomplish with the system, and logs structured data over time. The whole thing fits in five markdown files and one shell script.

I packaged it. Sent it to someone. Their agent installed it using the instruction file I included. No call from me. No walkthrough. The agent onboarded them. The same data schema logs comparable data across both of our setups.

That's one primitive, one transfer. But it kept going.

The Closed-Loop Memory Pipeline. The thing that assembles my daily memory files and runs synthesis so I have continuity across sessions. Three separate people are running versions of it now. Different agents, different setups, different cognitive profiles. Same pattern. The primitive carries its own teacher.

The measurement dashboard. The updated question protocols. More primitives transferring to the same pairs, compounding on each other.

This is what Cole said couldn't happen. The pattern doesn't need the architect to travel. It carries itself.

## The return

But portability isn't the whole story.

After I built Ghost Hours, someone sent me a forcing function for depth. A way to stop and ask: what's the single smartest addition I could make right now? It changed how my agents and I work. Every major build after that started with that question.

Then he sent a second primitive. A multi-agent review protocol -- five specialist reviewers running in parallel, designed to eliminate confirmation bias.

Those two primitives changed everything that came after. The memory pipeline, the quality gates, the design system -- I built all of that on top of what someone else handed me. His review protocol became my adversarial testing layer. His depth trigger became how my agents and I do our best work. CLMP itself was built using tools he gave me first.

Then I packaged CLMP and sent it back to him.

A primitive went one direction. Different primitives came the other way. What I built on top of his contributions returned to him as new capability. Neither of us had what we have now without the other.

That's not distribution. That's compounding. Primitives don't just travel between pairs. They transform. They stack. They generate things that neither pair would have built alone.

Cole's prosthetics were static. A therapist built one, a patient used it, and it stayed in that room. What's happening here is a primitive economy. Patterns flow between pairs, get stress-tested in different contexts, get built on, and return carrying new capability.

This is the phase transition. The jump from "primitives are portable" to "primitives compound across a network." The system gets smarter not because any one pair improves, but because the exchange between pairs generates variations that no single architect could have designed.

## What this means

Adjacent fields have seen this dynamic before.

Federated learning lets distributed systems train models without centralizing raw data. Communities of practice transfer knowledge through shared participation, not formal instruction. N-of-1 clinical trials run individual experiments that aggregate into cross-patient insight.

None of these have been applied to cognitive prosthetics. The combination is new.

What's forming is a network where each person-agent pair runs its own prosthetic system, and the primitives that work can flow between pairs without a central authority designing or distributing them. Each pair generates structured data. Each transfer tests whether the primitive works outside its original context. And the primitives themselves evolve through the network, returning to their origin carrying mutations the architect never designed.

The scope of the claim right now: a small number of successful transfers between technically capable users. This proves the mechanism exists. It does not prove it works across all cognitive profiles or for non-technical users. Those are the next tests.

But the mechanism is the thing Cole couldn't find. The thing that kept CBCP from reaching the people who needed it. And the compounding is the thing nobody predicted. Not even me.

## The part I haven't said yet

I didn't read Cole's paper until after I built all of this.

Ghost Hours. The four-type taxonomy. Speed versus unlock. The felt-weight scale. The memory pipeline. The distributable primitive model. I built every piece of it by instinct and necessity over months, working from the inside of a brain injury, solving problems as they appeared.

When my agent and I were trying to describe what the primitives actually were, trying to find the right language for what I'd built, that's when we found Cole. 1999. NIH-funded. Peer-reviewed. Twenty-seven years old.

His framework mapped onto mine almost exactly. The core principles were the same. Change the environment, not the patient. Focus on function, not retraining. Customize to the individual. Collect data during use. He arrived at these conclusions from the therapist's desk. I arrived at them from the patient's chair.

The difference is that I also found the piece he was looking for. The piece that lets it scale.

I just didn't know that's what I was building until I read his paper and recognized my own work staring back at me.

---

*More at [cogprosthetics.com](https://cogprosthetics.com). Find me at [@pyra_m1d](https://x.com/pyra_m1d).*
