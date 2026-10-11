# Set up pstack for Codex

## Install

```sh
codex plugin marketplace add worapolburaphan/pstack-codex
codex plugin add pstack-codex@pstack-codex
```

Start a new Codex chat after installation.

## Review the runtime

Invoke `$setup-pstack`. pstack inherits the active Codex model, reasoning effort, permissions, and repository instructions by default. Setup reports which optional capabilities are present:

- Subagent delegation.
- Model and reasoning-effort overrides.
- Heartbeat, automation, and thread-wait tools.
- Browser, computer-use, terminal, and review tools.

Persistent preferences are optional. If requested, setup stores them in `~/.codex/pstack/config.md`. The file never overrides higher-priority instructions or authorization rules.

## Verification

If the project has no real-surface verification workflow, invoke `$create-verification-skill`. Keep it project-local under `.agents/skills/verify-<app>/`.

Tests and builds are gates. The verification skill should exercise the behavior a user depends on.

## First task

```text
$poteto-mode add a --json flag to this command.
Keep text output byte-identical.
Done means both output modes pass their real command-level checks.
```

Next: [Route work through poteto mode](./02-poteto-mode.md).
