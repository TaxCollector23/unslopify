# Unslopify

Rules for building software that feels designed, not generated. Read this before you write a line. Apply it quietly — do not announce it, do not narrate it, just follow it.

---

## What this is stopping

AI-generated UI has a recognizable aesthetic because the model keeps reaching for the same defaults: floating cards, blue-purple gradients, invented stats, pill overload, decorative copy, and hero sections inside dashboards. The result looks plausible but not designed. Unslopify is a list of those defaults. Your job is to recognize them and not use them.

---

## The one question

Before adding anything — a section, a stat, a component, a dependency — ask:

> If I remove this, what meaningful thing gets worse?

If the answer is nothing, remove it.

---

## Design: the hard no list

Stop before you do any of these.

**Color and backgrounds**
- Blue-to-purple gradients, in any direction or combination
- Pastel candy gradient backgrounds (butter → peach → pink, mint → lavender)
- Drifting soft-blend blobs with `mix-blend-mode: multiply` as a background
- Radial glow halos centered behind hero objects
- The default cool blue-charcoal dark palette (`#0c0e15`-family) unless the brand calls for it
- The default warm cream / beige "editorial" background unless the brand calls for it
- The gray-100 / gray-200 UI-kit neutral as a footer, card fill, or section divider
- Gradient inside text (`background-clip: text`) unless it represents something real
- Multiple competing gradients on one screen

**Shadows and depth**
- The all-around symmetric drop shadow bloomed on every card by default
- Shadows that trace the element's own shape (a blurred copy of the outline)
- A hard-edged box sitting behind an element pretending to be a shadow
- Glow effects as a substitute for real hierarchy
- Colored glows unless they represent light from a real source

**Cards and components**
- Border radius over 12–16px on cards unless the product style specifically uses it
- Pill-shaped buttons with gradient fills and a soft glow beneath
- Icons centered in soft-colored rounded tiles
- Small cards that gently bob or float with looping animations
- A card grid that exists because the surface felt empty
- The kitchen-sink card: icon tile + category pill + tag pills + hairline divider + price + glowy button all in one
- Eyebrow or kicker labels (small uppercase letter-spaced text above a heading) used as decoration

**Typography**
- These fonts when they carry the brand identity: Inter, Space Grotesk, Sora, Syne, Archivo, Fraunces, Cormorant Garamond, JetBrains Mono as the house voice, any Google font as the signature typeface
- Monospace used for everything that "feels technical" — captions, labels, footers, copyright lines
- One small treatment (tracked-out caps, mono) applied to every label, button, eyebrow, and colophon simultaneously
- Gradient-filled headline words
- Multi-line display headlines wrapping to three or more lines with no composition

**Layout patterns**
- The default hero stack: eyebrow → headline → subtext → filled button + ghost button → product panel on the right
- The SaaS meta-skeleton: two-column hero → three feature cards with icon tiles → tabbed switch → pricing cards → FAQ → CTA slab → multi-column footer
- Three stats immediately below the hero
- Seven nearly identical feature cards in a grid because the space looks empty
- The "how it works" numbered list on a vertical rail with a hairline rule
- Hero sections inside dashboards or internal product UI
- Overpadded layouts where the content is dwarfed by its own margins
- Content flung to opposite edges with a dead gulf between (default space-between footers)
- A different background under every section producing hard color seams

**Animation and interaction**
- Buttons that lift or scale on hover (the "boop")
- Underlines that grow or wipe in on hover
- Content that starts at `opacity: 0` and relies on a scroll or JS trigger to become visible — if the reveal doesn't fire, the content disappears. Content must be visible by default.
- Floating cards with looping CSS animations for no purpose

**Fake product props**
- Faux macOS window mockups with traffic-light dots and mock UI inside
- Fake code snippet windows with made-up SDK calls
- CSS bar charts and abstract floating circles standing in for real product UI

**Decoration**
- A short hairline drawn next to an eyebrow or kicker label
- Icons or logos placed on a filled tile, chip, or rounded square — strip the container, place the mark bare
- Faint grid lines behind a hero or section as a "technical" backdrop
- Grain laid on top of text and interactive controls (grain textures a surface, not the content)
- The sun-and-moon theme toggle pill

---

## Design: what good looks like

These are not more rules — they are reference points.

- Linear, Stripe, GitHub, Raycast. They don't grab attention. They just work.
- Real product UI beats decorative props every time.
- Whitespace is not a bug. A page does not need to be filled.
- One strong treatment with the rest supporting it beats six separate attempts at visual interest.
- Consistency is not boring. Inconsistent radii, weights, and spacing is assembly noise, not personality.
- Colors should stay calm and not fight.
- Light from one direction. Shadows are cast, not bloomed symmetrically.
- Scrolling should reveal new information. If the user scrolls and sees the same idea on a different background, the page is padding itself.

**On color**: Use the project's existing palette first. If none exists, pick one specific tone and build from it — not the default AI palette. The goal is a color that belongs to this product.

---

## Content: never invent

**Fake stats and metrics**
- Never write a number that was not supplied, measured, or verified: "10,482 developers," "99.8% accuracy," "3.2x faster," "Trusted by 14,000 teams"
- Never add a three-stat row below the hero because premium pages have one
- If the product has real metrics, show them where they're useful with context
- Numbers imply evidence. If they are not evidence, they should not look like evidence.

**Manufactured social proof**
- Never invent customer logos, testimonials, quotes, names, job titles, star counts, review scores, awards, or "trusted by" claims
- Do not write a testimonial and give it a fictional person
- Do not use a logo wall to make an empty product look established

**Passive-aggressive copy**
- Don't write: "Still using spreadsheets?" / "Stop wasting your time" / "Your competitors already automated this"
- Write with confidence without insulting the reader
- Describe what the product does; don't attack the alternative

**Vague marketing language**
- "Seamless, powerful, elegant, effortless, transformative" — replace with the observable fact
- Instead of "a seamless developer experience" — say what makes it seamless
- Avoid "Designed to help teams..." / "Built to empower developers..." — say what actually happens

**Competitor mentions**
- Don't name a competitor just to look legitimate
- Don't write "The better alternative to X" without a real, accurate comparison
- Never invent weaknesses about another product

---

## Code: what not to build

**Unnecessary machinery**
- Don't wrap a library call just to rename it
- Don't build for hypothetical future requirements — three similar lines are sometimes better than a premature abstraction
- Don't create `utils.ts`, `helpers.ts`, `BaseService`, `GenericManager` as catch-all buckets with no real domain boundary
- Don't install a dependency for a task that three clear lines would solve

**Before adding a dependency**, check:
1. Does the project already have an equivalent?
2. Does the runtime or platform provide it?
3. Can a few clear lines solve it?
4. Does this create a second pattern alongside an existing one?

**State and effects**
- Don't create state for values that can be derived
- Don't introduce global state because local state is inconvenient
- In React, don't use an effect for ordinary derivation — derived values belong in render logic

**Comments**
- Don't narrate obvious code
- Comments explain *why*: a constraint, unusual behavior, a compatibility decision, a non-obvious algorithm

**Dead code**
- Don't create `ButtonV2`, `useThingNew`, `api2`, `helperFinal2` — fix or replace the original
- Don't refactor unrelated code during a focused task

**Honesty**
- Don't claim a test passed if you didn't run it
- Don't claim a feature works if you didn't verify it
- Don't present a static mock as a live integration

---

## Before you ship

Check these explicitly:

- Every interactive control works with a real click
- No content is hidden behind an animation or starts invisible
- Nothing is clipped by `overflow: hidden` that shouldn't be
- Text has real contrast against its background
- Parallel columns (pricing, plan cards, comparisons) align on a shared horizontal grid — button at the same height in every column regardless of copy length
- The same thing is called the same thing throughout

---

## When to stop

Stop when the requested behavior works, verification has passed, the implementation fits the repository, and the result is coherent and scoped.

"Could this be better?" is not a reason to keep going.

Don't turn "fix the button" into "redesign the dashboard, migrate the component system, reorganize the API." Fix what's necessary. Mention anything important that's out of scope, then stop.

---

## Inspect before you invent

Inside an existing project, search before building.

Look for existing components, patterns, API clients, styles, and naming conventions. Do not create a second way to do something the project already knows how to do.

The repository is evidence. Your prior assumptions are not.
