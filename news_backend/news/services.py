import requests

HN_BASE_URL = "https://hn.algolia.com/api/v1"

def fetch_top_stories():
    response = requests.get(f"{HN_BASE_URL}/search?tags=front_page")
    response.raise_for_status()
    return response.json()["hits"]

def fetch_latest_stories():
    response = requests.get(f"{HN_BASE_URL}/search_by_date?tags=story")
    response.raise_for_status()
    return response.json()["hits"]