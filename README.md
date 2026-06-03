# Codex Meta Skills

面向 Codex 的本地技能库，当前主技能是 `meta-project-workflow`。

这个 skill 用来管理长期、复杂、容易混乱的项目任务，尤其适合：

- 组织管理性较强的论文或综述写作
- MR / 生信 / 单细胞 / 中药或复苏合剂相关研究项目
- 多阶段资料整理、证据链维护、章节推进
- 系统化调试和可验证子任务的有限迭代

## 当前内容

```text
.codex/skills/meta-project-workflow/
```

主要文件：

- `.codex/skills/meta-project-workflow/SKILL.md`
- `.codex/skills/meta-project-workflow/references/codex-app-fit.md`
- `.codex/skills/meta-project-workflow/references/writing-project-guide.md`
- `.codex/skills/meta-project-workflow/references/zh-cn-guide.md`
- `.codex/skills/meta-project-workflow/references/review-checklist.md`
- `.codex/skills/meta-project-workflow/references/upstream-origins.md`
- `.codex/skills/meta-project-workflow/scripts/init-planning-files.ps1`
- `.codex/skills/meta-project-workflow/scripts/resolve-planning-dir.ps1`
- `.codex/skills/meta-project-workflow/scripts/attest-plan.ps1`
- `.codex/skills/meta-project-workflow/templates/`

## 这个 Skill 做什么

`meta-project-workflow` 整合并改写了三个上游工作流的有用部分：

- `obra/superpowers`
- `OthmanAdi/planning-with-files`
- `anthropics/claude-plugins-official/plugins/ralph-loop`

它不是照搬上游项目，而是适配当前 Windows + Codex App + 大型研究写作项目的工作方式。

核心思路：

- 本轮执行用 Codex 可见计划
- 长期记忆写入 `.planning/active/<task-slug>/`
- 写文章时维护章节地图、论断-证据矩阵、来源登记和决策记录
- 排错时先查根因，再修复
- 完成前必须有新鲜验证证据
- 只对可机器验证的小任务做有限重试，不做无限循环

## 写作型项目初始化

在项目根目录运行：

```powershell
powershell -NoProfile -ExecutionPolicy RemoteSigned -File .\.codex\skills\meta-project-workflow\scripts\init-planning-files.ps1 -TaskSlug manuscript-control -Mode Manuscript
```

会创建：

```text
.planning/active/manuscript-control/
|- task_plan.md
|- findings.md
|- progress.md
|- manuscript_map.md
|- claim_evidence_matrix.md
|- source_register.md
`- decision_log.md
```

`.planning/.active_plan` 会记录当前 active plan。

## 一般项目初始化

```powershell
powershell -NoProfile -ExecutionPolicy RemoteSigned -File .\.codex\skills\meta-project-workflow\scripts\init-planning-files.ps1 -TaskSlug your-task
```

## 上游同步状态

最近一次上游检查：2026-06-03。

`obra/superpowers`：

- 最新正式 release 仍是 `v5.1.0`，GitHub release 发布时间为 2026-05-04。
- 主分支在 2026-05-29 有 post-release 更新，commit `6fd4507659784c351abbd2bc264c7162cfd386dc`。
- 这次更新要求上游贡献披露 authoring environment，包括模型、harness、harness version、安装插件，并明确 PR 目标分支应为 `dev`。

本仓库已经把这条同步进：

- `SKILL.md` 的 Git/GitHub 边界规则
- `references/upstream-origins.md`
- `references/review-checklist.md`

## 验证

本地同步前已验证：

- `skill-creator/scripts/quick_validate.py` 通过
- 三个 PowerShell 脚本语法解析通过
- `-Mode Manuscript` 可生成写作控制文件、resolver 可解析 active plan、attestation 可生成
