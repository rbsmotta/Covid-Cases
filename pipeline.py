import sqlalchemy as sa
import pandas as pd

def pipeline():

        try:
            # creating engine with parameters for connection with db
            engine = sa.create_engine('postgresql://postgres:root@localhost:5432/covid')
        except Exception as e:
            print(str('Error connecting to database', e))

        try:
            # loading datasets from url
            path_url = 'https://opendata.ecdc.europa.eu/covid19/nationalcasedeath/json'
            daily_covid_data = pd.read_json(path_url)
        except Exception as e:
            print(str('Error loading datasets', e))

        try:
            # writing the data from datasets into Postgres database
            daily_covid_data.to_sql('national_weekly_data', engine)
        except Exception as e:
            print(str('Error writing to the db', e))

        finally:
            print('Complete')

pipeline()