from django.http import JSONResponse
from .services import fetch_top_stories, fetch_latest_stories

def top_stories(request):
    data = fetch_top_stories()
    return JSONResponse({"results": data}, safe = False)

def latest_stories(request):
    data = fetch_latest_stories()
    return JSONResponse({"results": data}, safe = False)