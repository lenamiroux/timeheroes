"""
"""
from flask import Flask
app = Flask(__name__)

@app.route("/locations")
def get_locations():
    return []
