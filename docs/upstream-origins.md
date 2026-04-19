# Upstream Origins

This packaged skill draws from three upstream sources:

- `obra/superpowers`
- `OthmanAdi/planning-with-files`
- `anthropics/claude-plugins-official/plugins/ralph-loop`

## What Was Borrowed

### From `superpowers`

- plan-first workflow
- clear verification expectations
- systematic debugging mindset

### From `planning-with-files`

- persistent task memory on disk
- separation between plan, findings, and progress
- better cross-session continuity

### From `ralph-loop`

- bounded retry for machine-verifiable subtasks
- explicit stop conditions
- iteration caps instead of endless loops

## What Was Not Carried Over

- Claude-specific hooks or slash commands
- infinite or semi-infinite autonomous looping
- heavyweight workflow overhead for every simple task
- root-level planning clutter
