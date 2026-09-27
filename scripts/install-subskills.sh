#!/usr/bin/env bash
set -euo pipefail

# Design Sorcerer idempotent sub-skill installer.
# Run from the repository root. It never overwrites existing target skills.

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TARGET="${DESIGN_SORCERER_SKILLS_DIR:-${LOCALAPPDATA:-$HOME/.hermes}/hermes/skills}"
mkdir -p "$TARGET"

install_bundled() {
  local name="$1"
  local src="$ROOT/sub-skills/$name"
  local dst="$TARGET/$name"
  if [[ -e "$dst" ]]; then
    printf '[SKIP] %s already exists: %s\n' "$name" "$dst"
    return
  fi
  mkdir -p "$dst"
  cp -R "$src"/. "$dst"/
  printf '[OK] installed bundled %s -> %s\n' "$name" "$dst"
}

install_external() {
  local name="$1" repo="$2"
  local dst="$TARGET/$name"
  if [[ -e "$dst" ]]; then
    printf '[SKIP] %s already exists: %s\n' "$name" "$dst"
    return
  fi
  if ! command -v npx >/dev/null 2>&1; then
    printf '[WARN] npx unavailable; skipped %s (%s)\n' "$name" "$repo"
    return
  fi
  # Canonical source install. The command is intentionally not run with tokens.
  if npx --yes skills add "$repo" --skill "$name" --scope project; then
    printf '[OK] installed external %s\n' "$name"
  else
    printf '[WARN] canonical installer failed; skipped %s\n' "$name"
  fi
}

install_bundled hermes-design
install_bundled hermes-design-system
install_bundled transparent-asset-generation
install_external impeccable https://github.com/pbakaus/impeccable
install_external ui-ux-pro-max https://github.com/nextlevelbuilder/ui-ux-pro-max-skill

printf '\n[CHECK] validating installed sub-skills\n'
for name in hermes-design hermes-design-system transparent-asset-generation impeccable ui-ux-pro-max; do
  if [[ -f "$TARGET/$name/SKILL.md" ]]; then
    printf '[OK] %s/SKILL.md\n' "$name"
  else
    printf '[WARN] missing %s/SKILL.md\n' "$name"
  fi
done
