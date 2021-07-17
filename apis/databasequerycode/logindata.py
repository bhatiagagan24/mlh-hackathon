import psycopg2


# used for checking credentials from the data.
# returns 1 if email and password correct
# 0 if no email or password wrong
def checkingCredentials(username, password):
     try:
        conn = psycopg2.connect("postgresql://gagandeep:WABb3EPebeVyneCT@free-tier8.aws-ap-southeast-1.cockroachlabs.cloud:26257/defaultdb?sslmode=require&sslrootcert=$env:appdata\.postgresql\root.crt&options=--cluster%3Dhackathon-project-134")
        curr = conn.cursor()
        curr.execute(''' SELECT password from login WHERE email = %s''', (str(username), ) , )
        accountFound = curr.fetchone()[0]
        print(accountFound)
        if accountFound == password:
            return 1
        else:
            return 0
     except:
         return 0

def fetchingapikey(email):
     conn = psycopg2.connect("postgresql://gagandeep:WABb3EPebeVyneCT@free-tier8.aws-ap-southeast-1.cockroachlabs.cloud:26257/defaultdb?sslmode=require&sslrootcert=$env:appdata\.postgresql\root.crt&options=--cluster%3Dhackathon-project-134")
     curr = conn.cursor()
     curr.execute(''' SELECT key from keys WHERE email = %s''', (str(email), ) , )
     keyFound = curr.fetchone()[0]
     print(keyFound)
     return keyFound



def validatingkey(key):
     try:
        conn = psycopg2.connect("postgresql://gagandeep:WABb3EPebeVyneCT@free-tier8.aws-ap-southeast-1.cockroachlabs.cloud:26257/defaultdb?sslmode=require&sslrootcert=$env:appdata\.postgresql\root.crt&options=--cluster%3Dhackathon-project-134")
        curr = conn.cursor()
        curr.execute(''' SELECT email from keys WHERE key = %s''', (str(key), ) , )
        keyFound = curr.fetchone()[0]
        # this means that the key exists
        return 1
     except:
         # this means that the key does not exists
         return -1


# fetchingapikey('temp1@gmail.com')

# checkingCredentials("temp1@gmail.com", "temp1")