# -*- coding: utf-8 -*-
"""
"""
from flask import Flask, jsonify
from flask import render_template
import math
import psycopg2
import psycopg2.extras
import json
import random
import datetime

app = Flask(__name__)

MS_KEY="Ai6Prj6b3NsRhcnEUuHfSz_k4RIWc_WpSd25tTCPtMfwKubnUZn9xuJT3iAxxOal"

INCIDENTS_END_POINT="http://dev.virtualearth.net/REST/v1/Traffic/Incidents/%s,%s,%s,%s?key="+MS_KEY

@app.route("/meus-destinos")
def meus_destinos():
    return render_template("meus_destinos.html")
    
    
@app.route("/locations/<int:hour>/<int:minute>")
def get_locations(hour, minute):
    pg = psycopg2.connect("dbname='timeheroes' user='postgres' host='localhost' password='postgres'")
    
    sql = "select id_mean_traffic, mean_delay_time, mean_person from mean_traffic where id_mean_traffic = (select floor(random() * 672 + 1)::int);"

    cursor = pg.cursor(cursor_factory=psycopg2.extras.DictCursor)
    
    cursor.execute(sql)
    res = cursor.fetchone()
    
    dict_res = {}
    columns = ['id_mean_traffic', 'mean_delay_time', 'mean_person']
    for i, key in zip(res, columns):
        dict_res[key] = i
    
    if minute < 15:
        minute_sug = random.choice(['30', '45'])
        hour_sug = hour
    elif minute < 30:
        minute_sug = random.choice(['45', '00'])
        hour_sug = hour
        if minute_sug == '00':
            if hour == 23:
                hour_sug = '00'
            else:
                hour_sug = hour + 1
    else:
        minute_sug = random.choice(['00', '15'])
        if hour == 23:
            hour_sug = '00'
        else:
            hour_sug = hour + 1
    
    time_sug = str(hour_sug) + ':' + minute_sug + ':'+ '00' 
    dict_res['time_suggested'] = time_sug
    
    dict_res['time_saved'] = dict_res['mean_delay_time'] * 15
    
    return jsonify(dict_res)

def extract_traffic_info(lat, lon):
    r = requests.get(INCIDENTS_END_POINT, )
    return r.text

def register_request_data():
    return "f"

def deg2rad(degrees):
    return math.pi*degrees/180.0
def rad2deg(radians):
    return 180.0*radians/math.pi

WGS84_a = 6378137.0  
WGS84_b = 6356752.3

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
