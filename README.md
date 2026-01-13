# Django Template

A Django project template optimized for Claude-assisted development.

## Features

- **Django 6.0** with Python 3.12
- **PostgreSQL** via Docker Compose
- **pytest** for testing
- **uv** for fast dependency management
- **Claude Code** integration with custom slash commands
- Planning workflow for AI-assisted development

## Quick Start

### Prerequisites

- [uv](https://docs.astral.sh/uv/) (Python package manager)
- [Docker](https://www.docker.com/) (for PostgreSQL)
- [tmux](https://github.com/tmux/tmux) (optional, for background server)

### Setup

1. Clone this template and navigate to the project:
   ```bash
   cd django-template
   ```

2. Copy environment variables:
   ```bash
   cp .env.example .env
   ```

3. Start PostgreSQL:
   ```bash
   make db
   ```

4. Install dependencies and run migrations:
   ```bash
   uv sync
   make migrate
   ```

5. Start the development server:
   ```bash
   make run
   ```

6. Visit http://127.0.0.1:8000/

## Commands

| Command | Description |
|---------|-------------|
| `make run` | Start Django server in tmux |
| `make stop` | Stop the Django server |
| `make test` | Run pytest |
| `make migrate` | Create and apply migrations |
| `make shell` | Open Django shell |
| `make db` | Start PostgreSQL |
| `make db-stop` | Stop PostgreSQL |
| `make superuser` | Create admin user |

## Project Structure

```
django-template/
├── config/          # Django settings and URLs
├── pages/           # Main app (home, health check)
├── templates/       # HTML templates
├── static/          # CSS and JavaScript
├── plan/            # Feature planning docs
└── .claude/         # Claude Code configuration
```

## Development with Claude

This template is designed for AI-assisted development with Claude Code:

1. **CLAUDE.md** - Project context loaded automatically
2. **Slash commands** - `/runserver`, `/test`, `/migrate`
3. **Planning workflow** - Document features in `/plan/` before building

### Planning New Features

1. Create a file in `/plan/` (e.g., `user-auth.md`)
2. Describe the feature and implementation approach
3. Build the feature
4. Move the plan to `/plan/completed/`

## Testing

```bash
make test                          # Run all tests
uv run pytest pages/tests.py -v    # Run specific tests
```

## Environment Variables

See `.env.example` for all available settings:

- `SECRET_KEY` - Django secret key
- `DEBUG` - Enable debug mode (True/False)
- `ALLOWED_HOSTS` - Comma-separated list of hosts
- `DATABASE_*` - PostgreSQL connection settings
