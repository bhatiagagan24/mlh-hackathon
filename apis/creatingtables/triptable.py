# creating table for managing trip expense of the user
import psycopg2



# creating travel expense table with sample data

# travel table stores the travel expense info
def tripexpensedb():
     link = os.getenv('dbkey')
     conn = psycopg2.connect(link)     
     curr = conn.cursor()
     curr.execute("CREATE TABLE IF NOT EXISTS travel(email VARCHAR, item VARCHAR, cost VARCHAR)")
     curr.execute("INSERT INTO travel(email, item, cost) VALUES(%s, %s, %s)", ('temp1@gmail.com', 'coffee', '100'), )
     curr.execute("INSERT INTO travel(email, item, cost) VALUES(%s, %s, %s)", ('temp1@gmail.com', 'tea', '300'), )
     curr.execute("INSERT INTO travel(email, item, cost) VALUES(%s, %s, %s)", ('temp1@gmail.com', 'lunch', '1000'), )
     curr.execute("INSERT INTO travel(email, item, cost) VALUES(%s, %s, %s)", ('temp1@gmail.com', 'hotel expense', '4000'), )
     conn.commit()

def tripinventorydb():
     link = os.getenv('dbkey')
     conn = psycopg2.connect(link)
     curr = conn.cursor()
     curr.execute("CREATE TABLE IF NOT EXISTS travelitem(email VARCHAR, item VARCHAR, cost VARCHAR)")
     curr.execute("INSERT INTO travelitem(email, item) VALUES(%s, %s)", ('temp1@gmail.com', 'bag',), )
     curr.execute("INSERT INTO travelitem(email, item) VALUES(%s, %s)", ('temp1@gmail.com', 'books',), )
     curr.execute("INSERT INTO travelitem(email, item) VALUES(%s, %s)", ('temp1@gmail.com', 'shoes', ), )
     curr.execute("INSERT INTO travelitem(email, item) VALUES(%s, %s)", ('temp1@gmail.com', 'wallet', ), )
     conn.commit()


if __name__ == '__main__':
     tripinventorydb()
#     tripexpensedb()