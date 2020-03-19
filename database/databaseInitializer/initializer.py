import os
import time

from tqdm import tqdm
import psycopg2


time.sleep(10)  #wait for DB to be fully up

print("Starting initializer")
## Connect to DB
connection = psycopg2.connect(user = "postgres",
                                password = "postgres",
                                host = "localhost", 
                                port = "5432",
                                database = "testdb")
print("Connection to DB Established successfully")
cursor = connection.cursor()

## Create schema
with open("init.sql", "r") as f:
    cursor.execute(f.read())
    connection.commit() 
print("Schema created successfully")

with open('data/cgi.csv', 'r') as f:
    next(f) # Skip the header row.
    cursor.copy_from(f, 'cgi', sep=',')
print(">> cgi table imported")

with open('data/genes.csv', 'r') as f:
    next(f) # Skip the header row.
    cursor.copy_from(f, 'genes', sep=',')
print(">> genes table imported")

with open('data/repeats.csv', 'r') as f:
    next(f) # Skip the header row.
    cursor.copy_from(f, 'repeats', sep=',')
print(">> repeat table imported")

with open('data/snp.csv', 'r') as f:
    next(f) # Skip the header row.
    cursor.copy_from(f, 'snp', sep=',')
print(">> snp table imported")
connection.commit()

with open('data/hm450k.csv', 'r') as f:
    next(f) # Skip the header row.
    cursor.copy_from(f, 'hm450k', sep=',')
print(">> hm450k table imported")
connection.commit()

with open('data/hm850k.csv', 'r') as f:
    next(f) # Skip the header row.
    cursor.copy_from(f, 'hm850k', sep=',')
print(">> hm850k table imported")
connection.commit()



print("Data migration completed\nStarting optimization")
with open("cluisterOptimization.sql", "r") as f:
    cursor.execute(f.read())
    connection.commit() 
print("Optimization completed")


cursor.close()
connection.close()

