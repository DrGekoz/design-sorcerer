# Design Sorcerer

A research-first master skill for building distinctive, accessible, responsive, animated websites and webapps with free-first tooling.

## What it does

Design Sorcerer gives an AI coding agent a unified workflow for:

- Visual direction and design research
- Layout, typography, color systems, and responsive behavior
- Accessible reusable React components
- Motion design with Motion, GSAP, and Lenis
- Progressive WebGL effects with Vanta, ShaderGradient, and Thinking Orbs
- Source-based component installation through shadcn registries
- Google Stitch and Refero research workflows
- Impeccable design audits
- React/Next performance optimization
- Codex CLI image and asset generation
- Transparent GPT Image 2 PNG generation through CLIProxyAPI
- Deterministic asset validation, credits, and browser verification

## Install as a Hermes skill

Copy `SKILL.md` into the active Hermes skill directory:

```bash
mkdir -p "$LOCALAPPDATA/hermes/skills/web-design/design-sorcerer"
cp SKILL.md "$LOCALAPPDATA/hermes/skills/web-design/design-sorcerer/SKILL.md"
```

The skill is designed to be loaded when building or redesigning a website or webapp.

## Free-first baseline

The skill prefers local and free tools. It uses public shadcn registries, local Refero catalog search, Impeccable, CSS/SVG, and existing project dependencies before authenticated or paid services.

Typical optional setup:

```bash
npm install motion lenis gsap
npm install @shadergradient/react @react-three/fiber three three-stdlib camera-controls
npx shadcn@latest init
npx impeccable install --scope=project
npx impeccable init
```

Do not install every package by default. Select tools according to the design brief.

## MCPs

The skill contains exact configuration for:

- shadcn MCP for public component registries
- Local no-token Refero MCP
- Google Stitch MCP when the user has authorized Stitch access

It includes Codex, Claude Code, Cursor, and VS Code configuration examples, verification commands, secret handling, and rules for skipping paid/token services by default.

## Codex image generation

The skill supports two distinct paths:

1. Codex CLI for reference-guided opaque or general image generation.
2. CLIProxyAPI plus GPT Image 2 for transparent PNGs.

The transparent route uses:

```text
POST http://localhost:8317/v1/images/generations
model: gpt-image-2
background: transparent
output_format: png
response_format: b64_json
```

Every output must be decoded and validated for PNG format, RGBA mode, alpha extrema `(0,255)`, dimensions, bounds, halos, and unwanted backgrounds.

Codex image calls use isolated `CODEX_HOME` directories, separate `-i` reference arguments, `/imagegen` through stdin, deterministic `Saved at:` output handling, and no newest-file fallback.

## Integrated sources

The skill incorporates research and usage guidance from:

- Lenis
- Motion
- Kokonut UI
- Componentry
- GSAP
- Vanta
- React Bits
- Thinking Orbs
- Magic UI
- SmoothUI
- Neobrutalism
- RetroUI
- Refero Styles
- Google Stitch
- Cult UI
- ShaderGradient
- Laws of UX
- Impeccable
- Components.build
- SmoothUI component craft
- SmoothUI motion-performance rules
- Vercel React/Next performance guidance
- GPT Image 2 transparent Codex CLI workflow

## Credits and licensing

See the credits section in `SKILL.md` for source links. Check the license of every dependency and record the exact packages, versions, components, prompts, and external references used by each project.

## Workflow summary

1. Inspect the project and available tools.
2. Research the product surface and visual direction.
3. Define `PRODUCT.md` and `DESIGN.md` for substantial work.
4. Establish semantic structure, tokens, layout, typography, and responsive behavior.
5. Build accessible source-owned components.
6. Add purposeful motion with reduced-motion support.
7. Generate and validate assets only when needed.
8. Run typecheck, tests, production build, and real browser checks.
9. Record MCPs, packages, credits, decisions, and verified/unverified results.
