.PHONY: run test migrate shell db stop clean

# Start Django server in tmux session
run:
	@if tmux has-session -t django 2>/dev/null; then \
		echo "Django server is already running. Use 'tmux attach -t django' to view logs."; \
	else \
		tmux new-session -d -s django 'uv run manage.py runserver'; \
		echo "Django server started in tmux session 'django'"; \
		echo "Visit: http://127.0.0.1:8000/"; \
		echo "View logs: tmux attach -t django"; \
	fi

# Stop Django server
stop:
	@if tmux has-session -t django 2>/dev/null; then \
		tmux kill-session -t django; \
		echo "Django server stopped."; \
	else \
		echo "No Django server running."; \
	fi

# Run tests with pytest
test:
	uv run pytest -v

# Run Django migrations
migrate:
	uv run manage.py makemigrations
	uv run manage.py migrate

# Open Django shell
shell:
	uv run manage.py shell

# Start PostgreSQL with Docker Compose
db:
	docker compose up -d
	@echo "PostgreSQL started. Connection: localhost:5432"

# Stop PostgreSQL
db-stop:
	docker compose down

# Create superuser
superuser:
	uv run manage.py createsuperuser

# Install dependencies
install:
	uv sync

# Clean up generated files
clean:
	find . -type d -name "__pycache__" -exec rm -rf {} + 2>/dev/null || true
	find . -type f -name "*.pyc" -delete 2>/dev/null || true
