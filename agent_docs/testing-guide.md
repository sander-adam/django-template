# Testing Guide

> **Claude: Update this file when you add new testing patterns or fixtures.**

## Overview

Framework: pytest + pytest-django
Config: `pyproject.toml`

## Running Tests

```bash
make test                           # Run all tests
uv run pytest -v                    # Verbose output
uv run pytest pages/tests.py        # Specific file
uv run pytest -k "test_home"        # Match test name
uv run pytest --lf                  # Re-run last failed
uv run pytest -x                    # Stop on first failure
```

## Test Structure

Tests live alongside their apps:
```
pages/
  tests.py          # or tests/ folder for larger apps
```

## Fixtures

### Built-in pytest-django Fixtures

| Fixture | Description |
|---------|-------------|
| `client` | Django test client |
| `rf` | RequestFactory |
| `db` | Database access (use `@pytest.mark.django_db`) |
| `admin_client` | Logged-in admin client |

### Project Fixtures

Located in `conftest.py` (create if needed):

*No custom fixtures yet.*

<!--
When adding fixtures, document them here:

| Fixture | Description | Returns |
|---------|-------------|---------|
| `user` | Regular user | User instance |
| `api_client` | Authenticated API client | Client |
-->

## Test Patterns

### View Test (HTML Response)
```python
import pytest
from django.urls import reverse

@pytest.mark.django_db
def test_home_page(client):
    """Test that the home page loads successfully."""
    response = client.get(reverse('home'))
    assert response.status_code == 200
    assert b'Welcome' in response.content
```

### View Test (JSON Response)
```python
def test_health_check(client):
    """Test that the health check endpoint returns OK."""
    response = client.get(reverse('health'))
    assert response.status_code == 200
    assert response.json() == {'status': 'ok'}
```

### Model Test
```python
import pytest
from myapp.models import Item

@pytest.mark.django_db
def test_item_creation():
    """Test creating an item."""
    item = Item.objects.create(name='Test Item')
    assert item.pk is not None
    assert str(item) == 'Test Item'
```

### Form Test
```python
from myapp.forms import ItemForm

def test_item_form_valid():
    """Test form with valid data."""
    form = ItemForm(data={'name': 'Test', 'quantity': 5})
    assert form.is_valid()

def test_item_form_invalid():
    """Test form with missing required field."""
    form = ItemForm(data={})
    assert not form.is_valid()
    assert 'name' in form.errors
```

### POST Request Test
```python
@pytest.mark.django_db
def test_create_item(client):
    """Test creating an item via POST."""
    response = client.post(
        reverse('item_create'),
        data={'name': 'New Item'},
    )
    assert response.status_code == 302  # Redirect after success
    assert Item.objects.filter(name='New Item').exists()
```

### Authenticated Request Test
```python
@pytest.mark.django_db
def test_protected_view(client, django_user_model):
    """Test view that requires login."""
    # Create and login user
    user = django_user_model.objects.create_user(
        username='testuser',
        password='testpass'
    )
    client.login(username='testuser', password='testpass')

    response = client.get(reverse('protected'))
    assert response.status_code == 200
```

## Markers

```python
@pytest.mark.django_db              # Test needs database
@pytest.mark.slow                   # Mark slow tests
@pytest.mark.skip(reason="...")     # Skip test
@pytest.mark.parametrize(...)       # Run with multiple inputs
```

## Best Practices

1. **One assertion focus** - Test one thing per test
2. **Descriptive names** - `test_user_cannot_delete_others_posts`
3. **Use fixtures** - Don't repeat setup code
4. **Test behavior** - Not implementation details
5. **Fast tests** - Mock external services
