
# used for querying the trip data by the api
import psycopg2

def querytripdata(email):
     conn = psycopg2.connect("postgresql://gagandeep:WABb3EPebeVyneCT@free-tier8.aws-ap-southeast-1.cockroachlabs.cloud:26257/defaultdb?sslmode=require&sslrootcert=$env:appdata\.postgresql\root.crt&options=--cluster%3Dhackathon-project-134")
     curr = conn.cursor()
    #  (email, item, cost)
     curr.execute(''' SELECT * from travel WHERE email = %s''', (str(email), ) , )
     keyFound = curr.fetchall()
     items = []
     cost = []
     for t in keyFound:
         print(t)
         items.append(t[1])
         cost.append(t[2])
     print(items)
    #  print(keyFound)
    #  return keyFound

if __name__ == '__main__':
    querytripdata('temp1@gmail.com')