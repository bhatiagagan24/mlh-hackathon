# creating table for managing trip expense of the user
import psycopg2



# creating travel expense table with sample data

# travel table stores the travel expense info
def tripexpensedb():
     conn = psycopg2.connect("postgresql://gagandeep:WABb3EPebeVyneCT@free-tier8.aws-ap-southeast-1.cockroachlabs.cloud:26257/defaultdb?sslmode=require&sslrootcert=$env:appdata\.postgresql\root.crt&options=--cluster%3Dhackathon-project-134")
     curr = conn.cursor()
     curr.execute("CREATE TABLE IF NOT EXISTS travel(email VARCHAR, item VARCHAR, cost VARCHAR)")
     curr.execute("INSERT INTO travel(email, item, cost) VALUES(%s, %s, %s)", ('temp1@gmail.com', 'coffee', '100'), )
     curr.execute("INSERT INTO travel(email, item, cost) VALUES(%s, %s, %s)", ('temp1@gmail.com', 'tea', '300'), )
     curr.execute("INSERT INTO travel(email, item, cost) VALUES(%s, %s, %s)", ('temp1@gmail.com', 'lunch', '1000'), )
     curr.execute("INSERT INTO travel(email, item, cost) VALUES(%s, %s, %s)", ('temp1@gmail.com', 'hotel expense', '4000'), )
     conn.commit()

if __name__ == '__main__':
    tripexpensedb()