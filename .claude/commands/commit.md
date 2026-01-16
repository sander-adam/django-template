# Commit Current Work

Generate a sensible commit message and commit the current changes to git.

## Steps

### 1. Check Current State
```bash
git status
git diff --staged
git diff
```

### 2. Stage Changes
- If nothing is staged, ask user what to stage or stage all changes with `git add -A`
- Review the files to be committed

### 3. Analyze Changes

Look at the diff to understand:
- What was added/modified/deleted
- The purpose of the changes
- Any related files that form a logical unit

### 4. Generate Commit Message

Follow these conventions:
- **First line**: Concise summary (50 chars or less), imperative mood
  - Use: "Add", "Fix", "Update", "Remove", "Refactor"
  - Not: "Added", "Fixes", "Updating"
- **Body** (if needed): Explain what and why, not how

**Examples:**
- `Add user authentication with JWT tokens`
- `Fix pagination bug on search results page`
- `Update dependencies to latest versions`
- `Refactor database queries for better performance`

### 5. Commit

```bash
git commit -m "$(cat <<'EOF'
<commit message>

Co-Authored-By: Claude Opus 4.5 <noreply@anthropic.com>
EOF
)"
```

### 6. Show Result

Display:
- The commit hash and message
- Files that were committed
- Current branch status

## Notes

- Do NOT push automatically - let the user decide when to push
- If changes span multiple unrelated features, suggest splitting into multiple commits
- Keep commits atomic - one logical change per commit
