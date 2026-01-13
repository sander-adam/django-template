# Database Schema

> **Claude: Update this file whenever you add or modify models.**

## Overview

Database: PostgreSQL 16
ORM: Django 6.0

## Models

### Django Built-in Models

| Model | App | Purpose |
|-------|-----|---------|
| User | auth | User accounts (default Django user) |
| Session | sessions | User sessions |

### Project Models

*No custom models yet.*

<!--
When adding models, use this format:

### ModelName
**App:** app_name
**Purpose:** Brief description

| Field | Type | Description |
|-------|------|-------------|
| id | BigAutoField | Primary key |
| name | CharField(100) | The name |
| created_at | DateTimeField | Auto-set on creation |

**Relationships:**
- Has many: OtherModel (foreign key on OtherModel.model_name)
- Belongs to: ParentModel (via parent field)

**Example:**
```python
Model.objects.create(name="Example")
Model.objects.filter(active=True).select_related('parent')
```
-->

## Entity Relationship Diagram

```
[User] ----< [Session]
```

## Indexes

*No custom indexes yet.*

## Migrations

Run migrations:
```bash
make migrate
# or: uv run manage.py makemigrations && uv run manage.py migrate
```

Check migration status:
```bash
uv run manage.py showmigrations
```
