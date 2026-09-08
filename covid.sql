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

--Looking at Total Cases vs Total Deaths
select location,date,Population,total_cases,(total_cases/population)*100 as TotalCasesPercentage from CovidDeaths
where location like '%Afghanistan%'
order by 1,2

--Looking at Countries with Highest Infection Rate compared to Population
select location,Population,max(total_cases) as HighestInfectionCount,max((total_cases/population))*100 as PercentPopulationInfected from CovidDeaths
group by location,population
order by PercentPopulationInfected desc