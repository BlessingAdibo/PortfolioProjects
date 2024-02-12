
Select *
From PortfolioProject..CovidDeaths
where continent is not null
Order By 3,4

--Select *
--From PortfolioProject..CovidVaccination
--Order By 3,4

--Select Data that we are going to be using

Select Location, date, total_cases, new_cases, total_deaths, population
From PortfolioProject..CovidDeaths
order by 1,2

--Looking at Total Cases vs Total Deaths

Select Location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
From PortfolioProject..CovidDeaths
where location like '%states%'
order by 1,2

--Looking at Total Cases vs Population
--Shows what percentage of population got covid

Select Location, date, population, total_cases, (total_cases/population)*100 as PercentPopulationInfected
From PortfolioProject..CovidDeaths
--where location like '%Nigeria%'
order by 1,2

--Looking at Countries with highest infection rate compared to Population

Select Location, population, MAX(total_cases) as HighestInfectionCount, MAX((total_cases/population))*100 as PercentPopulationInfected
From PortfolioProject..CovidDeaths
--where location like '%Nigeria%'
Group By location, population
order by PercentPopulationInfected desc


--Showing Countries with Highest Death Count per Population

Select Location, MAX(cast(Total_deaths as int)) as TotalDeathCount
From PortfolioProject..CovidDeaths
--where location like '%Nigeria%'
where continent is not null
Group By location
order by TotalDeathCount desc


--LET'S BREAK THINGS DOWN BY location

Select location, MAX(cast(Total_deaths as int)) as TotalDeathCount
From PortfolioProject..CovidDeaths
--where location like '%Nigeria%'
where continent is null
Group By location
order by TotalDeathCount desc


--LET'S BREAK THINGS DOWN BY continent

Select continent, MAX(cast(Total_deaths as int)) as TotalDeathCount
From PortfolioProject..CovidDeaths
--where location like '%Nigeria%'
where continent is not null
Group By continent
order by TotalDeathCount desc


--Showing the continents with the highest DEATH Count per population

Select continent, MAX(cast(Total_deaths as int)) as TotalDeathCount
From PortfolioProject..CovidDeaths
--where location like '%Nigeria%'
where continent is not null
Group By continent
order by TotalDeathCount desc


--Looking at Total Population vs Vaccination
Drop Table if exists Vaccination
Select dea.continent, dea.location, dea.date, dea.population
From PortfolioProject..CovidDeaths dea
Join PortfolioProject..CovidVaccination vac
	On dea.location = vac.location
	and dea.date = vac.date

