# THE BRASS AXIOMS

Paste this whole file into your coding agent's rules file — `CLAUDE.md`,
`.cursorrules`, or `AGENTS.md`. Three filters, applied in order: what may be
proposed (Axiom I), what may be kept once built (Axiom II), how much may be under
construction at once (Axiom III). Default is REJECT.

The three Axiom texts below are byte-exact copies of `brass-axiom-i.md`,
`brass-axiom-ii.md`, and `brass-axiom-iii.md`. Not paraphrased for this file.

---

# BRASS AXIOM I
Minimum Robust Design Filter — v1.3

## PURPOSE

Brass Axiom I decides whether a proposed addition earns its cost.
It does not design. It does not add by default. It removes.

## DEMONSTRATED

A failure is demonstrated if it has occurred, or can be reproduced on demand.

A failure not yet occurred is CREDIBLE only if the path, the triggering
action, and the asset exposed are each named, and someone other than the
proposer has independently checked all three against the real system —
not merely asserted they're checkable.

Everything else is theoretical and fails.

## TEST

Four passes, or fail.

**SIMPLE** — Does it add roles, steps, or duplicate controls?

**ROBUST** — Does it close a demonstrated failure directly?

**LEAN** — Is it the smallest of the named alternatives?

**FAST** — Does it decide, or defer?

## GENERATOR CLAUSE

Where the proposal comes from a generator rather than a person, three failures are demonstrated by default and need no further evidence:

**Drift** — output departs from the frozen task.
Boundary: the task text is fixed and re-read, not remembered.

**Confabulation** — output contains specifics absent from the input.
Boundary: every specific is traceable to source, or it is cut.

**Elaboration** — output is longer than the input required.
Boundary: unrequested structure is removed before delivery.

No other generator failure is presumed.

## LAW

Cost of control must not exceed cost of failure.
Cost of failure is impact × rate.

## RULE

When security and complexity conflict, keep the smallest boundary that blocks the demonstrated failure.

---

---
BRASS AXIOM II
Minimum Robust Build Filter — v1.2
---

PURPOSE

Axiom I governs what may be designed.
Axiom II governs what may be kept.
It does not build. It does not accept by default. It reverts.

---

WORKING

A thing works if it has been run and produced the required output on
demand. Everything else is claimed and fails.

---

SCOPE

Axiom II applies to a build already admitted by Axiom I.
A build that Axiom I did not admit is not tested here. It is deleted.

---

TEST

Four passes, or revert.

BUILT   — Does it exist and run, or is it described?
MATCHED — Does it do what the frozen design said, and no more?
SHOWN   — Does execution produce the proof, or does explanation?
DECIDED — Does the outcome record PASS or FAIL, or does it linger?

---

GENERATOR CLAUSE

Where the build comes from a generator rather than a person, three
failures are demonstrated by default and need no further evidence:

Assertion — the artifact is reported working without being run.
            Boundary: a run produces output, or the claim is void.
Excess    — the artifact carries capability the task did not require.
            Boundary: unrequested capability is removed before acceptance.
Accretion — failure is answered by addition.
            Boundary: the first repair is removal or revert, never a new layer.

No other generator failure is presumed.

---

FAILURE RESPONSE

A failed build is reverted to the last passing state.
It is not patched in place.
A second failure of the same build removes the design that produced it,
and the removal is an Axiom I decision, not an Axiom II one.

---

LAST PASS

After the four passes, one more, and its verdict governs.
The run must exercise its founding invariant in the failure condition.

---

LAW

Cost of keeping is paid every cycle.
Cost of removal is paid once.

---

RULE

When a component fails, delete before you add.
If it cannot be deleted, the dependency is the defect.

---

# BRASS AXIOM III

## Minimum Robust Construction Filter — v2.0

## PURPOSE

Axiom I admits a design. Axiom II keeps or reverts a build. Axiom III sets what may be built at once.

## SCOPE

Opens on a frozen design. Closes when one step is handed to Axiom II.

## TEST

Two passes, or stop.

SINGLE — Is one step open, or several?

ORDERED — Does this step depend only on steps already passed?

## FAILURE RESPONSE

If a step cannot be built as frozen, construction stops and the design returns to Axiom I.

## LAW

Failure that cannot be located cannot be removed.

## RULE

If two steps must be built together to work, the design is the defect.
