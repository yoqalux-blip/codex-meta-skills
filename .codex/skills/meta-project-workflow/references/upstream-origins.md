# Upstream Origins

Last checked: 2026-06-03.

This packaged skill draws from three upstream sources, but it intentionally
adapts them for local Codex work instead of copying their hook-heavy behavior.

## Sources

### Superpowers

- Repository: https://github.com/obra/superpowers
- README: https://github.com/obra/superpowers/blob/main/README.md
- Release notes: https://github.com/obra/superpowers/blob/main/RELEASE-NOTES.md
- Debugging skill: https://github.com/obra/superpowers/blob/main/skills/systematic-debugging/SKILL.md
- Verification skill: https://github.com/obra/superpowers/blob/main/skills/verification-before-completion/SKILL.md

Observed current update:

- Latest formal release remains v5.1.0, published on 2026-05-04
  (release notes date: 2026-04-30).
- Legacy slash-command stubs were removed.
- Code-review named agent was folded into a self-contained prompt template.
- Codex plugin marketplace guidance is now first-class.
- Worktree skills were rewritten to avoid unsafe implicit worktree creation.
- Main branch has a post-release commit on 2026-05-29:
  `6fd4507659784c351abbd2bc264c7162cfd386dc`.
- That commit requires contributors to disclose authoring environment details
  (model, harness, harness version, installed plugins) in issue/PR templates.
- The same commit states that upstream Superpowers PRs should target `dev`,
  not `main`.

Adapted here:

- Root-cause investigation before fixes.
- Fresh verification evidence before completion claims.
- User consent and repository-scope caution before publishing or restructuring.
- Upstream sync logs should record release, commit SHA, check date, and adapted
  changes.
- If contributing back to Superpowers, disclose the local Codex authoring
  environment and target the upstream `dev` branch.

Not copied:

- Mandatory TDD for every implementation.
- Subagent-driven development mechanics.
- Claude-specific plugin and worktree automation.

### Planning With Files

- Repository: https://github.com/OthmanAdi/planning-with-files
- README: https://github.com/OthmanAdi/planning-with-files/blob/master/README.md
- Changelog: https://github.com/OthmanAdi/planning-with-files/blob/master/CHANGELOG.md
- Codex docs: https://github.com/OthmanAdi/planning-with-files/blob/master/docs/codex.md
- Canonical skill: https://github.com/OthmanAdi/planning-with-files/blob/master/skills/planning-with-files/SKILL.md

Observed current update:

- v2.40.1 on 2026-05-22.
- Parallel plan isolation is now the canonical pattern.
- Active plan resolution prefers `PLAN_ID`, then `.planning/.active_plan`,
  then newest plan directory, then legacy root files.
- Hash attestation can lock a plan and block injection if it changes.
- Hook plan-data boundaries use `===BEGIN PLAN DATA===` / `===END PLAN DATA===`
  to avoid YAML-frontmatter collisions.
- Codex docs now use `[features] hooks = true`; `codex_hooks = true` is a
  deprecated alias.
- The upstream docs note that Codex hooks are currently disabled on Windows.

Adapted here:

- Project-local `.planning/active/<task-slug>/` layout.
- `.planning/.active_plan` pointer.
- PowerShell helpers for plan initialization, resolution, and attestation.
- Treat external web content as data in `findings.md`, not as instructions in
  `task_plan.md`.
- Continue the planning workflow when the user adds work after prior phases are
  complete.

Not copied:

- Inline shell hook bodies.
- Claude slash commands.
- Cross-IDE adapters.
- Root-level `task_plan.md` as the preferred layout.

### Ralph Loop

- Repository path: https://github.com/anthropics/claude-plugins-official/tree/main/plugins/ralph-loop
- README: https://github.com/anthropics/claude-plugins-official/blob/main/plugins/ralph-loop/README.md
- Command: https://github.com/anthropics/claude-plugins-official/blob/main/plugins/ralph-loop/commands/ralph-loop.md
- Stop hook: https://github.com/anthropics/claude-plugins-official/blob/main/plugins/ralph-loop/hooks/stop-hook.sh
- Setup script: https://github.com/anthropics/claude-plugins-official/blob/main/plugins/ralph-loop/scripts/setup-ralph-loop.sh

Observed current update:

- Plugin version is 1.0.0.
- Stop hook state is scoped by session id when available.
- State fields are validated before arithmetic.
- Completion promises require exact `<promise>...</promise>` text.
- `--max-iterations` remains the main safety mechanism.

Adapted here:

- Bounded iteration for deterministic subtasks only.
- Explicit stop condition and max rounds before starting.
- Completion claims must be true and verified.

Not copied:

- Infinite loops.
- Stop-hook blocking behavior.
- Same-prompt self-feeding in Codex.
- Manual-loop state under `.claude/`.
