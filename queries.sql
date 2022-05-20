SELECT * FROM national_weekly_data
SELECT * FROM countries_of_the_world


-- for white spaces in column 'country_name' and 'region'
UPDATE countries_of_the_world
    SET country_name  = TRIM(REPLACE(REPLACE(REPLACE(country_name, E'\v', ''), E'\n', ''), E'\r', ''))
    
UPDATE countries_of_the_world
    SET region  = TRIM(REPLACE(REPLACE(REPLACE(region, E'\v', ''), E'\n', ''), E'\r', ''))

--1 What is the country with the highest number of Covid-19 cases per 100 000 Habitants at 31/07/2020?
           
SELECT country, rate_14_day
    FROM national_weekly_data
        WHERE year_week='2020-31'
            AND indicator='cases'
                ORDER BY rate_14_day DESC

--2 What is the top 10 countries with the lowest number of Covid-19 cases per 100 000 Habitants at 31/07/2020?
SELECT country, rate_14_day 
    FROM national_weekly_data
        WHERE year_week='2020-31'
            AND indicator='cases'
                ORDER BY rate_14_day ASC
                
--3 What is the top 10 countries with the highest number of cases among the top 20 richest countries (by GDP per capita)?
CREATE VIEW updated AS
    SELECT country, MAX(cumulative_count) FROM national_weekly_data
        WHERE indicator='cases'
            GROUP BY country
            
CREATE VIEW top20gdp AS          
    SELECT v.country, v.max, cotw."GDP ($ per capita)" 
        FROM updated v, countries_of_the_world cotw
            WHERE v.country = cotw.country_name
                ORDER BY "GDP ($ per capita)" DESC
                    LIMIT 20
               
SELECT * FROM top20gdp
    ORDER BY max DESC
        LIMIT 10          

--4 List all the regions with the number of cases per million of inhabitants and display information on population density, for 31/07/2020.
SELECT v.country, v.max, nwd.year_week, cotw."Pop. Density (per sq. mi.)"
    FROM updated v, countries_of_the_world cotw, national_weekly_data nwd
        WHERE nwd.year_week = '2020-31'
            AND v.country = cotw.country_name

SELECT continent, MAX(cumulative_count) FROM national_weekly_data
    WHERE indicator='cases'
        GROUP BY continent


--Exercise 3: Create a View
CREATE VIEW exercise3 AS
    SELECT cotw.*, v.max
        FROM countries_of_the_world cotw, updated2 v
            WHERE cotw.country_name = v.country











            






                
                
