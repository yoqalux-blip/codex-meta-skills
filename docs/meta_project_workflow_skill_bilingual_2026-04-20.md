# Meta Project Workflow Skill

## Overview

This repository now includes a local Codex skill that integrates the most useful ideas from three external workflows:

- `superpowers`
- `planning-with-files`
- `ralph-loop`

The packaged skill is defined at:

```text
SKILL.md
```

Its goal is to fit a practical Windows + Codex workflow without depending on Claude-only hooks or open-ended autonomous loops.

## What Was Kept From Each Source

### `superpowers`

Kept:

- start with a plan before major edits
- map likely files or surfaces before implementation
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
- re-read the plan before major decisions to reduce drift
- write important observations to disk after small bursts of reading

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

## Quick Start In A Project

From a working project root:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File "$HOME\.codex\skills\meta-project-workflow\scripts\init-planning-files.ps1" -TaskSlug your-task
```

Then:

1. write the task goal and success checks in `task_plan.md`
2. map the files or work surfaces in scope
3. set the current phase and verification command in `task_plan.md`
4. record key evidence and research findings in `findings.md`
5. keep a short running session log in `progress.md`

## Chinese Guide

这个技能包提供了一个面向 Codex 的本地 skill，用来整合三个外部技能中最实用的部分。

核心思路是：

- `superpowers` 负责“先规划、再执行、系统化排错”
- `planning-with-files` 负责“把长任务过程写进文件，避免上下文丢失”
- `ralph-loop` 负责“只对可验证的小任务做有限重试”

在实际项目中，推荐把复杂任务都放到：

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
- 在重大决策前回读计划可以减少目标漂移

## Related Files

- Skill definition: `SKILL.md`
- Chinese guide: `references/zh-cn-guide.md`
- Source mapping: `references/upstream-origins.md`
