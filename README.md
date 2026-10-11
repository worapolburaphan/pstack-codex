# pstack for Codex

`pstack-codex` adapts Lauren Tan's [pstack plugin](https://github.com/cursor/plugins/tree/main/pstack) for Codex.

It keeps pstack's investigation and verification rules. It replaces Cursor-only APIs, paths, model names, custom agents, and loop behavior with Codex tools.

## Upstream source

This repository starts from a pstack-only extraction of the `cursor/plugins` history. The extraction keeps commits that changed `pstack` and leaves out other plugins.

- [Original pstack plugin](https://github.com/cursor/plugins/tree/main/pstack)
- [Original pstack skills](https://github.com/cursor/plugins/tree/main/pstack/skills)
- [Source commit used for this port](https://github.com/cursor/plugins/tree/11713c683fe4add4fd403ea880580abbc9e0875f/pstack)

GitHub does not label this repository as a fork because `pstack` came from a subdirectory of a larger repository. The Git history before the Codex port contains only changes to that subdirectory.

## Install

Add this repository as a Codex marketplace, then install the plugin:

```sh
codex plugin marketplace add worapolburaphan/pstack-codex
codex plugin add pstack-codex@pstack-codex
```

Restart Codex or begin a new chat after installation so the skills are discovered.

To update later:

```sh
codex plugin marketplace upgrade pstack-codex
```

## Start here

Use `$setup-pstack` once to review the Codex runtime mapping and optional preferences. Then invoke `$poteto-mode` for an engineering task that needs investigation, implementation, and verification.

Examples:

```text
$poteto-mode investigate this intermittent scroll drift, reproduce it, fix the root cause, and verify it.

$how explain how cancellation flows through this subsystem and cite the relevant files.

$interrogate review this diff from correctness, concurrency, and maintainability angles.
```

`poteto-mode` selects a playbook for the task. The plugin includes playbooks for bug fixes, performance work, refactoring, prototypes, visual matching, review, shipping, autonomous runs, and multi-phase work. You can also invoke individual skills such as `$tdd`, `$unslop`, and `$technical-writing`.

## What changed from upstream

- Delegation uses Codex subagents when the current host and policy allow them. A skill falls back to the current agent when delegation is unavailable.
- Model routing inherits the active Codex model by default. The port never assumes Cursor, Claude, or Grok model slugs.
- Long-running work uses Codex heartbeat, automation, or wait mechanisms when available.
- UI and CLI verification use the tools available in the current Codex host.
- Transcript-aware skills use the current thread or explicit thread tools. They never scan unrelated local conversations.
- External writes and destructive actions follow Codex authorization and sandbox rules.

See [PORTING.md](PORTING.md) for the complete mapping.

## Status

This project is an independent compatibility port. Cursor and the upstream pstack author do not maintain it. The initial port is based on pstack `0.15.17`; see [ATTRIBUTION.md](ATTRIBUTION.md).

## License

MIT. The upstream copyright notice is preserved in [LICENSE](LICENSE).
