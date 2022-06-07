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

-- 3: Create a View
CREATE VIEW exercise3 AS
    SELECT cotw.*, v.max
        FROM countries_of_the_world cotw, updated2 v
            WHERE cotw.country_name = v.country











            






                
                
