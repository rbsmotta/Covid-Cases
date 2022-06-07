import sqlalchemy as sa
import pandas as pd

def load():

    try:
        # creating engine with parameters for connection with db
        engine = sa.create_engine('postgresql://postgres:root@localhost:5432/covid')
    except Exception as e:
        print(str('Error connecting to database', e))

    try:
        # loading datasets from files
        covid_data = pd.read_json('data/download.json')
        countries = pd.read_csv('data/countries of the world.csv')
    except Exception as e:
        print(str('Error loading datasets'))

    try:
        # writing the data from datasets into Postgres database
        covid_data.to_sql('national_weekly_data', engine)
        countries.to_sql('countries_of_the_world', engine)
    except Exception as e:
        print(str('Error writing to the db'))

    finally:
        print('Complete')

load()








