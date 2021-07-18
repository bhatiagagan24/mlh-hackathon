import psycopg2
import secrets
import os

# used for checking credentials from the data.
# returns 1 if email and password correct
# 0 if no email or password wrong
def checkingCredentials(username, password):
     link = os.environ['dbkey']
     print(link)
     try:
        link = os.environ['dbkey']
        print(link)
        conn = psycopg2.connect(link)
        curr = conn.cursor()
        curr.execute(''' SELECT password from login WHERE email = %s''', (str(username), ) , )
        accountFound = curr.fetchone()[0]
        # print(accountFound)
        if accountFound == password:
            return 1
        else:
            return 0
     except:
         print('error')
         return 0

def fetchingapikey(email):
     link = os.environ['dbkey']
     conn = psycopg2.connect(link)
     curr = conn.cursor()
     curr.execute(''' SELECT key from keys WHERE email = %s''', (str(email), ) , )
     keyFound = curr.fetchone()[0]
    #  print(keyFound)
     return keyFound



def validatingkey(email, key):
     try:
        link = os.environ['dbkey']
        conn = psycopg2.connect(link)
        curr = conn.cursor()
        curr.execute(''' SELECT email from keys WHERE key = %s''', (str(key), ) , )
        emailFound = curr.fetchone()[0]
        # this means that the key exists
        if email == emailFound:
            print("email = key")
            return 1
        else:
            print("email != key")
            return -1
     except:
         # this means that the key does not exists
         print("error")
         return -1



def signUp(email, password):
    try:
        link = os.environ['dbkey']
        conn = psycopg2.connect(link)
        curr = conn.cursor()
        curr.execute(''' INSERT INTO login(email, password) VALUES(%s, %s)''', (str(email), password, ) , )
        conn.commit()
        newKey = secrets.token_hex(16)
        # print("newKey")
        curr.execute("INSERT INTO keys(email, key) VALUES(%s, %s)", (email, newKey, ), )
        conn.commit()
        return 1
    except:
        return -1



# fetchingapikey('temp1@gmail.com')

# checkingCredentials("temp1@gmail.com", "temp1")

# validatingkey('temp9@gmail.com', 'c9dee6e150d0acdea63ddc301ac39c4c')