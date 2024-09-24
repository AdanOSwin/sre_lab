from tabnanny import verbose
from urllib import response
import requests
import datetime
import socket
import time
import os
from flask import Flask, request, json
from dotenv import load_dotenv

load_dotenv()

host_name = socket.gethostname()

app = Flask(__name__)

@app.route('/')
def hello():
    return 'Welcome to the Backend Service! Navigate to /backend to see some information...'

@app.route('/backend')
def backend():
    format = '%Y-%m-%dT%H:%M:%SZ'
    unix_epoch = time.time()
    time_stamp = datetime.datetime.fromtimestamp(unix_epoch)

    if request.headers.getlist("X-Forwarded-For"):
        ip = request.headers.getlist("X-Forwarded-For")[0]
    else:
        ip = request.remote_addr

    json_str = json.dumps({'DateTime': time_stamp.strftime(format), 'Hostname': host_name, 'ClientIP': ip})
    return json_str

@app.route('/healthcheck')
def healthcheck():
    #url = 'http://localhost:5000/'
    response = requests.get('http://localhost:5000/').status_code
    if (response == 200):
        json_msg = json.dumps('OK! Is up and running')
        return json_msg
    else:
        json_msg = json.dumps('Oh no, we have problems!', response)
        return json_msg

if __name__ == "__main__":
    app.run(host="0.0.0.0")
