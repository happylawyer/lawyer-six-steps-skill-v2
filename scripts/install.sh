#!/usr/bin/env bash
set -euo pipefail

SKILL_NAME="lawyer-six-steps"
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

usage() {
  cat <<'EOF'
Usage:
  bash scripts/install.sh [all|agents|claude|codex|openclaw]

Examples:
  bash scripts/install.sh all
  bash scripts/install.sh codex
EOF
}

link_skill() {
  local target="$1"
  mkdir -p "$(dirname "$target")"
  ln -sfn "$ROOT_DIR" "$target"
  printf 'Linked %s -> %s\n' "$target" "$ROOT_DIR"
}

install_target() {
  local target="$1"

  case "$target" in
    agents)
      link_skill "$HOME/.agents/skills/$SKILL_NAME"
      ;;
    claude)
      link_skill "$HOME/.claude/skills/$SKILL_NAME"
      ;;
    codex)
      link_skill "$HOME/.codex/skills/$SKILL_NAME"
      ;;
    openclaw)
      link_skill "$HOME/.openclaw/skills/$SKILL_NAME"
      ;;
    all)
      install_target agents
      install_target claude
      install_target codex
      install_target openclaw
      ;;
    -h|--help|help)
      usage
      exit 0
      ;;
    *)
      usage
      exit 1
      ;;
  esac
}

install_target "${1:-all}"

printf '\nInstallation complete. Restart the client if it is already running.\n'
