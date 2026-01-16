# Django Template

## WHAT
A Django 6.0 project using:
- **Python 3.12** managed by uv
- **PostgreSQL 16** via Docker Compose
- **pytest** for testing
- Vanilla JavaScript (no frameworks)

### Project Structure
```
config/          # Django project settings
pages/           # Main app (home, health check)
templates/       # Project-level templates
static/          # CSS and JavaScript files
plan/            # Feature planning docs (see plan/README.md)
agent_docs/      # Living documentation (keep updated!)
.claude/         # Claude Code configuration
```

## WHY
Template for rapid Django development with Claude Code. Optimized for:
- Quick project setup with reproducible environments
- Clear documentation for AI-assisted development
- Planning workflow to document features before implementing

## HOW

### Quick Start
```bash
docker compose up -d        # Start PostgreSQL
uv sync                     # Install dependencies
uv run manage.py migrate    # Apply migrations
uv run manage.py runserver  # Start dev server
```

### Common Commands
```bash
make run        # Start server in tmux
make test       # Run pytest
make migrate    # Make and apply migrations
make db         # Start PostgreSQL
make shell      # Django shell
```

### Testing
```bash
uv run pytest -v                    # Run all tests
uv run pytest pages/tests.py -v     # Run specific file
```

### Planning New Features
1. Create a planning file in `/plan/` (e.g., `user-auth.md`)
2. Document the approach before implementing
3. Move completed plans to `/plan/completed/`

See `plan/README.md` for the planning workflow.

### URLs
- Home: http://127.0.0.1:8000/
- Health: http://127.0.0.1:8000/health/
- Admin: http://127.0.0.1:8000/admin/

### Creating a New Project from This Template
See `plan/new-project-setup.md` for step-by-step instructions to create a new project based on this template.

---

## Python & uv

**Always use `uv` for all Python operations.** Never use `pip`, `python`, or `pip install` directly.

```bash
uv run <command>        # Run any Python command
uv run manage.py ...    # Django management commands
uv run pytest ...       # Run tests
uv add <package>        # Add a dependency
uv sync                 # Install/sync dependencies
```

---

## Documentation Maintenance

**Important:** Keep the `agent_docs/` folder updated as the project evolves.

### When to Update

| Document | Update When |
|----------|-------------|
| `agent_docs/database-schema.md` | Adding or modifying models, fields, or relationships |
| `agent_docs/api-endpoints.md` | Adding or modifying views, URLs, or API responses |
| `agent_docs/testing-guide.md` | Adding new test patterns, fixtures, or testing utilities |

### Update Checklist

After making changes, ask yourself:
- [ ] Did I add/modify a model? → Update `database-schema.md`
- [ ] Did I add/modify a URL or view? → Update `api-endpoints.md`
- [ ] Did I add a new test pattern or fixture? → Update `testing-guide.md`

### Why This Matters

These docs serve as project memory across conversations. Keeping them updated means:
- Faster context loading in new sessions
- Fewer questions about project structure
- Consistent patterns across the codebase
