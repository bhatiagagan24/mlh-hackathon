from flask import Flask, request
from databasequerycode import logindata
from creatingtables import logindb

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


@app.route('/api/fetch/trip/expenses')
def tripexpenses():
    key = request.args.get('key')
    key_valid = logindata.validatingkey(key)
    if key_valid == 1:
        # since key is valid, the list with JSON of the trip expenses of the user will be sent here
        return "1"
    else:
        # since key is not valid, no data will be returned and the mobile app will log the user out.
        return "-1"



if __name__ == '__main__':
    app.run(debug=True)