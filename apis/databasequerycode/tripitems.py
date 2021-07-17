# Items for the trip data query using this python file

# travelitem(email, item)

import psycopg2

def queryitems(email):
    try:
        conn = psycopg2.connect("postgresql://gagandeep:WABb3EPebeVyneCT@free-tier8.aws-ap-southeast-1.cockroachlabs.cloud:26257/defaultdb?sslmode=require&sslrootcert=$env:appdata\.postgresql\root.crt&options=--cluster%3Dhackathon-project-134")
        curr = conn.cursor()
        #  (email, item, cost)
        curr.execute(''' SELECT * from travelitem WHERE email = %s''', (str(email), ) , )
        keyFound = curr.fetchall()
        items = []
        for t in keyFound:
            print(t)
            items.append(t[1])
        return items
    except:
        return -1

def additems(itemname, email):
    try:
        conn = psycopg2.connect("postgresql://gagandeep:WABb3EPebeVyneCT@free-tier8.aws-ap-southeast-1.cockroachlabs.cloud:26257/defaultdb?sslmode=require&sslrootcert=$env:appdata\.postgresql\root.crt&options=--cluster%3Dhackathon-project-134")
        curr = conn.cursor()
        #  (email, item, cost)
        curr.execute(''' INSERT INTO travelitem(email, item) VALUES (%s, %s)''', (str(email), itemname, ),)
        conn.commit()
        return 1
    except:
        return -1

def delitems(itemname, email):
    try:
        conn = psycopg2.connect("postgresql://gagandeep:WABb3EPebeVyneCT@free-tier8.aws-ap-southeast-1.cockroachlabs.cloud:26257/defaultdb?sslmode=require&sslrootcert=$env:appdata\.postgresql\root.crt&options=--cluster%3Dhackathon-project-134")
        curr = conn.cursor()
        #  (email, item, cost)
        curr.execute(''' DELETE FROM travelitem WHERE email = %s AND item = %s''', (str(email), itemname, ),)
        conn.commit()
        return 1
    except:
        return -1
    
