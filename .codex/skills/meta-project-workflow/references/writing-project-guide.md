# Writing Project Guide

Use this reference when the project is a manuscript, review, grant-style article,
or any long-form academic writing task.

## Folder Roles

Recommended project-level folders:

- `manuscript/`: draft text, section drafts, response letters if any
- `references/`: citation exports, BibTeX/RIS/NBIB, manually curated reference
  notes
- `analysis/`: R/Python notebooks or scripts that generate claims, figures, and
  tables
- `figures/`: export-ready figures and editable source files
- `tables/`: tables and extraction sheets
- `qc/`: reporting checks, reference audits, figure checks, reproducibility logs
- `.planning/active/`: task state and writing-control files

Create folders only when needed. Do not add empty structure just for ceremony.

## Article Control Files

### manuscript_map.md

Use for the article's shape:

- working title and title alternatives
- target journal or article type
- core thesis
- section outline
- figure/table plan
- current status for each section
- unresolved writing risks

### claim_evidence_matrix.md

Use before drafting and before polishing:

- claim
- section where it appears
- evidence source
- evidence strength
- citation status
- weakness or caveat
- action needed

Every strong claim in polished text should have an entry.

### source_register.md

Use for everything already read or generated:

- papers
- clinical or public datasets
- GWAS/MR resources
- single-cell databases
- package documentation
- local outputs
- URLs and access dates

Mark whether each source is primary evidence, background, method reference,
guideline, or only exploratory.

### decision_log.md

Use when a choice would be hard to reconstruct later:

- article scope
- terminology
- inclusion/exclusion logic
- analysis method
- figure/table design
- why a tempting direction was not pursued

This prevents later "why did we do that?" drift.

## Writing Workflow

1. Define the section goal.
2. List the claims needed in that section.
3. Check whether each claim has evidence.
4. Draft only from supported claims.
5. Leave weak claims as explicit TODOs or caveats.
6. Update the article map and evidence matrix after each writing burst.
7. Run a section-level review before polishing.

## Anti-Chaos Rules

- Do not start polishing before the section's claim list is stable.
- Do not mix literature discovery, statistical interpretation, and prose polish
  in the same uncontrolled burst.
- Do not let a new interesting paper silently change the article's thesis.
  Record the decision in `decision_log.md`.
- Do not keep citation decisions only in chat.
- Do not declare a section done until evidence, citations, and caveats have all
  been checked.
