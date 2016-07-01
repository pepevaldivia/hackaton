# app.py

# -*- coding: utf-8 -*-

import sys 
import json

from flask import Flask, jsonify,request
from flask.ext.cors import CORS, cross_origin
from pymongo import MongoClient
from bson.json_util import dumps
from bson import json_util

app = Flask(__name__)
cors = CORS(app)
app.config['CORS_HEADERS'] = 'Content-Type'

@app.route('/')
def index():
	return '<h1>Hackaton REP ULima 2016</h1>'


@app.route('/listar/<coleccion>', methods=['GET'])
def listar_ubicaciones(coleccion):
	client = MongoClient('mongodb://localhost:27017/')
	db = client.db_rep

	rpta = []
	
	if coleccion == "mantenimientos":
		rpta = list(db.mantenimientos.find())

	if coleccion == "ubicaciones":
		rpta = list(db.ubicaciones.find())

	if coleccion == "equipos":
		rpta = list(db.equipos.find())

	if coleccion == "cpmms":
		rpta = list(db.cpmms.find())

	return  json.dumps(rpta, default=json_util.default)

if __name__ == '__main__':
	app.run(debug=True, host='0.0.0.0', port=5001)