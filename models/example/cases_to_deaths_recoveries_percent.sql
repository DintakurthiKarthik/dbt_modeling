{{ config(
  materialized = 'table'
)}}

with cases_recoveries_deaths_percent as 
(
select location, 
max(population) as total_population,
sum(new_cases) as total_cases, 
sum(new_deaths) as total_deaths, 
sum(new_recovered) as total_recovered
from "FIVETRAN_INTERVIEW_DB"."GOOGLE_SHEETS"."COVID_19_INDONESIA_VENKATA_KARTHIK_DINTAKURTHI"
where location is not null
group by location
)
  
select *, (total_deaths/total_cases)*100 as percent_deceased_cases, 
(total_recovered/total_cases)*100 as percent_recovered_cases 
from cases_recoveries_deaths_percent