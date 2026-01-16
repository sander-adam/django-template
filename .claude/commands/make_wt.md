# Make Worktree

Create a git worktree for the specified branch and start a development server.

**Argument:** Branch name (e.g., `feature/my-branch`)

## Steps

### 1. Validate Input
- Ensure a branch name argument is provided: $ARGUMENTS
- If no argument provided, show usage: `/make_wt <branch-name>`

### 2. Prepare Worktree Directory
```bash
# Create .trees directory if it doesn't exist
mkdir -p .trees

# Convert branch name to directory name (replace / with -)
# e.g., feature/my-branch -> feature-my-branch
```

### 3. Create Worktree
```bash
# Check if worktree already exists
# If not, create it with: git worktree add .trees/<dir-name> -b <branch-name>
# Or if branch exists: git worktree add .trees/<dir-name> <branch-name>
```

### 4. Setup Environment (in worktree directory)
```bash
# Symlink .venv if it exists in main directory (saves disk space)
# ln -s ../../.venv .venv

# Symlink node_modules if it exists (saves disk space)
# ln -s ../../node_modules node_modules
```

### 5. Find Available Port
```bash
# Start at port 8000
# Check if port is in use with: lsof -i :<port>
# If in use, increment port and try again
# Continue until finding an available port
```

### 6. Start Development Server
```bash
# In a new tmux session named after the branch (sanitized)
# Run: uv run manage.py runserver 0.0.0.0:<port>
```

### 7. Report to User
Display:
- Worktree location: `.trees/<dir-name>`
- Server URL: `http://127.0.0.1:<port>/`
- How to attach to tmux session
- How to remove worktree when done: `git worktree remove .trees/<dir-name>`

## Example

```
/make_wt feature/user-auth

Created worktree at: .trees/feature-user-auth
Server running at: http://127.0.0.1:8001/
Tmux session: feature-user-auth

To view logs: tmux attach -t feature-user-auth
To remove worktree: git worktree remove .trees/feature-user-auth
```

## Notes

- Worktrees share the git history but have independent working directories
- Symlinked .venv means no need to reinstall dependencies
- Each worktree can run on a different port for parallel development
- Add `.trees/` to `.gitignore` if not already present
