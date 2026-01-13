# Setting Up a New Project from This Template

Instructions for Claude to create a new project based on the django-template.

## Required Information

Before starting, confirm these details with the user:
- **Project name**: The name for the new project (e.g., `my-awesome-app`)
- **Project location**: Where to create it (e.g., `~/Projects/my-awesome-app`)
- **Description**: One-line description of what the project does

## Step 1: Copy Template to New Location

```bash
cp -r /path/to/django-template /path/to/new-project
cd /path/to/new-project
```

## Step 2: Reset Git History

```bash
rm -rf .git
git init
git branch -m main
```

## Step 3: Update Project Name

### 3.1 Edit pyproject.toml
Change these fields:
```toml
[project]
name = "NEW_PROJECT_NAME"
description = "NEW_PROJECT_DESCRIPTION"
```

### 3.2 Edit docker-compose.yml
Update container and database names:
```yaml
services:
  db:
    container_name: NEW_PROJECT_NAME_db
    environment:
      POSTGRES_DB: NEW_PROJECT_NAME
```

### 3.3 Edit .env.example
```bash
DATABASE_NAME=NEW_PROJECT_NAME
```

### 3.4 Edit .env
```bash
DATABASE_NAME=NEW_PROJECT_NAME
```

### 3.5 Edit README.md
Update the title and description to match the new project.

### 3.6 Edit CLAUDE.md
Update the project description in the WHAT section.

### 3.7 Edit templates/base.html
Update the default title:
```html
<title>{% block title %}NEW_PROJECT_NAME{% endblock %}</title>
```

And footer:
```html
<p>&copy; {% now "Y" %} NEW_PROJECT_NAME</p>
```

### 3.8 Edit templates/pages/home.html
Update the welcome message to reflect the new project.

## Step 4: Generate Secret Key

Run this command and copy the output to `.env`:
```bash
uv run python -c "from django.core.management.utils import get_random_secret_key; print(get_random_secret_key())"
```

Update `.env`:
```bash
SECRET_KEY=<paste-generated-key-here>
```

## Step 5: Clean Up Template Files

Remove or update these template-specific files:
```bash
# Remove the plan file about setting up new projects (it's for the template)
rm plan/new-project-setup.md

# Clear the completed plans folder
rm -rf plan/completed/*

# Update project-structure.md with new project details
```

Reset the agent_docs to fresh state (keep structure, clear template content):
- `agent_docs/database-schema.md` - Clear "Project Models" section, keep structure
- `agent_docs/api-endpoints.md` - Keep pages app endpoints, clear examples
- `agent_docs/testing-guide.md` - Keep patterns, they're reusable

## Step 6: Verify Setup

```bash
# Install dependencies
uv sync

# Start database
docker compose up -d

# Wait for database to be ready
sleep 3

# Run migrations
uv run manage.py migrate

# Run tests
uv run pytest -v

# Check Django configuration
uv run manage.py check
```

## Step 7: Initial Git Commit

```bash
git add .
git commit -m "Initial project setup from django-template

- Django 6.0 with Python 3.12
- PostgreSQL database
- pytest for testing
- Claude Code integration

Co-Authored-By: Claude <noreply@anthropic.com>"
```

## Checklist

Before finishing, verify:
- [ ] Project name updated in all files
- [ ] Secret key generated and added to .env
- [ ] Database starts successfully
- [ ] Migrations run without errors
- [ ] Tests pass
- [ ] Django check reports no issues
- [ ] Initial commit created

## Files Modified

| File | Changes |
|------|---------|
| `pyproject.toml` | name, description |
| `docker-compose.yml` | container_name, POSTGRES_DB |
| `.env.example` | DATABASE_NAME |
| `.env` | DATABASE_NAME, SECRET_KEY |
| `README.md` | Title, description |
| `CLAUDE.md` | Project description |
| `templates/base.html` | Title, footer |
| `templates/pages/home.html` | Welcome message |
| `plan/project-structure.md` | Project-specific details |
| `agent_docs/database-schema.md` | Reset to empty state |
| `agent_docs/api-endpoints.md` | Keep base endpoints |

## Example: Creating "Task Tracker" Project

```bash
# Step 1: Copy template
cp -r ~/Gits/django-template ~/Projects/task-tracker
cd ~/Projects/task-tracker

# Step 2: Reset git
rm -rf .git && git init && git branch -m main

# Step 3-4: Update files (use Edit tool for each file listed above)
# Replace "django-template" with "task-tracker"
# Replace "django_template" with "task_tracker" (for Python/DB names)

# Step 5: Remove template setup file
rm plan/new-project-setup.md

# Step 6: Verify
uv sync
docker compose up -d
sleep 3
uv run manage.py migrate
uv run pytest -v

# Step 7: Commit
git add .
git commit -m "Initial project setup for Task Tracker"
```
