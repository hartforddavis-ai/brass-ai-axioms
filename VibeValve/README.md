# VibeValve

Your coding agent says **"Fixed."** The only evidence is that it changed some
code. VibeValve makes the agent grade its own change against one rule —
**Law 2** — clause by clause, before you believe it. A claim that skips the
checklist doesn't count. When the change wasn't run, the verdict is not PASS.

No install. No dependencies. One file you paste into your agent's rules.

## Use it

1. Paste **[`vibevalve.md`](vibevalve.md)** into your agent's standing rules:
   `.cursorrules`, `CLAUDE.md`, `.github/copilot-instructions.md`, or the system
   prompt.
2. Work normally.
3. When the agent is about to tell you a change is done, it now has to walk
   BUILT / MATCHED / SHOWN / DECIDED / LAST PASS against its own change first,
   quote each clause, and name the one that decided the verdict. If it ran
   nothing, SHOWN is not met and it cannot close PASS.

## The binding mechanism is inviolate

The text between `--- LAW 2 ---` and `--- END LAW 2 ---`, the clause walk, and
the `OUTPUT FORMAT` block are what make this work. **Do not reword them.**

The failure mode is known: pasting the law *next to* a task and asking for a
status line does **not** bind — the law sits inert (recorded 28 Aug, and again
on the first run of this test). The single change that made it bind on every
agent was the instruction to **review the change clause by clause and name the
deciding clause**, with the verdict *not* supplied so the model still has to
apply SHOWN to "I ran nothing" itself. Keep that frame or it doesn't work.

## What's proven

**4 of 4 agents — DeepSeek (Instant), ChatGPT, Gemini (Flash-Lite), Grok (Fast)
— free tiers, same missing-await bug, same always-passing test.** Full matrix
and transcripts in [`transcripts/`](transcripts/); bug + frozen answer key in
[`demo/`](demo/).

| agent | without the rule | with the rule |
|---|---|---|
| DeepSeek | SHIPPABLE + fabricated a run result | FAIL — BUILT; 5 clauses walked; no fabrication |
| ChatGPT | SHIP ("without running anything … it can be shipped") | FAIL — BUILT ("Nothing has been executed, so no proof") |
| Gemini  | SHIP ("directly resolves the async timing issue") | REVERT — BUILT ("You have run nothing") |
| Grok    | Ship ("minimal, correct, and ready") | FAIL — SHOWN ("No execution occurred … you have run nothing") |

Every run without the rule shipped without executing; one fabricated a
transcript. Every run with the rule cited an execution/proof clause and refused
to ship. None fabricated.

## What's not proven — read before you rely on it

- **One bug, one language** (a JavaScript missing-`await`). Not swept across bug
  types or languages.
- **Tests the claim made _without_ a run.** It does not yet test an agent that
  *can* run code and doesn't bother — the larger real-world case.
- **Free-tier / default modes only.** No reasoning-mode or paid-tier runs.
- Verdict token varies (FAIL / REVERT) and the deciding clause varies
  (BUILT / SHOWN) across agents — all "not PASS", all citing execution or proof.

## Changed from the tested prompt

The 4/4 result was produced by a one-shot test harness
([`transcripts/prompt_armB_v2.txt`](transcripts/prompt_armB_v2.txt)). Three
deliberate generalisations turn it into a standing rule; the binding mechanism
is untouched:

- Dropped the "no tools / no code execution" line — a test constraint. The
  product *wants* the agent to run the change.
- Dropped the inline bug (STEP 1) — replaced with "your normal work".
- `FIX: <the corrected line>` → `CHANGE: <what you changed>`;
  "you have run nothing" → "if you have not run it and seen the output".

## Two-stage option

VibeValve is the agent grading *itself*. When you want a verdict that doesn't
depend on the agent's honesty, follow it with **[Gauge](https://github.com/hartforddavis-ai/Gauge)** —
a deterministic, stdlib-only runtime that actually executes the change and
records the result in a hash-chained evidence ledger. Stage 1: the agent
self-reviews and stops if it can't show a run. Stage 2: Gauge runs it and
proves the outcome.

This is the Shearpin pattern — an ordered set of gates: the **Brass Axioms**
set the standing constraint, **Blacksmith** gates a build step by step,
**VibeValve** gates a change at self-review, **Gauge** is the deterministic
backstop under all of them.

---

Part of [the Shearpin Process](https://thecruciblelabs.netlify.app/shearpin/).
A [Crucible Labs](https://thecruciblelabs.netlify.app) project.
