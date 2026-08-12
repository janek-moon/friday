#!/bin/sh
# Install f.r.i.d.a.y for Codex: link the skill from a checkout, or fetch
# SKILL.md from GitHub when piped through curl. Claude Code users don't need
# this - the plugin ships the skill by itself.
#
# Usage:
#   ./install.sh                                  # from a checkout
#   curl -fsSL https://raw.githubusercontent.com/janek-moon/f.r.i.d.a.y/main/install.sh | sh

set -eu

RAW_URL="https://raw.githubusercontent.com/janek-moon/f.r.i.d.a.y/main"
DEST="$HOME/.codex/skills/friday"

# Codex discovers skills from ~/.codex/skills/<name>/SKILL.md - the same
# format Claude Code reads from this repo's skills/ directory. From a
# checkout, link so git pull keeps it current; otherwise fetch the file.
SKILL_DIR=$(dirname "$0")/skills/friday
mkdir -p "$HOME/.codex/skills"
if [ -f "$SKILL_DIR/SKILL.md" ]; then
    ln -sfn "$(cd "$SKILL_DIR" && pwd)" "$DEST"
    echo "==> Linked skill into ~/.codex/skills/friday"
else
    [ -L "$DEST" ] && rm "$DEST"
    mkdir -p "$DEST"
    curl -fsSL "$RAW_URL/skills/friday/SKILL.md" -o "$DEST/SKILL.md"
    echo "==> Fetched SKILL.md into ~/.codex/skills/friday"
fi

echo
echo "Done. In Claude Code: /f.r.i.d.a.y:friday. In Codex: the friday skill."
