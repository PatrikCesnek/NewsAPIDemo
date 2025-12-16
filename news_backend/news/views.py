from django.http import JsonResponse
from .services import fetch_top_stories, fetch_latest_stories

def top_stories(request):
    return JsonResponse(
        {"results": fetch_top_stories()},
        safe=False
    )

def latest_stories(request):
    return JsonResponse(
        {"results": fetch_latest_stories()},
        safe=False
    )
