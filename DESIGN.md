# Shearpin — design language

Status: DRAFT, 29 Aug 2026. Step 2 of the launch plan
(`~/.claude/plans/read-project-vibevalve-misty-moon.md`).

## What Shearpin is

**The Shearpin Process** — one thing: a method for placing a sacrificial
break-point in a workflow so the run stops when proof is absent, *and* the suite
of tools that are those break-points. The tools are the Process's, not a
catalogue sold beside it: VibeValve, the Brass Axioms, Blacksmith and Gauge are
the four pins. Child of **The Crucible Labs** — same family, colder end of the
same forge.

Named for the shear pin: the pin driven through a joint between two rotating
parts, carrying the drive. It is the weakest, cheapest, most accessible element
in the chain, calibrated to a known load. When torque crosses that limit the pin
**shears square at the joint face** — clean fracture, perpendicular to the axis —
and the two parts decouple and run free. The shaft, the gearbox and the prop are
untouched. Pull the two stubs, fit a fresh pin, carry on.

That is Law 2's economics — *cost of keeping is paid every cycle, cost of removal
is paid once* — and it is what these tools do. Each is a pin at a joint: between
"the agent says *Fixed.*" and you believing it (VibeValve); between a generator's
output and the frozen task (the Brass Axioms); between an untrusted generator and a
build (Blacksmith); between raw claims and anything that trusts them (Gauge).
Not a linter, not a test suite, not a policy layer — a **decoupler**. It breaks
the transmission of an unproven claim into a trusted place.

## The thesis — steampunk as instrumentation, not costume

The genre ships maximalist: brass, cogs, goggles, sepia, clutter. Every name
generator and mood board proves it. Shearpin takes the opposite discipline —
**one instrument, drawn exactly, in large negative space, on near-black ground.**
Restraint is the entire differentiator. Goth is the touch: high contrast,
severe hairlines, funereal calm. No cog is ever drawn.

## Inherited from Crucible — the family tie, unchanged

- Ink ground: `--ink-deep:#050710`, `--ink-mid:#07090f`, radial-gradient body.
- Three-font system: Cormorant Garamond (display), EB Garamond (body),
  IBM Plex Mono (labels).
- The `◆` work marker.
- 940px column; works rows two-column collapsing to a stack at ≤640px.
- Mono footer: location line + contact email.
- `display: browser` manifest — this page's job is sending people outward.
- `netlify.toml` security headers block, verbatim.

## Shifted for Shearpin

| Token | Crucible | Shearpin | Why |
|---|---|---|---|
| Primary type colour | `--cream:#ece2cd` (warm paper) | `--ash:#c7ccd1` (cold steel-grey) | The child reads as the cold end |
| Gold | primary accent | **family thread only** — the `◆` mark and one hairline | Demoted, not removed |
| Structural borders | gold-alpha | ash-alpha, fainter | Colder, quieter |
| Accent | gold | `--steel:#5b6673` — a desaturated grey, kept deliberately *short of blue* | See constraint below |
| Hero | molten-pour photo | technical line-drawing of a sheared pin (inline SVG, no external asset) | The whole aesthetic in one figure |

## Hard constraint — Brass Axioms' status colours are load-bearing

Star **GOLD**, PASS **GREEN**, FAIL **RED**, UNKNOWN **BLUE**. UNKNOWN is
deliberately blue so it never reads as a softened failure. **No decorative blue
anywhere a verdict can appear.** This is why the cold accent is `--steel`
(grey, ~15° off neutral) and not the obvious glacier blue. Any future surface
that renders a verdict drops even `--steel`.

## The mark

Family marker `◆` stays, for cohesion. Shearpin's own favicon is the pin itself:
a vertical bar, broken across the middle, the two halves offset — a pin that has
sheared. Drawn in `--ash` on transparent. `assets/favicon.svg`.

## Ground plate

No hero figure — Scott's call: drop the illustration entirely, keep only the
atmosphere. `assets/ground.webp` (converted from a 1.9MB PNG, ~120KB) sits as a
fixed full-bleed background via `body::before`, with a `body::after` scrim
(radial + linear gradient, bottom-weighted) holding the column's contrast over
it. No `object-position`/mask-stop tuning the old vector-hero warning below
was written against — there's no foreground image to position, just a texture
behind the text.

## Durable warning — superseded

The prior warning argued a raster *hero figure* would reintroduce Crucible's
`object-position`/mask-stop/intro-reserve fragility. Moot now: there is no
hero figure, raster or vector, to position. The ground plate is a plain
`cover`-fit background with no per-image magic numbers to maintain.

It has a **different** fragility: the drawing is fine-lined and reads only with
width. At the page's full ~900px it lands; below roughly 560px effective width it
degrades to a pale smear. If the layout ever narrows that far, the hero needs a
heavier-stroke variant or a simplified figure — do not just let it shrink. Strokes
are already at the floor for the current placement (pin outline 1.9, datum lines
1.0–1.3); thinner will not survive downscaling.
