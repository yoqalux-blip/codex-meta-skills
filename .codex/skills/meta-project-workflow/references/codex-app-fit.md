# Codex App Fit

Observed local environment on 2026-05-23:

- Codex App package: `OpenAI.Codex_26.519.3891.0`
- `codex.exe` file version visible from PowerShell: `0.133.0.0`
- Direct `codex --version` execution from `WindowsApps` returned `Access is denied`
- `config.toml` model: `gpt-5.5`
- reasoning effort: `xhigh`
- feature flag: `goals = true`
- enabled plugins include GitHub, Gmail, Google Drive, Documents,
  Spreadsheets, Presentations, Browser, Canva, and Figma

## Execution Model

Use Codex as an active executor, not only a text generator:

- Keep the visible turn-level checklist short with `update_plan`.
- Treat `.planning/active/<task-slug>/` as the persistent control plane.
- Write important discoveries to disk before long execution bursts and before
  context compaction.
- Use commentary updates for user orientation, but store durable state in files.
- Use shell commands for reproducible local checks.
- Use plugin connectors when the source artifact lives outside the filesystem.

## Goals

The local config has `goals = true`, but goals are not a substitute for project
planning files.

Use goals only when explicitly requested by the user. If a goal is used:

- mirror the objective into `task_plan.md`
- record completion evidence in `progress.md`
- do not mark a goal complete unless the written success checks are actually met

## Automations

Use automations only when the user asks for a reminder, monitor, scheduled
follow-up, or later continuation.

For manuscript work, useful automation examples:

- remind to review a section tomorrow
- check back after a long analysis run
- continue the current thread later with a heartbeat

Always log created or changed automations in `progress.md`.

## Plugins And Specialist Skills

Use plugins as scoped tools:

- GitHub: repository, issue, PR, or remote skill work
- Google Drive/Documents: cloud manuscript or shared docs
- Spreadsheets: data tables, extraction sheets, evidence matrices
- Presentations: PPT or defense deck generation
- Browser: local UI or web verification when visual inspection matters

Use specialist local skills for academic subwork. This workflow skill should
coordinate the project state and hand off narrow tasks to the right specialist.

## Windows Notes

Do not assume shell hooks are available. Prefer PowerShell scripts in
`scripts/`. Keep commands explicit and record outputs in `progress.md`.
