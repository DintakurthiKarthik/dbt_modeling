{{ config(
  materialized = 'table'
)}}

select location, last_day(to_date(date)) as week_date,
max(population) as total_population,
sum(new_cases) as total_cases, 
sum(new_deaths) as total_deaths, 
sum(new_recovered) as total_recovered
from "FIVETRAN_INTERVIEW_DB"."GOOGLE_SHEETS"."COVID_19_INDONESIA_VENKATA_KARTHIK_DINTAKURTHI"
group by location,week_date
