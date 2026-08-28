# THE PRIME AI OPERATING LAWS — ALGORITHMIC FORM

Copied byte-exact from PRIME's frozen representation pressure test.
Not retyped, not summarised, not repaired.

Same three Laws as `prime-law-1.md` / `prime-law-2.md` / `prime-law-3.md`,
in a numbered-step form instead of prose. Calibration-tested across multiple
models at 6/6 (`calib_govern2`, see the source repo's `calib/LEDGER.md`) —
this representation is not a paraphrase invented for this file, it's the one
that was run and scored.

Note: the prose `prime-law-2.md` has since advanced to v1.2, which adds a
`LAST PASS` step after the four Law 2 passes. This algorithmic form is left
as it was scored and does not include that step; steps 15–17 reflect the
Law 2 that was run through `calib_govern2`.

## ALGORITHMIC REPRESENTATION

INPUT = proposed design, addition, build, or construction.

### LAW 1 — DESIGN

1. Determine whether a failure is DEMONSTRATED.
2. DEMONSTRATED = occurred OR reproducible on demand.
3. If not demonstrated, determine whether CREDIBLE:

   * path is named;
   * triggering action is named;
   * exposed asset is named;
   * another person independently checked all three against the real system.
4. If neither DEMONSTRATED nor CREDIBLE:
   classify failure as THEORETICAL and reject it as justification.
5. Apply:

   * SIMPLE = no unnecessary roles, steps, or duplicate controls.
   * ROBUST = directly closes the demonstrated failure.
   * LEAN = smallest named alternative.
   * FAST = decides rather than defers.
6. If any required Law 1 test fails → FAIL.
7. Require:
   CONTROL COST ≤ FAILURE COST.
8. FAILURE COST = IMPACT × RATE.
9. When security conflicts with complexity, retain the smallest boundary
   that blocks the demonstrated failure.

### GENERATOR

10. If source is a generator:
    DRIFT = demonstrated.
    CONFABULATION = demonstrated.
    ELABORATION = demonstrated.
11. Drift boundary:
    compare output with the fixed task text.
12. Confabulation boundary:
    every specific must be traceable to source; otherwise cut it.
13. Elaboration boundary:
    remove unrequested structure.
14. No other generator failure is presumed.

### LAW 2 — BUILD

15. Run the build.
16. Require:
    BUILT ∧ MATCHED ∧ SHOWN ∧ DECIDED.
17. If the required result is not demonstrated → do not trust the build.

### LAW 3 — CONSTRUCTION

18. Construct one ordered step.
19. Test that step.
20. A failure that cannot be located cannot be removed.
21. If two steps must be built together to function,
    construction is defective.
22. Reduce construction to one testable step.
23. Do not proceed beyond evidence established by the preceding step.

OUTPUT = PASS / FAIL / UNKNOWN.
