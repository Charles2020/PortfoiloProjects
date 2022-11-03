Select * From PortfolioProject ..CovidDeaths
order by 3,4


--Select * 
-- From PortfolioProject ..CovidVaccinations
--order by 3,4

-- Data i will be using 
Select Location, date, total_cases, new_cases, total_deaths, population
From PortfolioProject ..CovidDeaths
order by 1,2

-- Looking at the total cases vs total deaths
-- This shows the likehood of dying if you contract covid in your country 
Select Location, date, total_cases, total_deaths, (total_deaths/total_cases) * 100 as DeathPercentage
From PortfolioProject ..CovidDeaths
Where location like '%Kingdom%'
order by 1,2

-- Looking at the total cases vs population
-- this shows what percentage of population got covid 
Select Location, date, total_cases, population, (total_cases/ population) * 100 as InfectedPercentage
From PortfolioProject ..CovidDeaths
Where location like '%Kingdom%'
order by 1,2

-- this show the country with the highest infection rates compared to population in the UK
Select Location, population, MAX(total_cases) as HighestInfectionCount, Max((total_cases/population)) * 100 as PercentPopulationInfected
From PortfolioProject ..CovidDeaths
 Where location like '%Kingdom%'
Group by population, location 
order by PercentPopulationInfected desc

-- this shows the countries highest death count per population 
Select Location total_deaths, MAX(total_deaths) as HighestdeathCount
From PortfolioProject ..CovidDeaths
Where continent is not null 
 --Where location like '%Kingdom%'
Group by population, location 
order by HighestdeathCount desc


--- this shows the continent with the highest death counts per population 

Select continent, max (cast(total_deaths as int)) as TotalDeathCount
from PortfolioProject ..CovidDeaths
where continent is not null 
Group by continent
order by TotalDeathCount desc

-- Global numbers
Select date, total_cases, total_deaths, (total_deaths/total_cases) * 100 as DeathPercentage
From PortfolioProject ..CovidDeaths
where continent is not null
--Where location like '%Kingdom%'
order by 1,2

Select * 
From PortfolioProject..CovidDeaths as dea
join PortfolioProject..CovidVaccinations as vac
on dea.location = vac.location
and dea.date = vac.date