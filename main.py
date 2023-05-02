#!/usr/bin/env python3
import os
import json

from datetime import datetime

from flask import Flask, render_template, abort
from flask_frozen import Freezer

# Path the the relationship menu to use
RELATIONSHIP_MENU_PATH = 'databases/example'

app = Flask(__name__)
freezer = Freezer(app)

# True = Starts dev server | False = builds static files
DEV_MODE = False
# Set to True when the static files will be viewed without a web server
app.config['FREEZER_RELATIVE_URLS'] = True
	
@app.route("/")
@app.route("/versions/<version>/")
def relationship_menu(version=None):
	menu_versions = get_menu_versions()
	
	if version == None:
		menu = databases[menu_versions[0]]
	else:
		if version not in menu_versions:
			abort(404)
		else:
			menu = databases[version]
		
	people = menu["people"]
	if len(people) == 2:
		people = " and ".join(people)
	else:
		people = '{} and {}'.format(', '.join(people[:-1]), people[-1])
	
	last_update = datetime.fromisoformat(menu["last_update"]).strftime("%d.%m.%Y, %H:%M")
	
	document_version = menu["document_version"]
	
	return render_template('base.tpl', current_site="menu", relationship_menu=menu["menu"], last_update=last_update, people=people, document_version=document_version)

@app.route("/")
@app.route("/versions/")
def list_versions():
	versions = get_menu_versions()
	return render_template('base.tpl', current_site="versions", databases=databases, versions=versions)
			
def load_database_files():
	databases = {}
	relationship_menus = []
	for file in os.listdir(RELATIONSHIP_MENU_PATH):
		file = os.path.join(RELATIONSHIP_MENU_PATH, file)
		if os.path.isfile(file) and file.endswith('.json'):
			with open(file) as f:
				parsed_json = json.load(f)
				databases[str(parsed_json['document_version'])] = parsed_json
				
	return databases
			
def get_menu_versions():
	menu_versions = list(databases.keys())
	menu_versions.sort(reverse=True)
	return menu_versions
			
if __name__ == '__main__':
	databases = load_database_files()
	
	if DEV_MODE:
		# Debug webserver
		app.run(debug=True)
	else:
		# Build static files
		freezer.freeze()