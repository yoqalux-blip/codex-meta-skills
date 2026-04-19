# Meta Project Workflow Skill

## Overview

This repository now includes a local Codex skill that integrates the most useful ideas from three external workflows:

- `superpowers`
- `planning-with-files`
- `ralph-loop`

The integrated skill lives at:

```text
.codex/skills/meta-project-workflow/
```

Its goal is to fit a practical Windows + Codex workflow without depending on Claude-only hooks or open-ended autonomous loops.

## What Was Kept From Each Source

### `superpowers`

Kept:

- start with a plan before major edits
- use systematic debugging instead of random retries
- define verification before calling a task done

Not carried over directly:

- heavyweight process requirements for every small task
- assumptions that every task should become a full multi-agent workflow

### `planning-with-files`

Kept:

- persistent task memory on disk
- separation between plan, findings, and progress
- better resumption across long or interrupted sessions

Not carried over directly:

- root-level clutter
- hook-dependent automation

### `ralph-loop`

Kept:

- bounded retry for machine-verifiable subtasks
- explicit stop conditions
- iteration caps to prevent thrashing

Not carried over directly:

- self-looping agent behavior
- use on subjective or manually gated tasks

## Repository-Specific Layout

Planning files should live under:

```text
.planning/active/<task-slug>/
```

Each task folder should contain:

- `task_plan.md`
- `findings.md`
- `progress.md`

This keeps planning state local and organized without polluting the repository root.

## Quick Start In This Repository

From the repository root:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\.codex\skills\meta-project-workflow\scripts\init-planning-files.ps1 -TaskSlug your-task
```

Then:

1. write the task goal and success checks in `task_plan.md`
2. set the current phase and verification command in `task_plan.md`
3. record key evidence and research findings in `findings.md`
4. keep a short running session log in `progress.md`

## Chinese Guide

当前仓库已经内置一个面向 Codex 的本地 skill，用来整合三个外部技能中最实用的部分。

核心思路是：

- `superpowers` 负责“先规划、再执行、系统化排错”
- `planning-with-files` 负责“把长任务过程写进文件，避免上下文丢失”
- `ralph-loop` 负责“只对可验证的小任务做有限重试”

在当前仓库中，推荐把复杂任务都放到：

```text
.planning/active/<task-slug>/
```

并统一维护：

- `task_plan.md`
- `findings.md`
- `progress.md`

这样做的好处是：

- 长任务可以跨会话继续
- 研究和代码工作可以放在同一套流程里
- 排错时不容易重复试错
- 不需要依赖 Claude 专属 hooks

## Related Files

- Skill definition: `.codex/skills/meta-project-workflow/SKILL.md`
- Chinese guide: `.codex/skills/meta-project-workflow/references/zh-cn-guide.md`
- Planning workspace note: `.planning/README.md`
