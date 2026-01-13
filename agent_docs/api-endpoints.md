# API Endpoints

> **Claude: Update this file whenever you add or modify URLs or views.**

## Overview

Base URL: `http://127.0.0.1:8000`

## Endpoints

### Pages App

| Method | Path | View | Description |
|--------|------|------|-------------|
| GET | `/` | `pages.views.home` | Home page |
| GET | `/health/` | `pages.views.health` | Health check (JSON) |

### Admin

| Method | Path | Description |
|--------|------|-------------|
| GET | `/admin/` | Django admin interface |

## Response Formats

### Health Check
```json
GET /health/
Response: 200 OK
{
  "status": "ok"
}
```

## Authentication

*No authentication configured yet.*

<!--
When adding authenticated endpoints, document:

### Protected Endpoints

| Method | Path | Auth Required | Permissions |
|--------|------|---------------|-------------|
| GET | /api/users/ | Yes | IsAuthenticated |
| POST | /api/items/ | Yes | IsAuthenticated |

### Authentication Methods
- Session auth (default Django)
- Token auth (if using DRF)
-->

## Adding New Endpoints

1. Create view in `app/views.py`
2. Add URL pattern in `app/urls.py`
3. Include app URLs in `config/urls.py` (if new app)
4. **Update this file**

### URL Pattern Example
```python
# app/urls.py
from django.urls import path
from . import views

urlpatterns = [
    path('items/', views.item_list, name='item_list'),
    path('items/<int:pk>/', views.item_detail, name='item_detail'),
]
```

### View Example
```python
# app/views.py
from django.http import JsonResponse
from django.shortcuts import render, get_object_or_404

def item_list(request):
    """List all items."""
    if request.method == 'GET':
        return render(request, 'app/item_list.html')

def item_detail(request, pk):
    """Get single item."""
    item = get_object_or_404(Item, pk=pk)
    return render(request, 'app/item_detail.html', {'item': item})
```
