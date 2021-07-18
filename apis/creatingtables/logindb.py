# login table and first user created using this file


from flask import Flask
import psycopg2
import secrets, os

def firstUser():
    link = os.getenv('dbkey')
    conn = psycopg2.connect(link)
    curr = conn.cursor()
    curr.execute("CREATE TABLE IF NOT EXISTS login(email VARCHAR PRIMARY KEY, password VARCHAR)")
    curr.execute("INSERT INTO login(email, password) VALUES(%s, %s)", ('temp1@gmail.com', 'temp2'), )
    conn.commit()


# creates table for apikey along with first temporary apikey for temp1@gmail.com
def apiKeys(email): 
    key = secrets.token_hex(16)
    try:
        link = os.environ['dbkey']
        conn = psycopg2.connect(link)
        curr = conn.cursor()
        curr.execute("CREATE TABLE IF NOT EXISTS keys(email VARCHAR PRIMARY KEY, key VARCHAR)")
        curr.execute("INSERT INTO keys(email, key) VALUES(%s, %s)", (email, key, ), )
        conn.commit()
        print(key)
        return key
    except:
        print(-1)
        return -1
    return "0"

# if __name__ == '__main__':
#     apiKeys('temp2@gmail.com')
    # firstUser()