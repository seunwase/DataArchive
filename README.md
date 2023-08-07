# Data Archive - Average Global Consumption of Hydropower and Solar Energy Consumption By Country (2000 - 2020).
## Problem Description and Question?
Each country has a comparative advantage in the various sources of renewable energy. This project aims to answer what is the trend over the years in consumption of solar sourced energy consumption and hydro sourced energy consumption by country? In future analysis, we could analyze each country's preference between solar and hydro and make projections to draw a roadmap towards achieving global clean energy target. 
This Project covers the extraction, transformation and loading of the global consumption of hydropower and solar energy consumption into MySQL. The loaded data could be used in analyzing trends and deducing other insights to understand the acceptance of renewable energy over time by each country.

## Data Source
The data will be sourced from kaggle, wisevoter.com, sport-historie.fr, worldometer and google.com.
### Dimension Table
- hydropower-consumption will be sourced from kaggle.com while other details to complete the dimension table will be gotten from other sources. The hydro consumption will be sourced from kaggle, the value of the currency from sport-historie.fr, countrys continent column was sourced from wisevoter.com, while the population and landmass of each country was sourced from worldometer. Other sources include google search for some countries landmass and population.
### Fact Table
- Our Fact table which contains data on solar energy consumption was sourced on kaggle.com

#### Justification of Data Selection: 
- Climate change amongst others is one the bane of the world today, with wild fires, extreme tempeatures and other vices, one of the proposed solution is a shift from hydrocarbons to new sources of clean energy. hydropower and solar energy fall into this category. Data from the consumption which can reflect the adoption of this energy sources over the years will be useful in deducing insights and creating questions that could aid global transition. 
- Our Data set suits this purpose as its  structured and the availability of a common column (key) for joining the two tables. The data also has the numerical column for an aggregation to find the average country consumption between 2000 - 2020

## Steps followed for this project
The following steps was followed in this project
- Creating a Github Respository
  
- Creating three folders
  - Readme file: This is the file you are reading, it explains the project, the data sources used, the steps followed and the outcomes.
  - Code files: You will find in this file, the scripts used in the extraction, transformation and loading (ETL) the data.
  - Data Samples or Snapshots: This file will include samples or snapshots of the dataset before and after a transformation.
    
- Data Selection: I selected the hydropower-consumption and solar-energy consumption. I ensured they had a common attribute to enable join them and carry out a comparison.
  
- Data Extraction: I extracted the data from kaggle Renewable Energy by
  - Downloading the two csv data into my local drive.
  - Upgraded my dimension table (hydropower consumption) to include continent, currency, population and landmass.
  - Opened my MySQL database
  - Created a Schema called Energy
  - Opened the table data import wizard under my schema
  - Browsed out the file path of where my data is stored on my local drive and clicked next at the bottom right of the screen
  - I selected the destination and clicked next at the bottom right of the screen to move to the configure import settings screen
  - On the configure Import settings screen, i ensured my field type for the various columns was expected before clicking next to move to the Import data screen
  - I clicked next to execute the importation of my data
  - After the completion, I refreshed the Schema under Navigator to confirm my table has been added under my schema
  - I repeated the process for importing the solar-energy consumption into my schema.
  - I ran a select * from the two tables to ensure they loaded. (This will show all the colums in the table and rows)
    
- Data Transformation: The following steps were carried out to perfrom quality checks on my data and to transform it into a view I can use for further analysis
  - I ensured both tables (hydropower-consumption and solar-energy consumption) were comaptible for a join i.e identifying the column on which the join would be made are align.
  - I selected my columns (renamed them Country, Country_code using the 'AS' ) and average of both Electricity from hydro (TWh) and Electricity from solar(TWh), I created a join on the 'code' and 'year' column and a  groupby 'Country' and 'Code' (see syntax in the code files and before and after screenshots in the data Samples file).
 
- Data Loading
  - I created a new table called hydro_solar_consumption from the joined table (see syntax in code file)
  - I noticed some null values in my table under the country_code which is attributed to continents not having a Country_code, I didnt need this rows with null 
  - I deleted the rows with null (see syntax in code file and before and after screen shots)
  - My data was finally transformed and succesfully loaded into MySQL database.
  
## Outcome
I succesfully created a table with the country, country code, average hydro consumption and average solar energy consumption for further analysis loaded into MySQL database.

## Reflection
This project guides me throught the steps of extracting datasets into MySQL, tranforming them into a desired form using join and groupby, creating a new table of the transformed data and loading it in MySQL database. With fewer codes in python I could have achieved the same goal of extraction and transforming before loading it into MySQL but its a matter of requirement. 
