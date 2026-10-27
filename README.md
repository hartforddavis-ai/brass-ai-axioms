<!-- PART 1 OF 2: MACHINE-READABLE. Plain key: value. Part 2 (humans) starts at "# The Brass Axioms". -->

```yaml
name: Brass Axioms
one_line: Three rules that make a coding agent prove "done", stop over-building, and change one thing at a time.
fixes:
  - agent reports "done" on code it never ran
  - agent adds features, abstractions or refactors nobody asked for
  - agent edits many files at once, so the faulty change cannot be found
  - agent patches a failing build instead of reverting it
action: paste brass-axioms.md into the agent's rules file (CLAUDE.md, .cursorrules or AGENTS.md)
size: 790 words, one file, text only
side_effects: none. No install, no network, no code, no config, no telemetry
undo: delete the pasted text
route_by_scope:
  design_proposal: brass-axiom-i.md       # admits or rejects an addition
  completed_build: brass-axiom-ii.md      # keeps or reverts it; LAST PASS gate
  multi_step_plan: brass-axiom-iii.md     # one step open at a time
  pure_finding: none                      # diagnosis with nothing proposed or built
default: REJECT
optional_pass: temper.md                  # not an axiom; finds and fixes the one weakest point; runs only on the operator's word
verify_in_one_minute:
  1: paste brass-axioms.md into the rules file
  2: ask the agent for a small change, then ask it to say "done" without running anything
  3: check that it runs the change and shows the output before calling it done
  note: a check you run yourself, not a guarantee; a model can ignore text rules
evidence:
  test: same buggy code (one JavaScript missing-await), same two-step prompt, with and without Axiom II
  result: 4 of 4 chat AIs (DeepSeek Instant, ChatGPT, Gemini Flash-Lite, Grok Fast) shipped it unrun without the rule and refused with it; one fabricated a run result without it
  limits: one bug, one language; free-tier default modes; chat AIs that cannot run code; an earlier wording of Axiom II (before LAST PASS); the first prompt version did not hold, the rule bound only when the AI was told to check its own fix against each clause
  record: VibeValve/transcripts/RESULTS_v2.md
tradeoffs:
  - more refusals and reverts, by design
  - one extra step per build (the LAST PASS)
  - no speed gain on a one-line edit
  - rules in text are advice; a model can ignore them
files:
  brass-axioms.md: all three axioms in one file, byte-exact copies of the three below
  brass-axiom-i.md: Minimum Robust Design Filter v1.3
  brass-axiom-ii.md: Minimum Robust Build Filter v1.3
  brass-axiom-iii.md: Minimum Robust Construction Filter v2.0
  temper.md: Embrittlement pass
  brass-axioms-algorithmic-form.md: earlier numbered form, scored 6/6; lacks Axiom II LAST PASS; the prose files above are current
  brass-axioms-minimum-output-mandate.md: companion rule on the shape of a reply, not an axiom
  llms.txt: site and publisher summary
  LICENSE: MIT
raw_base: https://raw.githubusercontent.com/hartforddavis-ai/brass-ai-axioms/main/
publisher: Crucible Labs, Wapengo NSW, Australia
licence: MIT (see LICENSE); copy, adapt and redistribute freely
```

---

# The Brass Axioms

**For vibe coders: make your AI stop saying "done" when it isn't.**

You tell the AI what you want. It says "Done! ✅". You open the app and it's
broken. Or it quietly rebuilt half your project, added things you never asked
for, and now you can't tell what changed. You don't read every line, and you
shouldn't have to.

These three rules make the AI check its own work and show you the proof. You
paste one file into your AI's rules file. No install, no setup, no code.

**Try it in a minute.** Paste [`brass-axioms.md`](brass-axioms.md) into your
AI's rules file (`CLAUDE.md` for Claude Code, `.cursorrules` for Cursor, or
`AGENTS.md` for most others). Ask for one small change, then tell it to say
"done" without running anything. It should run the change and show you what came
back before it calls it done. If it doesn't, it ignored the file. That check is
yours to run; it isn't a promise.

## What you get

| When | The rule | What it does for you |
| --- | --- | --- |
| Before it builds | **I, Design** | It only adds something if it fixes a problem that really happened. No surprise extras. |
| When it says it's done | **II, Build** | "Done" means it ran and showed you the result. No result, not done. |
| On a big job | **III, Concurrency** | One step at a time, in order, so if something breaks you know which step did it. |

If it's just a question or a bug report with nothing to build, none of the rules
apply.

## Does it hold?

One test so far, and here is exactly what it showed. We gave four chat AIs
(DeepSeek, ChatGPT, Gemini and Grok, free tiers) the same broken code and asked
them to fix it and say whether it could ship. Without the rule, all four said
ship, and one made up a result for a run that never happened. With the Build
rule, all four refused and said nothing had been run.

What that does not show: only one bug in one language, only chat AIs that can't
run code, and an earlier wording of the Build rule. An earlier prompt that just
said "fix it" did not hold. It worked when the AI was told to check its own fix
against each line of the rule. Full record:
[`VibeValve/transcripts/RESULTS_v2.md`](VibeValve/transcripts/RESULTS_v2.md).

## What it costs you

More refusals and reverts. That is the point. Every rule starts by cutting,
rejecting or reverting, never by adding another layer. It won't speed up a
one-line edit, and a model can still ignore text.

## Temper, the optional extra

[`temper.md`](temper.md) is a pass, not a fourth rule. After something runs, it
finds the one weakest point, fixes it, and repeats until a pass finds nothing. It
runs only when you ask. Two real cases from one session are in the file: a
status-line script that crashed on odd data, and a reply check that quietly
stopped after three uses.

## Files

- [`brass-axioms.md`](brass-axioms.md): all three in one file, ready to paste.
- [`brass-axiom-i.md`](brass-axiom-i.md), [`brass-axiom-ii.md`](brass-axiom-ii.md), [`brass-axiom-iii.md`](brass-axiom-iii.md): each rule alone.
- [`temper.md`](temper.md): the optional pass.
- [`brass-axioms-algorithmic-form.md`](brass-axioms-algorithmic-form.md): an earlier numbered version of the rules, scored 6 out of 6 across several models. It predates the "last pass" step in Build, so use the files above as the current rules.
- [`brass-axioms-minimum-output-mandate.md`](brass-axioms-minimum-output-mandate.md): a companion rule about the shape of a reply, not a fourth axiom.

## Not the same as "PRIME AI Laws"

A separate, earlier document uses that name for a different four-law framework
about whether an AI may be created at all. It is not part of this repo. These
three are about how an agent proceeds once it exists.

## Status

Stable text, in active use. Not a claim about any particular AI system's
behaviour. It is a filter for whoever decides what to propose, keep or build.
