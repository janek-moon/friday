#!/bin/sh
# Link the friday skills for Codex. Claude Code users don't need this -
# the plugin ships the skills by itself.
set -eu

# Codex discovers skills from ~/.codex/skills/<name>/SKILL.md - the same
# format Claude Code reads from this repo's skills/ directory. Symlinks,
# so git pull keeps them current.
mkdir -p "$HOME/.codex/skills"
for skill in "$(dirname "$0")"/skills/*/; do
    name=$(basename "$skill")
    ln -sfn "$(cd "$skill" && pwd)" "$HOME/.codex/skills/$name"
    echo "==> Linked skill into ~/.codex/skills/$name"
done
