# Codex Meta Skills

面向 Codex 的本地技能仓库，聚焦研究型项目、长任务规划、系统化调试与可控自动化。

## 当前内容

- `meta-project-workflow`

## 这个 skill 做什么

`meta-project-workflow` 整合了三个外部 workflow 中最有价值的部分：

- `superpowers`
- `planning-with-files`
- `ralph-loop`

它的目标不是照搬原项目，而是把这些思路调整成更适合当前 Windows + Codex 环境的本地 skill。

## 核心能力

- 复杂任务先规划，再执行
- 用文件保存长期任务上下文
- 排错时坚持小步验证和系统化调试
- 只对可验证子任务做有限重试，不做无限自循环
- 明确记录停止条件、最大轮数和验证方式
- 在重大决策前回读计划，减少任务漂移
- 在动大改动前先列出涉及文件或工作面

## 仓库结构

```text
.
|- .codex/skills/meta-project-workflow/
|- .planning/
`- docs/
```

主要文件：

- `.codex/skills/meta-project-workflow/SKILL.md`
- `.codex/skills/meta-project-workflow/references/zh-cn-guide.md`
- `.codex/skills/meta-project-workflow/references/review-checklist.md`
- `.codex/skills/meta-project-workflow/templates/task_plan.md`
- `.codex/skills/meta-project-workflow/templates/findings.md`
- `.codex/skills/meta-project-workflow/templates/progress.md`
- `.codex/skills/meta-project-workflow/scripts/init-planning-files.ps1`
- `docs/meta_project_workflow_skill_bilingual_2026-04-20.md`

## 计划文件布局

复杂任务建议统一放在：

```text
.planning/active/<task-slug>/
```

每个任务目录包含：

- `task_plan.md`
- `findings.md`
- `progress.md`
- `task_plan.md` 里建议同时写当前阶段、验证命令和有限重试计划
- `findings.md` 里建议记录 working examples、recent changes 和可疑差异

## 初始化命令

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\.codex\skills\meta-project-workflow\scripts\init-planning-files.ps1 -TaskSlug your-task
```

## 适用场景

- 多步骤编码任务
- 研究和资料整理任务
- 长会话、长周期推进任务
- 需要系统化排错的任务

## 不适合的场景

- 简单问答
- 单文件小改动
- 需要人工判断但没有明确停止条件的无限尝试
