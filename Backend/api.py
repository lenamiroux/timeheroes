"""
"""
import requests

from flask import Flask
app = Flask(__name__)

@app.route("/locations")
def get_locations():
    extract_traffic_info
    return "api"

def extract_traffic_info():
    r = requests.get('https://api.github.com/events')

def register_request_data():
    return "f"
