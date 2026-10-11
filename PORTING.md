# Porting notes

`pstack-codex` follows the Agent Skills layout used by Codex. It is not a byte-for-byte mirror of the Cursor plugin.

## Runtime mappings

| Upstream Cursor concept | Codex port |
| --- | --- |
| `Task` with a named `subagent_type` | Codex subagent delegation when the host exposes it; otherwise run the lane in the current agent |
| Per-role Cursor model slugs | Inherit the active Codex model by default; use only model and effort values exposed by the current host |
| `AskQuestion` | Codex structured user input when available, otherwise one concise question |
| `/loop` | Codex heartbeat, automation, or bounded wait mechanism when available |
| Cursor transcripts under `~/.cursor/projects` | Current thread context and Codex thread tools; never scan unrelated conversations |
| `~/.cursor/rules/pstack-models.mdc` | Optional `~/.codex/pstack/config.md` preferences |
| `cursor-team-kit` control skills | The current Codex host's browser, computer-use, terminal, review, and verification tools |
| Cursor custom agents | Self-contained skills plus an explicit instruction for delegated agents to load the relevant skill |

## Safety and authority

The original workflow's bias toward autonomy never overrides Codex system policy, sandbox limits, approval requirements, repository instructions, or the user's scope. External writes, destructive actions, merges, deployments, and messages still use the host's normal authorization rules.

## Updating from upstream

Review upstream changes rather than copying them blindly. Preserve useful engineering invariants, then translate new Cursor APIs through the table above. Run `scripts/check-portability.sh` and validate every skill before release.

## Deliberate v0.1 omissions

- Benny automations are not included because their scheduling and runtime contract is Cursor-specific. Codex heartbeats and automations should be added as a separate, host-aware integration.
- `make-bot-ui` is not included because it depends on Cursor webhook infrastructure.
- The Bun-based PR watcher and orchestration CLI are replaced by native forge checks, Codex waits, and plain-text state files. Installing the plugin never installs runtime packages.
