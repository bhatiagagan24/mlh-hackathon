# Items for the trip data query using this python file

# travelitem(email, item)

import psycopg2, os

def queryitems(email):
    try:
        link = os.environ['dbkey']
        conn = psycopg2.connect(link)        
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
        link = os.environ['dbkey']
        conn = psycopg2.connect(link)        
        curr = conn.cursor()
        #  (email, item, cost)
        curr.execute(''' INSERT INTO travelitem(email, item) VALUES (%s, %s)''', (str(email), itemname, ),)
        conn.commit()
        return 1
    except:
        return -1

def delitems(itemname, email):
    try:
        link = os.environ['dbkey']
        conn = psycopg2.connect(link)        
        curr = conn.cursor()
        #  (email, item, cost)
        curr.execute(''' DELETE FROM travelitem WHERE email = %s AND item = %s''', (str(email), itemname, ),)
        conn.commit()
        return 1
    except:
        return -1
    
