# PRIME AI Operating Laws

**A 30-line guardrail that makes your coding agent prove it instead of promise it.**

Vibe coding is fast right up until the agent says `done ✅` on code it never
ran, adds three abstractions you didn't ask for, and edits six files at once
so you can't tell what broke. These three Laws are the seatbelt. Same speed,
same vibes — the house just stops cheating.

Default is REJECT. A change earns its place or it doesn't ship.

## Quickstart

Paste [`prime-laws.md`](prime-laws.md) into your agent's rules file:

| Agent | File |
| --- | --- |
| Claude Code | `CLAUDE.md` |
| Cursor | `.cursorrules` |
| Codex / Copilot / most others | `AGENTS.md` |

That's it. No install, no dependency, no config. It's text.

## The three Laws, in plain language

| Law | What it does | What it kills |
| --- | --- | --- |
| **1 — Design** ([`prime-law-1.md`](prime-law-1.md)) | Nothing gets added unless it fixes a failure you can actually reproduce. | The "while I'm here" refactor. |
| **2 — Build** ([`prime-law-2.md`](prime-law-2.md)) | "It works" means it ran and produced the output. Receipts or it didn't happen. | `done ✅` on code that was never executed. |
| **3 — Concurrency** ([`prime-law-3.md`](prime-law-3.md)) | One step at a time, in order. | Six-file diffs where you can't find the line that lied. |

Each finding binds to the Law matching its scope, in order: Law 1 for a
design proposal, Law 2 for a completed build claim, Law 3 for a multi-step
construction plan. A pure finding — diagnosis or observation with nothing
yet proposed, built, or under construction — runs none of the three.

## Why it makes you faster

You're not reading every line the agent writes — that's the whole point of
vibe coding. The Laws read it for you: one file changed, one command run,
one PASS/FAIL. You skim, you ship, and you're not up at midnight debugging a
change that never actually existed.

It removes rules, it doesn't add them. Delete-first is the entire
philosophy — every Law's first move is to cut, revert, or reject, never to
bolt on another layer.

## Files

- [`prime-laws.md`](prime-laws.md) — all three Laws in one file, ready to paste.
- [`prime-law-1.md`](prime-law-1.md) / [`prime-law-2.md`](prime-law-2.md) / [`prime-law-3.md`](prime-law-3.md) — the Laws individually, full text.
- [`prime-laws-algorithmic-form.md`](prime-laws-algorithmic-form.md) — the
  same three Laws as a numbered procedure. Calibration-tested across
  multiple models at 6/6, not a paraphrase written for this repo.
- [`prime-minimum-output-mandate.md`](prime-minimum-output-mandate.md) — a
  companion rule, not a fourth Law: governs the shape of a response, not the
  validity of the decision inside it.

## Not the same as "PRIME AI Laws"

A separate, earlier document also uses the name "PRIME AI Laws" for a
different four-law framework (Humanity / Human / Authority / Preservation) —
a proposed gate on whether an AI may be created at all. That document is
not represented here and is a different thing. These three are the
**operating** laws: not whether an AI may exist, but how it proceeds once
it does.

## Status

Stable text, in active use. Not a claim about any particular AI system's
behavior — a filter applied by whoever is deciding what to propose, keep,
or build.
