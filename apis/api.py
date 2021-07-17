from flask import Flask, request
from databasequerycode import logindata, tripdata
from creatingtables import logindb
import json

app = Flask(__name__)

@app.route('/auth')
def login():
    email = request.args.get('email')
    password = request.args.get('password')
    print(email)
    # now i will check if the email and password are correct
    login_res = logindata.checkingCredentials(email, password)
    if login_res == 1:
        # validation successful and the user key for making other API requests will be sent from here
        key = logindata.fetchingapikey(email)
        return key
    else:
        # login unsuccessful
        return str(-1)


# expenses fetch
@app.route('/api/trip/expenses/fetch')
def tripexpenses():
    key = request.args.get('key')
    email = request.args.get('email')
    key_valid = logindata.validatingkey(email, key)
    if key_valid == 1:
        # since key is valid, the list with JSON of the trip expenses of the user will be sent here
        resdata = tripdata.querytripexpensedata(email)
        # items resdata[0] and cost resdata[1]
        resp = {
            "items": resdata[0],
            "cost": resdata[1]
        }
        return json.dumps(resp)
    else:
        # since key is not valid, no data will be returned and the mobile app will log the user out.
        return "-1"


#expenses delete
@app.route('/api/trip/expenses/delete')
def deleteexpense():
    key = request.args.get('key')
    email = request.args.get('email')
    item = request.args.get('item')
    price = request.args.get('price')
    key_valid = logindata.validatingkey(email, key)
    if key_valid == 1:
        resp = tripdata.deletetripexpensedata(email, item, price)
        if resp == 1:
            return "1"
        else:
            return "-1"
    else:
        return "-1"

#expenses add
@app.route('/api/trip/expenses/add')
def insertexpense():
    key = request.args.get('key')
    email = request.args.get('email')
    item = request.args.get('item')
    price = request.args.get('price')
    key_valid = logindata.validatingkey(email, key)
    if key_valid == 1:
        resp = tripdata.inserttripexpensedata(email, item, price)
        if resp == 1:
            return "1"
        else:
            return "-1"
    else:
        return "-1"





if __name__ == '__main__':
    app.run( host='0.0.0.0',debug=True)