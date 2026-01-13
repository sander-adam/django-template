# Agent Documentation

This folder contains living documentation that Claude should reference and update during development.

## Purpose

These docs provide quick context without reading all source files. They act as a "project memory" that persists across conversations.

## Files

| File | Purpose | Update When |
|------|---------|-------------|
| `database-schema.md` | Models and relationships | Adding/modifying models |
| `api-endpoints.md` | All URL routes | Adding/modifying views or URLs |
| `testing-guide.md` | How to write tests | Adding new test patterns |

## Rules for Claude

1. **Read before implementing** - Check relevant docs before making changes
2. **Update after changes** - Keep docs in sync with code
3. **Be concise** - These are quick references, not exhaustive documentation
4. **Include examples** - Show actual code patterns from this project
