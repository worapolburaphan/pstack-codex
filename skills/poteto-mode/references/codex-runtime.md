# Codex runtime contract

Use this contract whenever an upstream playbook mentions a source-runtime-specific tool or behavior.

## Delegation

- Use Codex subagent tools only when they are present and active policy permits delegation.
- Spawn independent lanes together when the host supports concurrent calls.
- Give each agent one bounded role, the relevant skill path, the shared acceptance criteria, and the expected output shape.
- Inherit the active model and reasoning effort by default. Use an override only when the host explicitly exposes that value or the user requested it.
- A read-only lane must not edit files. Concurrent writers use separate worktrees or otherwise disjoint state.
- If delegation is unavailable, run the lanes sequentially in the current agent and label the loss of independence.
- The parent owns the outcome. Inspect evidence and diffs instead of forwarding a child report verbatim.

## User input

Use structured user input when the host provides it. Otherwise ask one concise question. Do not ask the user to decide a fact that a reversible experiment can settle.

## Long-running work

Use a Codex heartbeat, automation, thread wait, or bounded polling tool when available. Follow that tool's notification and authorization rules. Never emulate a scheduler with an unbounded shell sleep loop.

## Threads and transcripts

Use the current conversation and explicit Codex thread tools. Read another thread only when the user authorizes or requests it and the host exposes a thread reader. Never scan unrelated local conversation stores.

## Verification

Choose the tool that matches the real surface:

- Browser or web UI: Codex browser or computer-use tools.
- Native application: available application-control or computer-use tools.
- CLI or TUI: a terminal session with observable input and output.
- GitHub or another forge: its connected app or authenticated CLI.

Tests and compilation are gates, not substitutes for exercising the load-bearing behavior.

## Authority

System, developer, repository, sandbox, approval, and user instructions always outrank this plugin. Persistence and autonomy do not authorize new side effects. Use the host's normal confirmation rules for external writes, messages, merges, deploys, and destructive actions.
