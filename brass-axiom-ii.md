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
