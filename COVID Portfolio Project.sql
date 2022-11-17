Select * From PortfolioProject ..CovidDeaths
order by 3,4

Select * 
From PortfolioProject..CovidDeaths

Select * 
From PortfolioProject..CovidVaccinations



-- Data i will be using 
Select Location,continent, date, total_cases, new_cases, total_deaths, population
From PortfolioProject ..CovidDeaths
order by 1,2


-- this shows what percentage of population got covid 
Select Location, date, total_cases, population, (total_cases/ population) * 100 as InfectedPercentage
From PortfolioProject ..CovidDeaths
Where location like '%Kingdom%'
order by 1,2

-- this show the country with the highest infection rates 
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

-- joining CovidDeaths table with CovidVaccinations table 
Select * 
From PortfolioProject..CovidDeaths as dea
join PortfolioProject..CovidVaccinations as vac
on dea.location = vac.location
and dea.date = vac.date

-- this shows the total number of cases by continent 
Select continent, max (cast(total_cases as int)) as TotalCasesCount
from PortfolioProject ..CovidDeaths
where continent is not null 
Group by continent
order by TotalCasesCount desc

-- this shows the total new cases by continent 
Select continent, max (cast(new_cases as int)) as NewCasesCount
from PortfolioProject ..CovidDeaths
where continent is not null 
Group by continent
order by NewCasesCount desc

