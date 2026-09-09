select *from CovidDeaths
order by 3,4 --Önce 3.sütuna göre eşitlik varsa 4.sütuna göre yap

select *from CovidVaccinations
order by 3,4 --Önce 3.sütuna göre eşitlik varsa 4.sütuna göre yap

--Select Data that we are going to be using
select Location,date,total_cases,new_cases,total_deaths,population from CovidDeaths
order by 1,2

--Looking at Total Cases vs Total Deaths
select location,date,total_cases,total_deaths,(total_deaths/total_cases)*100 as DeathPercentage from CovidDeaths
where location like '%states%' and
continent is not null
order by 1,2

--Looking at Total Cases vs Total Deaths
select location,date,Population,total_cases,(total_cases/population)*100 as TotalCasesPercentage from CovidDeaths
where location like '%Afghanistan%' and 
continent is not null
order by 1,2

--Looking at Countries with Highest Infection Rate compared to Population
select location,Population,max(total_cases) as HighestInfectionCount,max((total_cases/population))*100 as PercentPopulationInfected from CovidDeaths
group by location,population
order by PercentPopulationInfected desc

-- Showing Countries with Highest Death Count per Population
select location,MAX(cast(total_deaths as int)) as TotalDeathCount 
from CovidDeaths
where continent is not null
group by Location
order by TotalDeathCount desc

--death rate by continent
select location,max(cast(total_deaths as int)) as TotalDeathContinent
from CovidDeaths
where continent is  null
group by location 
order by TotalDeathContinent desc

--Global Number
select sum(new_cases) as total_cases,sum(cast(new_deaths as int)) as total_deaths,
sum(cast(new_deaths as int))/sum(new_cases)*100 as DeathPercentage
from CovidDeaths
where continent is not null

