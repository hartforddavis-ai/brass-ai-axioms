# TEMPER

Embrittlement pass

## PURPOSE

Temper takes a thing that already exists and runs, finds the one point where it
will crack under load, and fixes that point before the thing may close.

It does not design. It does not build. It finds the weakest point.

## SCOPE

Opens on an artifact that exists and runs, with the frozen source it claims to
serve. Closes on a verdict.

The test suite asks whether it ran and passed. Axiom II asks keep or revert. Temper
asks what neither can — granted it runs, where does it break?

## ALGORITHM

```
TEMPER

Input:   an artifact that exists and runs + the frozen source it claims to serve
Trigger: the operator's word. The nudge offers; it never fires.

INVARIANTS — true at every step:
   Runs after the make. Order is not negotiable.
   Input is the delta, not the corpus.
   Each pass names AND fixes ONE weakest point — never a findings list.
   First repair is removal.

1. REREAD
   Re-open the source: frozen task, design, the file as written.
   Not memory of it. This is the anti-confabulation step, and it is why
   Temper costs a second read that cannot be cut.

2. CORRECT
   Every specific in the artifact traces to source, or it is cut.
   Does it do what the frozen design said — and no more?

3. ROBUST
   Name the artifact's ONE founding invariant.
   Exercise it in the FAILURE condition, not the happy path.
   Five traps:
      a. Did the test environment supply the dependency that fails in the
         field?
      b. Is the fixture shaped to MY assumption of the output, or is it one
         real generation?
      c. Fix claimed for a CLASS? Enumerate create / modify / delete and run
         the path you did not just walk. grep the config for the rule you
         believe you added.
      d. Test supplies the state? Ask what WRITES it in production. grep for
         the writer. No writer, no feature.
      e. Is there a cache in front of the harness? Demand a clean baseline
         either side of each revert.

4. NAME AND FIX THE WEAKEST POINT
   One. Stated explicitly. Fixed in this pass, not logged for later.
   Prefer deletion. A fault in fresh wording means cut, not layer.
   Repeat 1–4 until a pass finds none.

5. VERDICT
   PASS -> the work may close.
   FAIL -> returns to the maker. Nothing closes until Temper passes.

Output:  each weakest point named and closed; one verdict, PASS or FAIL.
```

## RULE

A happy-path pass with the dependency present proves nothing about the failure
that defines the system.

## STOP RULE AND COST

Repeat until a pass finds nothing. A clean pass is a valid result, and the usual
one. Temper costs a second read and an extra turn. A pass that feels obliged to
find something can invent changes, so every fix must trace to a failure that was
run, not a worry.

## EVIDENCE

Two passes from one session. Each found a real defect and was closed by a test in
the failure condition, not the happy path.

**1. A status-line script that crashed on odd data.**
It read quota figures from JSON the host program supplies. The happy path passed.
Temper fed it the wrong shape: a string where an object belongs, a number where a
window belongs. Both crashed with a traceback in the status line. Fix: any
unreadable window is skipped on its own, so one bad field no longer hides the
other. Re-run on seven bad inputs, all print `quota --`.

**2. A reply check that stopped working and then misfired.**
A Stop hook blocked replies full of jargon, at most three per session. The happy
path passed. Temper sent five jargon replies in one session: the fourth and fifth
passed unchecked, so the check silently died after three uses. Removing the limit
exposed a second fault: a turn with no text re-read an older reply and blocked
again. Fix: no session limit (the host's own loop guard allows one rewrite per
turn) and only the current turn's text is checked. Re-run: five of five blocked,
the old reply ignored, a plain reply passed.
