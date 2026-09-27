<div align="center">

# DESIGN SORCERER

### Stop shipping AI-slop. Start shipping interfaces people remember.

A research-first master skill that turns an AI coding agent into a visual designer, motion engineer, UX critic, asset director, and performance reviewer.

**18 design libraries · 3 MCP integrations · 6 engineering skill families · 8 operational UX laws · 11 quality gates · 2 deterministic AI asset paths · 4 surface modes**

<a href="https://github.com/DrGekoz/design-sorcerer/stargazers"><img src="https://img.shields.io/github/stars/DrGekoz/design-sorcerer?style=for-the-badge&color=f59e0b" alt="Stars"></a>
<a href="https://github.com/DrGekoz/design-sorcerer/blob/main/LICENSE"><img src="https://img.shields.io/badge/license-MIT-22c55e?style=for-the-badge" alt="License"></a>
<img src="https://img.shields.io/badge/free--first-no%20paid%20APIs-06b6d4?style=for-the-badge" alt="Free first">
<img src="https://img.shields.io/badge/MCP-ready-8b5cf6?style=for-the-badge" alt="MCP ready">
<img src="https://img.shields.io/badge/Codex-image%20generation-f43f5e?style=for-the-badge" alt="Codex image generation">

[Install](#install) · [How it works](#how-it-works) · [MCP setup](#mcp-setup) · [Codex assets](#codex-image-assets) · [Credits](#credits)

</div>

---

## The key selling point

Most AI agents can produce a page that technically works. Design Sorcerer is built to stop the familiar failure mode: generic fonts, purple gradients, lifeless cards, random animation, broken mobile layouts, and interfaces that look like they were assembled from unrelated demos.

**It forces the agent to research before it designs, choose a coherent visual thesis, build a real design system, use motion with intent, validate accessibility, generate assets deterministically, and prove the result in a browser.**

The result is not just more code. It is a website or webapp with a point of view.

## The numbers

| Included | Count | What it covers |
| --- | ---: | --- |
| Design systems, libraries, and references | **18** | Motion, components, WebGL, research, visual systems, and critique |
| MCP integrations | **3** | shadcn registry, local Refero, authenticated Google Stitch |
| Integrated engineering skill families | **6** | Components.build, SmoothUI craft, motion performance, Vercel React, friction discipline, transparent asset generation |
| Operational UX laws | **8** | Fitts, Hick, Jakob, chunking/cognitive load, Tesler, Doherty, Peak-End, Von Restorff |
| Quality-gate categories | **11** | Accessibility, responsive layouts, motion, performance, assets, browser, build, and evidence checks |
| Asset-generation paths | **2** | Codex CLI general assets and CLIProxyAPI GPT Image 2 transparent PNGs |
| Surface modes | **4** | Persuade, Operate, Read, Experience |

These counts describe the integrated guidance in this repository. A library is counted once even when both its repository and official site are credited.

## What you get

| Capability | What Design Sorcerer enforces |
| --- | --- |
| Visual direction | Research, surface modes, visual thesis, references, do/don't rules |
| Layout | Mobile-first grids, readable measure, responsive constraints, overflow handling |
| Color | Semantic tokens, hierarchy, contrast, dark/light behavior, color-blind checks |
| Components | Composable, source-owned, typed, documented, keyboard-accessible components |
| Motion | Motion/GSAP/Lenis decision rules, reduced motion, cleanup, performance budgets |
| Effects | Progressive Vanta, ShaderGradient, Thinking Orbs, Canvas, and WebGL fallbacks |
| MCP | shadcn, local Refero, and authenticated Stitch setup/usage instructions |
| Images | Codex CLI generation and deterministic transparent GPT Image 2 assets |
| Quality | Impeccable, Vercel React, Components.build, browser, and accessibility reviews |
| Evidence | Exact packages, versions, prompts, credits, and verified/unverified results |

## Install

### Hermes

```bash
mkdir -p "$LOCALAPPDATA/hermes/skills/web-design/design-sorcerer"
curl -fsSL https://raw.githubusercontent.com/DrGekoz/design-sorcerer/main/SKILL.md \
  -o "$LOCALAPPDATA/hermes/skills/web-design/design-sorcerer/SKILL.md"
```

Load `design-sorcerer` whenever building or redesigning a website or webapp.

### Optional project baseline

Install only what the brief actually needs:

```bash
npm install motion lenis gsap
npm install @shadergradient/react @react-three/fiber three three-stdlib camera-controls
npx shadcn@latest init
npx impeccable install --scope=project
npx impeccable init
```

Do not blindly install every library. The skill selects tools according to the surface, visual direction, performance budget, and existing stack.

## How it works

```text
RESEARCH -> DIRECTION -> TOKENS -> LAYOUT -> COMPONENTS -> MOTION -> ASSETS -> AUDIT -> BROWSER PROOF
```

1. Inspect the existing framework, routes, assets, fonts, tokens, dependencies, and animation system.
2. Identify the surface mode: Persuade, Operate, Read, or Experience.
3. Research real interface patterns with Refero or Stitch when available.
4. Define `PRODUCT.md` and `DESIGN.md` for substantial work.
5. Build semantic structure, tokens, typography, spacing, and responsive layout first.
6. Add source-owned accessible components.
7. Select the smallest appropriate motion/effects stack.
8. Generate only missing assets, validate them, and preserve originals.
9. Run accessibility, performance, framework, and design audits.
10. Verify the real running page at mobile and desktop widths.

## MCP setup

The skill includes exact setup and usage instructions for:

- **shadcn MCP**: free local component-registry discovery for shadcn, Kokonut UI, Cult UI, and Neobrutalism.
- **Refero local MCP**: free no-token design-style research mirror.
- **Google Stitch MCP**: optional authenticated integration for Stitch project and Design DNA inspection.

The agent must inspect existing MCP configuration first, install only missing servers, never invent credentials, and verify each server with a harmless request before using it.

Example shadcn MCP config for Codex:

```toml
[mcp_servers.shadcn]
command = "npx"
args = ["shadcn@latest", "mcp"]
```

Example free Refero setup:

```bash
npx -y fidgetcoding-refero-mcp
```

Stitch is optional and authenticated. It is never enabled silently and never used to bypass accessibility, performance, or browser verification.

## Codex image assets

Design Sorcerer supports two deliberately separate image paths:

### General/reference-guided assets

- Codex CLI
- Isolated per-call `CODEX_HOME`
- Separate `-i <absolute-path>` reference arguments
- `/imagegen` sent through stdin
- Exact `Saved at:` output parsing
- No shared generated-image directory
- No newest-file fallback
- PIL/file validation before copying into the project

### Transparent assets

Transparent logos, icons, stickers, product cutouts, and UI glyphs use the verified local CLIProxyAPI route:

```text
POST http://localhost:8317/v1/images/generations
model: gpt-image-2
background: transparent
output_format: png
response_format: b64_json
```

Every result must be decoded and checked for:

- Real PNG format
- RGBA-compatible mode
- Alpha extrema `(0,255)`
- Correct dimensions and aspect ratio
- Valid non-transparent bounds
- No white/black background remnants
- No halo, clipping, duplicate object, watermark, or accidental text

A file is never treated as transparent because its filename says `.png` or because the API request included `background: transparent`.

## Design stack covered

### Motion and atmosphere

[Lenis](https://github.com/darkroomengineering/lenis) · [Motion](https://motion.dev) · [GSAP](https://github.com/greensock/GSAP) · [Vanta](https://github.com/tengbao/vanta) · [ShaderGradient](https://github.com/ruucm/shadergradient) · [Thinking Orbs](https://github.com/Jakubantalik/thinking-orbs)

### Components and systems

[Kokonut UI](https://kokonutui.com) · [Componentry](https://componentry.dev) · [React Bits](https://reactbits.dev) · [Magic UI](https://magicui.design) · [SmoothUI](https://smoothui.dev) · [Cult UI](https://www.cult-ui.com) · [Neobrutalism](https://neobrutalism.com) · [RetroUI](https://retroui.io)

### Research and quality

[Refero Styles](https://styles.refero.design) · [Google Stitch](https://stitch.withgoogle.com) · [Laws of UX](https://lawsofux.com) · [Impeccable](https://impeccable.style) · [Components.build](https://components.build)

## Quality gates

Before calling a surface complete, the agent must check:

- Semantic landmarks, keyboard flow, ARIA, focus restoration, and screen-reader states
- WCAG contrast and visible focus
- 320px/390px mobile, tablet, desktop, and wide desktop layouts
- Loading, empty, error, overflow, and slow-network states
- Reduced-motion mode and touch equivalents for hover behavior
- Animation cleanup, offscreen pausing, no layout thrashing, and no raw scroll polling
- React/Next waterfalls, bundle size, dynamic imports, serialization, and third-party loading
- Typecheck, lint, focused tests, production build, console errors, and network failures
- Exact asset dimensions, alpha, bounds, compression, and licensing

## Project handoff

For every project using this skill, record in `DESIGN.md`:

- Product and audience
- Surface mode and visual thesis
- Reference links and credits
- Palette roles, type scale, spacing, radius, shadows, and motion tokens
- Components, packages, versions, MCPs, and licenses
- Image prompts, references, model/routes, and validation results
- Accessibility and responsive decisions
- Browser/test commands and verified versus unverified checks

## Credits

See [`SKILL.md`](./SKILL.md) for the complete researched usage notes and full source-credit list. Design Sorcerer incorporates guidance from the projects listed above plus Vercel React/Next performance practices, SmoothUI component craft, Cult UI/Components.build architecture, and the GPT Image 2 transparent Codex CLI workflow.

## About

Design Sorcerer is a free-first, research-led design skill for agents that build real websites and webapps. It combines the visual vocabulary of **18 design libraries and references** with **3 MCP integrations, 6 engineering skill families, 8 operational UX laws, 4 surface modes, 2 deterministic AI asset paths, and 11 quality-gate categories**.

It makes the agent answer the questions generic UI generation skips:

- What is this interface trying to make the user do?
- What visual direction is justified by the product and audience?
- Which patterns are proven, and which are just decoration?
- What should move, what should stay still, and why?
- Does the layout work on a real phone?
- Can a keyboard and screen reader use it?
- Are the assets actually transparent and correctly validated?
- What was researched, installed, credited, tested, and proven?

Design Sorcerer does not promise magic by skipping engineering. It makes the agent do the design thinking, implementation discipline, and verification required to earn a polished result.

## License

MIT. Third-party projects, names, logos, code, and documentation remain under their respective licenses. Check and record the license of anything copied into a project.
