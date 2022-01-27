{{ config(
  materialized = 'table'
)}}

select location, substring((to_date(date)),0,7) as year_month,
max(population) as total_population,
sum(new_cases) as total_cases, 
sum(new_deaths) as total_deaths, 
sum(new_recovered) as total_recovered
from "FIVETRAN_INTERVIEW_DB"."GOOGLE_SHEETS"."COVID_19_INDONESIA_VENKATA_KARTHIK_DINTAKURTHI"
group by location,year_month