# Bundled and installable sub-skills

Design Sorcerer installs complementary skills into the target agent's own skill directory during its installation phase. This folder contains:

- `hermes-design/` — bundled Hermes design skill
- `hermes-design-system/` — bundled token/component-system skill
- `transparent-asset-generation/` — bundled GPT Image 2 + CLIProxyAPI workflow
- `impeccable/` — installer/source manifest for the official Impeccable skill
- `ui-ux-pro-max/` — installer/source manifest for UI UX Pro Max

The repository bundles only local skill files that are safe to redistribute. External skills remain pinned to their canonical source and are installed by the idempotent installer after checking the source and target paths.

## Sources

- Impeccable: https://github.com/pbakaus/impeccable
- UI UX Pro Max: https://github.com/nextlevelbuilder/ui-ux-pro-max-skill
- Hermes design skills are copied from the active Hermes installation when available.

Do not overwrite a user’s newer skill without a backup and explicit update decision.
