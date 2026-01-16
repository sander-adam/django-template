# Pre-Commit: Update Plan Documentation

Before committing, update the plan files to reflect the current state of work.

## Steps

### 1. Identify Active Plans
```bash
# List plan files (excluding completed/)
ls plan/*.md 2>/dev/null | grep -v README
```

### 2. Review Changes Being Committed
```bash
git diff --cached --name-only  # Staged files
git diff --name-only           # Unstaged changes
```

### 3. Update Plan Files

For each active plan file related to the current work:

**If work is IN PROGRESS:**
- Add a `## Progress` section (if not present)
- Mark completed items with [x]
- Add notes about what was done
- List remaining tasks

**If work is COMPLETE:**
- Ensure all items are marked [x]
- Add a `## Completed` line with today's date
- Move the file to `plan/completed/`

### 4. Plan File Format

Update plans to include progress tracking:

```markdown
# Feature Name

## Summary
...

## Implementation
- [x] Step one (done)
- [x] Step two (done)
- [ ] Step three (remaining)

## Progress
- 2024-01-15: Completed steps 1-2, added models and views
- 2024-01-16: Fixed tests, ready for review

## Completed
2024-01-16
```

### 5. Handle No Active Plan

If there's no plan file for the current work:
- Ask if one should be created
- If yes, create a brief retrospective plan in `plan/completed/` documenting what was done

### 6. Report

Show the user:
- Which plan files were updated
- What progress was recorded
- Any plans moved to completed/

## Notes

- Run this before committing feature work
- Keeps plan/ folder as a living record of project progress
- Completed plans serve as documentation of past decisions
