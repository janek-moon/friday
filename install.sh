#!/bin/sh
# Link the friday skill for Codex. Claude Code users don't need this -
# the plugin ships the skill by itself.
set -eu

# Codex discovers skills from ~/.codex/skills/<name>/SKILL.md - the same
# format Claude Code reads from this repo's skills/ directory. A symlink,
# so git pull keeps it current.
SKILL_DIR=$(cd "$(dirname "$0")/skills/friday" && pwd)
mkdir -p "$HOME/.codex/skills"
ln -sfn "$SKILL_DIR" "$HOME/.codex/skills/friday"
echo "==> Linked skill into ~/.codex/skills/friday"
