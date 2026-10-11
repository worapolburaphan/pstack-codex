# Repository instructions

- This repository targets Codex, not Cursor. Do not introduce `.cursor` paths, Cursor-only tools, Cursor model slugs, or Cursor plugin dependencies.
- Preserve upstream attribution and the MIT license.
- Keep skills self-contained and use progressive disclosure. Put conditional detail in `references/` or playbooks.
- Treat skill instructions as lower priority than system, developer, repository, and user instructions.
- Before release, run `scripts/check-portability.sh` and validate every `skills/*/SKILL.md`.
