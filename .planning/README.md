# Planning Workspace

This folder holds local task-planning workspaces for the integrated Codex skill in this repository.

## Layout

- `active/`: current multi-step tasks
- `archive/`: completed or paused task folders you still want to keep locally

## Recommended Task Files

Each task folder under `active/` should contain:

- `task_plan.md`
- `findings.md`
- `progress.md`

## Quick Start

Use the helper script from the repository root:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\.codex\skills\meta-project-workflow\scripts\init-planning-files.ps1 -TaskSlug your-task
```

This folder is meant for local working memory. Active task contents are ignored by git unless you intentionally move them elsewhere.
