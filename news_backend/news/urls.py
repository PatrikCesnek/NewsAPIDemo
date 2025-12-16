from django.urls import path
from .views import top_stories, latest_stories

urlpatterns = [
    path("top/", top_stories),
    path("latest/", latest_stories)
]
