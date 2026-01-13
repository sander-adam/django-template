# Project Structure

## Summary
Initial project structure for Django template optimized for Claude-assisted development.

## Architecture Decisions

### Django Configuration
- Using `config/` as the Django project folder (common convention)
- Settings read from environment variables via `python-dotenv`
- PostgreSQL as the default database (production-ready)

### Templates & Static Files
- Project-level `templates/` and `static/` folders
- Vanilla JavaScript - no framework dependencies
- CSS uses custom properties for easy theming

### Testing
- pytest + pytest-django for modern test syntax
- Tests live alongside their apps (`pages/tests.py`)

### Planning Workflow
- New features documented in `/plan/` before implementation
- Completed plans moved to `/plan/completed/`
- This maintains context for future development

### Claude Integration
- `CLAUDE.md` provides project context
- Custom slash commands for common tasks
- Playwright MCP for browser automation

## File Reference

| Path | Purpose |
|------|---------|
| `config/settings.py` | Django settings (env vars) |
| `config/urls.py` | URL routing |
| `pages/` | Main app with home and health views |
| `templates/base.html` | Base HTML template |
| `static/css/main.css` | Global styles |
| `static/js/main.js` | Global JavaScript |
| `.env.example` | Environment variable template |
| `docker-compose.yml` | PostgreSQL service |
| `Makefile` | Common commands |
