import sqlalchemy as sa
import pandas as pd
import psycopg2


try:

    conn=psycopg2.connect(
        database="covid",
        user="postgres",
        password="root",
        host="localhost",
        port="5432")
    # creating a cursor object
    cursor = conn.cursor()
    # drop table to be updated
    sql = ''' DROP TABLE IF EXISTS national_weekly_data'''
    # executing query
    cursor.execute(sql)
    # commit changes
    conn.commit()
    #closing connection
    conn.close()

except Exception as e:
    print(str('Drop table error', e))

try:

    # creating engine with parameters for connection with db
    engine = sa.create_engine('postgresql://postgres:root@localhost:5432/covid')

except Exception as e:
    print(str('Error connecting to database', e))

try:

    # loading datasets from url
    p = 'https://opendata.ecdc.europa.eu/covid19/nationalcasedeath/json'
    daily_covid_data = pd.read_json(p)

except Exception as e:
    print(str('Error loading datasets', e))

try:

    # writing the data from datasets into Postgres database
    daily_covid_data.to_sql('national_weekly_data', engine)

except Exception as e:
    print(str('Error writing to the db', e))
finally:
    print('Complete')

