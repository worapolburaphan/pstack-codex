---
name: poteto-help
description: Explain how to use pstack-codex, choose a skill or playbook, diagnose capability gaps, and form an effective prompt.
---

# pstack for Codex help

pstack-codex is a Codex-native port of pstack. Start with `$poteto-mode` for non-trivial engineering work. Use a narrower skill directly when the request already names the shape.

## Common entry points

| Need | Skill |
| --- | --- |
| Rigorous end-to-end engineering task | `$poteto-mode` |
| Understand how code works | `$how` |
| Recover design rationale | `$why` |
| Compare multiple designs or implementations | `$arena` |
| Parallel coverage or verification | `$swarm` |
| Settle types, signatures, and module boundaries | `$architect` |
| Adversarial review | `$interrogate` |
| Behavior-first implementation | `$tdd` |
| Clean technical prose | `$technical-writing` and `$unslop` |
| Resume prior work | `$recall` or the Session pickup playbook |
| Configure runtime preferences | `$setup-pstack` |

## Host capability gaps

Read [the Codex runtime contract](../poteto-mode/references/codex-runtime.md).

- Without subagent tools, pstack runs lanes sequentially in the current agent. Independence is reduced, so say so.
- Without heartbeat or automation tools, long-running work stops at a durable checkpoint instead of inventing a background loop.
- Without browser or computer-use tools, live UI verification is a named gap. Tests do not become a substitute.
- Without a connected evidence source, `$why` records the missing category instead of fabricating rationale.

## Prompt shape

A strong request names:

1. The outcome.
2. The evidence or behavior that proves completion.
3. Any branch, PR, file, or environment boundary.
4. Actions that require a pause.

Example:

```text
$poteto-mode fix the intermittent scroll drift on this branch.
Reproduce it before changing code.
Done means the focused test passes and the real UI remains still for five minutes.
Do not merge.
```

For long-running work, give a finish predicate, not a duration. Codex uses its available heartbeat, automation, or wait mechanism only when the host supports it and the request authorizes continued monitoring.

## Principles

Use principle skills directly when one decision needs a focused rule. `$poteto-mode` reads a leaf principle only when it applies and reports the principle only when it changed a decision.
