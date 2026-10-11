---
name: setup-pstack
description: Configure optional pstack preferences for Codex, including delegation, reasoning effort, and long-running work. Use after installing pstack-codex or when changing its runtime behavior.
---

# Set up pstack for Codex

pstack works without configuration. The default is to inherit the active Codex model, reasoning effort, permissions, and repository instructions.

## Inspect the host

Identify only capabilities visible in the current Codex host:

- Whether subagent delegation is available and permitted.
- Whether the host exposes model or reasoning-effort choices.
- Whether heartbeat, automation, or thread-wait tools are available.
- Which browser, computer-use, review, and terminal tools are available for live verification.

Do not invent model identifiers or promise a capability the host does not expose.

## Optional preferences

If the user wants persistent local preferences, write `~/.codex/pstack/config.md` after obtaining normal filesystem authorization. Keep it human-readable:

```markdown
# pstack Codex preferences
delegation: when-useful
reasoning-effort: inherit
long-running: host-default
verification: real-surface-when-available
```

Accepted guidance:

- `delegation`: `when-useful`, `off`, or an explicit user policy.
- `reasoning-effort`: `inherit` or a value the current host explicitly supports.
- `long-running`: `host-default`, `heartbeat`, or `manual`, but only when the host supports it.
- `verification`: keep `real-surface-when-available` unless the user deliberately chooses a narrower policy.

Configuration never overrides system, developer, repository, sandbox, approval, or user instructions.

## Finish

Summarize the capabilities detected, any preferences written, and the features that will fall back to the current agent because the host does not expose them.
