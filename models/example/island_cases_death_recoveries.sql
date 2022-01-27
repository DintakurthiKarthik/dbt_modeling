{{ config(
  materialized = 'table'
)}}

with island_cases as 
(
select island, max(population) as total_population,
sum(new_cases) as total_cases, 
sum(new_deaths) as total_deaths, 
sum(new_recovered) as total_recovered
from "FIVETRAN_INTERVIEW_DB"."GOOGLE_SHEETS"."COVID_19_INDONESIA_VENKATA_KARTHIK_DINTAKURTHI"
where island is not null
group by island
)
  
select *, (total_cases/total_population)*100 as percent_infected, 
(total_deaths/total_population)*100 as percent_deceased, 
(total_recovered/total_population)*100 as percent_recovered 
from island_cases