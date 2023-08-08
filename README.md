# Data Archive - Average Global Consumption of Hydropower and Solar Energy Consumption By Country (2000 - 2020).
## Problem Description and Question?
Each country has a comparative advantage in the various sources of renewable energy. The question this project aims to answer is: what is the trend over the years in consumption of solar sourced energy consumption and hydro sourced energy consumption by country? In future analysis, we could analyze each country's preference between solar and hydro and make projections to draw a roadmap towards achieving global clean energy target. 
This Project covers the extraction, transformation and loading of the global consumption of hydropower and solar energy consumption into MySQL. The loaded data could be used in analyzing trends and deducing other insights to understand the acceptance of renewable energy over time by each country.

## Data Source
For the data sources to build the desired transformed table click on each item below:
### Dimension Table Sources
- [hydropower consumption](https://www.kaggle.com/datasets/programmerrdai/renewable-energy?select=hydropower-consumption.csv)
- [Population and Land Area](https://www.worldometers.info/geography/alphabetical-list-of-countries/)
- [Currency](https://sport-histoire.fr/en/Geography/Currencies_countries_of_the_world.php)
- [Continent](https://wisevoter.com/country-rankings/countries-by-continent/)
##### Some values not available in the above links were sourced in google.com to fill in the dimension table
### Fact Table
- [solar energy consumption](https://www.kaggle.com/datasets/programmerrdai/renewable-energy?select=solar-energy-consumption.csv)
  
#### Justification of Data Selection: 
- Climate change amongst others is one the bane of the world today. Increasing wild fires, extreme tempeatures and other climate related issues have become a growing concern. One of the proposed solution is a shift from hydrocarbons to new sources of clean energy. Hydropower and solar energy fall into the category of clean energy sources. Data from the energy consumption from these sources by different countries can serve as proxy of the adoption of this energy sources over the years by the countries. It will be useful in deducing insights and creating questions that could aid global transition. 
- Our Data set suits this purpose as its  structured and the availability of a common column (key) for joining the two tables. The data also has the numerical column for an aggregation to find the average country consumption between 2000 - 2020

## Steps followed for this project
The following steps are followed in this project
### Creating a Github Respository
I created a public gitub respository for this project titled data archive.
  
### Creating three folders
  - Readme file: This is the file you are reading, it explains the project, the data sources used, the steps followed and the outcomes.
  - Code files: You will find in this file, the scripts used in the extraction, transformation and loading (ETL) the data.
  - Data Samples or Snapshots: This file will include samples or snapshots of the dataset before and after a transformation.
    
### Data Selection:
I selected the hydropower-consumption and solar-energy consumption under the Renewable Energy dataset from Kaggle. I ensured they had a common attribute to enable join them and carry out a comparison.
  
### Data Extraction:
The below points shows the steps, issues and solutions encountered in the extraction phase
  - Downloaded the two csv data from kaggle.com and stored them into my local drive.
  - Upgraded my dimension table (hydropower consumption) to include continent, currency, population and landmass.
    
##### Issues encountered
    - Needed more columns in my dimension table and their values where from different sources; kaggle,wisevoter.com, sport-histoie.fr, worldometer and google.
    - Some countries values where not captured in my source base for instance the aruba is not captured in worldometers
    - The source of the fact sheet had some missing values such code and population for 'World', 'Europe', 'Africa' etc.
    - importing data with missing values into sql created an error and didnt upload the rows with missing data.
    - The first column of the dimension table imported with an unwanted prefix 'ï»¿Entity' instead of 'Entity'.
      
##### Issues resolution
    - Used power query conditional column to add new column and a delimeter (;) to seperate the desired output. Filled in a name for new column and the other required inputs. For example if column name; 'entity' operator: equals value: 'Afghanistan' then ouput:'Afghani Afghani'; 'Asia';'42239854';'Landmass'.
    - I then used the split column by delimeter under the transform tab to split the new columns into the four new columns and renamed them (currency, continent, population and landareakm2)
    - I filled the missing text column rows with 'NA' and the floats column rows with -1 ( this enabled me save my data in csv format and succesfully import all rows into sql)
    - I used the ALTER TABLE in mySQL to change it from 'ï»¿Entity' to the desired name.
      
##### Importing of data in mySQL
  - Opened my MySQL database
  - Created a Schema called Energy
  - Opened the table data import wizard under my schema
  - Browsed out the file path of where my data is stored on my local drive and clicked next at the bottom right of the screen
  - I selected the destination and clicked next at the bottom right of the screen to move to the configure import settings screen
  - On the configure Import settings screen, i ensured my field type for the various columns was expected before clicking next to move to the Import data screen
  - I clicked next to execute the importation of my data
  - After the completion, I refreshed the Schema under Navigator to confirm my table has been added under my schema
  - I repeated the process for importing the solar-energy consumption into my schema.
  - I ran a select * from the two tables to ensure they loaded. (This will show all the columns in the table and rows)
    
### Data Transformation: 
The following steps were carried out to perfrom quality checks on my data and to transform it into a view I can use for further analysis
  - I ensured both tables (hydropower_consumption_dim and solar-energy consumption) were comaptible for a join i.e identifying the column on which the join would be made are align.
  - There were some rows that were not needed in the data such as CIS, Eastern Africa and other non- country rows. They have a code of NA. So i dleted them using the delete syntax where code ="na". N.B for the delete syntax to work, I had to use the safe update mode (see code file for syntax).
  - I selected my columns (renamed them Country, Country_code using the 'AS' ) and average of both Electricity from hydro (TWh) and Electricity from solar(TWh), I created a join on the 'Entity' and 'Year' column and a  groupby hydropower_consumption_dim.Entity, solar_energy_consumption.`code`, hydropower_consumption_dim.Continent,  hydropower_consumption_dim.Currency, hydropower_consumption_dim.Population, hydropower_consumption_dim.`Landmass km2` (see syntax in the code files and before and after screenshots in the data Samples file).
 
### Data Loading
  - I used the CREATE VIEW hydro_solar_transformed AS SELECT ... to creat a view called hydro_solar_transformed from the new joined table (see syntax in code file)
  - My data was finally transformed and succesfully loaded into MySQL database.
  
## Outcome
I succesfully created a table with the country, country code, average hydro consumption and average solar energy consumption for further analysis loaded into MySQL database.

## Reflection
This project guides me through the steps of extracting datasets into MySQL, tranforming them into a desired form using join and groupby, creating a new table of the transformed data and loading it in MySQL database. With fewer codes in python I could have achieved the same goal of extraction and transforming before loading it into MySQL but its a matter of requirement. 
