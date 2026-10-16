#!/bin/bash
# Installs Crawl4AI and the crawl4ai agent skill in Claude Code cloud sessions.
set -euo pipefail

if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

export CRAWL4AI_NO_CLOUD_NOTICE=1

SKILL_DIR="$HOME/.claude/skills/crawl4ai"
if [ ! -d "$SKILL_DIR/.git" ]; then
  mkdir -p "$HOME/.claude/skills"
  git clone https://github.com/brettdavies/crawl4ai-skill.git "$SKILL_DIR"
fi

pip install --quiet crawl4ai
crawl4ai-setup
