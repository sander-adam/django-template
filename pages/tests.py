import pytest
from django.test import Client
from django.urls import reverse


@pytest.fixture
def client():
    return Client()


@pytest.mark.django_db
def test_home_page(client):
    """Test that the home page loads successfully."""
    response = client.get(reverse('home'))
    assert response.status_code == 200


def test_health_check(client):
    """Test that the health check endpoint returns OK."""
    response = client.get(reverse('health'))
    assert response.status_code == 200
    assert response.json() == {'status': 'ok'}
