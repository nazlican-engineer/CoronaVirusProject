select *from CovidDeaths
order by 3,4 --Önce 3.sütuna göre eşitlik varsa 4.sütuna göre yap

select *from CovidVaccinations
order by 3,4 --Önce 3.sütuna göre eşitlik varsa 4.sütuna göre yap

--Select Data that we are going to be using
select Location,date,total_cases,new_cases,total_deaths,population from CovidDeaths
order by 1,2

--Looking at Total Cases vs Total Deaths
select location,date,total_cases,total_deaths,(total_deaths/total_cases)*100 as DeathPercentage from CovidDeaths
where location like '%states%'
order by 1,2 

-- Countries with the highest infection rate compared with population
select Location,
	   Population,
	   max(total_cases) as HighestInfectionCount,
	   max((total_cases / nullif(Population, 0)) * 100) as PercentPopulationInfected
from CovidDeaths
where continent is not null
group by Location, Population
order by PercentPopulationInfected desc

-- Total deaths by country
select Location,
	   max(cast(total_deaths as bigint)) as TotalDeathCount
from CovidDeaths
where continent is not null
group by Location
order by TotalDeathCount desc