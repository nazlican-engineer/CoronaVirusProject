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

-- Total death count by continent/region
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

--Identify the top 10 countries with a population of at least 10 million that have the highest rates of COVID-19 cases.
select top 10 location,population ,max(total_cases) as MaxTotalCase ,max(total_cases/population)*100 as PercentPopulationInfected from CovidDeaths
where population>10000000
and continent is not null
group by location,population
order by PercentPopulationInfected desc

--Among countries with a population of over 20 million, identify the five countries with the highest total number of deaths.
SELECT TOP 5
    location,
    population,
    MAX(CONVERT(int, total_deaths)) AS MaxDeaths,
    MAX(CONVERT(float, total_deaths) / population) * 100 AS DeathPopulationPercentage
FROM CovidDeaths
WHERE population > 20000000
  AND continent IS NOT NULL
GROUP BY location, population
ORDER BY MaxDeaths DESC;

--How did the cases change after vaccination?
SELECT
    dea.location,
    dea.date,
    dea.population,
    dea.new_cases,
    dea.new_deaths,
    vac.new_vaccinations
FROM CovidDeaths dea
JOIN CovidVaccinations vac
    ON dea.location = vac.location
   AND dea.date = vac.date
WHERE dea.continent IS NOT NULL
ORDER BY dea.location, dea.date;


SELECT
    dea.location,
    dea.date,
    dea.population,
    dea.new_cases,
    dea.new_deaths,
    vac.new_vaccinations,

    SUM(CONVERT(float, vac.new_vaccinations))
    OVER (
        PARTITION BY dea.location
        ORDER BY dea.date
    ) AS RollingVaccinations

FROM CovidDeaths dea
JOIN CovidVaccinations vac
    ON dea.location = vac.location
   AND dea.date = vac.date
WHERE dea.continent IS NOT NULL
ORDER BY dea.location, dea.date;

