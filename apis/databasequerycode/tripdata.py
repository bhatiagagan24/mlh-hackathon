
# used for querying the trip data by the api
import psycopg2
import os




# for fetching all the trip expense data
def querytripexpensedata(email):
     try:
        link = os.environ['dbkey']
        conn = psycopg2.connect(link)        
        curr = conn.cursor()
        #  (email, item, cost)
        curr.execute(''' SELECT * from travel WHERE email = %s''', (str(email), ) , )
        keyFound = curr.fetchall()
        items = []
        cost = []
        for t in keyFound:
            # print(t)
            items.append(t[1])
            cost.append(t[2])
        return [items, cost]
     except:
         return -1

def deletetripexpensedata(email, itemname, price):
     try:
        link = os.environ['dbkey']
        conn = psycopg2.connect(link)        
        curr = conn.cursor()
        curr.execute('''DELETE FROM travel WHERE email = %s AND item = %s AND cost = %s''', (email, itemname, price, ),)
        conn.commit()
        print('item deleted')
        return 1
     except:
         print("error occured")
         return -1

def inserttripexpensedata(email, itemname, price):
     try:
        link = os.environ['dbkey']
        conn = psycopg2.connect(link)
        curr = conn.cursor()
        curr.execute('''INSERT INTO travel(email, item, cost) VALUES (%s, %s, %s)''', (email, itemname, price, ),)
        conn.commit()
        print('item inserted')
        return 1
     except:
         print("error occured")
         return -1


# deletetripexpensedata('temp1@gmail.com', 'coffee', '100')


# if __name__ == '__main__':
#     querytripexpensedata('temp1@gmail.com')