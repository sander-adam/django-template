Start the Django development server in a tmux session named 'django'.

If the tmux session already exists, show the user how to attach to it.

Steps:
1. Check if tmux session 'django' exists
2. If not, create it and run `uv run manage.py runserver`
3. If it exists, tell the user to run `tmux attach -t django` to view logs

The server runs on http://127.0.0.1:8000/
