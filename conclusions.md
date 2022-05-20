# Conclusions
<p>This project contains the follow documents:

- load.py: Python script with loading code of datasets “countries of the world.csv” and download.json

- pipeline.py: Python script with loading code of dataset “data-national-14-day-notification-rate-covid-19. This script creates a table on PostgreSQL database (or drop the table if already exists) with the daily/weekly updated data of url.

Note: as I'm not comfortable with specific pipeline automation tools I developed a Python crontab script to run the pipeline.py file daily. I preferred to leave the file out of the project package as it looks unprofessional.

- queries.ipynb: some queries and data transform using Pandas and PySpark on Jupyter Notebook

- queries.sql: queries with results of some questions

- conclusions.md: this file with the conclusions

# Questions
Note1: some questions were left unanswered. I decided to send them like this afraid to compromise the deadline

Note2: I had trouble finding the requested date. So I used the “year_week” column to find the week of requested date and found the 31st week of July to perform the queries.

1  - **What is the country with the highest number of Covid-19 cases per 100 000 Habitants at 31/07/2020?**

*In this query I found Panama with a total about of 324/100k cases until the 31st week of July.*

2 - **What is the top 10 countries with the lowest number of Covid-19 cases per 100 000 Habitants at 31/07/2020?**

*1- Laos, 0.013*

*2- Myanmar, 0.022*

*3- Mauritius, 0.078*

*4- Taiwan, 0.083*

*5- Thailand, 0.1*

*6- Fiji, 0.111*

*7- China, 0.164*

*8- Niger, 0.177*

*9- Mongolia, 0.183*

*10- Vietnam, 0.254*

	This result show China in 7th place with lowest cases. The country where the pandemic began reached this period with a low number of cases.

3- **What is the top 10 countries with the highest number of cases among the top 20 richest
countries (by GDP per capita)?**

*1- France, 28967440*

*2- Germany, 25347256*

*3- United Kingdom, 22127666*

*4- Japan, 8082469*

*5- Netherlands, 8060411*

*6- Australia, 6165105*

*7- Austria, 4289089*

*8- Belgium, 4095446*

*9- Canada, 3792836*

*10- Switzerland, 3631881*