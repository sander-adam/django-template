from django.http import JsonResponse
from django.shortcuts import render


def home(request):
    """Home page view."""
    return render(request, 'pages/home.html')


def health(request):
    """Health check endpoint for monitoring and load balancers."""
    return JsonResponse({'status': 'ok'})
