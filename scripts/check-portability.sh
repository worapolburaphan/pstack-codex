#!/usr/bin/env bash
set -euo pipefail

root_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

forbidden=(
  '\.cursor/'
  '~/.cursor'
  'cursor-team-kit'
  'subagent_type'
  'AskQuestion'
  'grok-[0-9]'
  'claude-(opus|sonnet|fable)-[0-9]'
  'Cursor cloud agent'
  "Cursor's /loop"
  'Task tool'
  'Task calls?'
)

status=0
scan_paths=(
  "$root_dir/skills"
  "$root_dir/docs"
  "$root_dir/plugin.json"
  "$root_dir/.codex-plugin/plugin.json"
)
for pattern in "${forbidden[@]}"; do
  if rg -n --glob '*.md' --glob '*.json' --glob '*.toml' "$pattern" "${scan_paths[@]}"; then
    printf 'forbidden portability pattern: %s\n' "$pattern" >&2
    status=1
  fi
done

if (( status != 0 )); then
  exit "$status"
fi

printf 'portability check passed\n'
