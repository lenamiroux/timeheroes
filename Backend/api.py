# -*- coding: utf-8 -*-
"""
"""
import requests

from flask import Flask, jsonify
import math
import psycopg2

app = Flask(__name__)

MS_KEY="Ai6Prj6b3NsRhcnEUuHfSz_k4RIWc_WpSd25tTCPtMfwKubnUZn9xuJT3iAxxOal"

"""
lat=-105 
"""

INCIDENTS_END_POINT="http://dev.virtualearth.net/REST/v1/Traffic/Incidents/37,-105,45,-94?key="+MS_KEY

@app.route("/locations/<lat>,<lon>")
def get_locations(lat, lon):
    pg = psycopg2.connect("dbname='mean_traffic' user='postgres' host='localhost' password='postgres'")

    has_traffic = extract_traffic_info(lat,lon)
    return has_traffic

def extract_traffic_info(lat, lon):
    r = requests.get(INCIDENTS_END_POINT, )
    return r.text

def register_request_data():
    return "f"

def deg2rad(degrees):
    return math.pi*degrees/180.0
def rad2deg(radians):
    return 180.0*radians/math.pi

WGS84_a = 6378137.0  # Major semiaxis [m]
WGS84_b = 6356752.3  # Minor semiaxis [m]

def WGS84EarthRadius(lat):
    An = WGS84_a*WGS84_a * math.cos(lat)
    Bn = WGS84_b*WGS84_b * math.sin(lat)
    Ad = WGS84_a * math.cos(lat)
    Bd = WGS84_b * math.sin(lat)
    return math.sqrt( (An*An + Bn*Bn)/(Ad*Ad + Bd*Bd) )

def boundingBox(latitudeInDegrees, longitudeInDegrees, halfSideInKm):
    lat = deg2rad(latitudeInDegrees)
    lon = deg2rad(longitudeInDegrees)
    halfSide = 1000*halfSideInKm

    radius = WGS84EarthRadius(lat)
    pradius = radius*math.cos(lat)

    latMin = lat - halfSide/radius
    latMax = lat + halfSide/radius
    lonMin = lon - halfSide/pradius
    lonMax = lon + halfSide/pradius

    return {
        "latMin": latMin,
        "laMax": latMax,
        "lonMin": lonMin,
        "lonMax": lonMax
    }

>>>>>>> f6514874e021e719af325efd7edcddd58962a03e
