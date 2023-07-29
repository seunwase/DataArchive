# DataArchive
## Project Description
This Project covers the analysis of the consumption of hydropower  and wind energy. It will analyze the trend and try to undertand the acceptance of renewable energy over time.

## Data Source
The data will be sourced from kaggle


## STEPS
The following steps was followed in this project
- Creating a Github Respository
  
- Creating three folders
  - Readme file: This is the file you are reading, it explains the project, the data sources used, the steps followed and the outcomes.
  - Code files: You will find in this file, the scripts used in the extraction, transformation and loading (ETL) the data.
  - Data Samples or Snapshots: This file will include samples or snapshots of the dataset before and after a transformation.
    
- Data Selection: I selected the hydropower-consumption and solar-energy consumption. I ensured they had a common attribute to enable join them and carry out a comparison.
  
- Data Extraction: I extracted the data from kaggle Renewable Energy by
  - Downloading the two csv data into my local drive.
  - Opened my MySQL database
  - Created a Schema called Energy
  - Opened the table data import wizard under my schema
  - Browsed out the file path of where my data is stored on my local drive and clicked next at the bottom right of the screen
  - I selected the destination and clicked next at the bottom right of the screen to move to the configure import settings screen
  - On the configure Import settings screen, i ensured my field type for the various columns was expected changing the Electricity from hydro (TWh) to int. before clicking next to move to the Import data screen
  - I clicked next to execute the importation of my data
  - After the completion, I refreshed the Schema under Navigator to confirm my table has been added under my schema
  - I repeated the process for importing the solar-energy consumption into my schema.
  - I ran a select * from the two tables to ensure they loaded. (This will show all the colums in the table and rows)
    
- Data Transformation: The following steps were carried out to perfrom quality checks on my data and to transform it into a view i can use for further analysis
  - I ensured both tables (hydropower-consumption and solar-energy consumption) were comaptible for a join i.e identifying the column on which the join would be made are align.
  - I selected my columns (renamed them Country, Country_code using the 'AS' ) and average of both Electricity from hydro (TWh) and Electricity from solar, created a join on the 'code' column and a  groupby 'Country' and 'Code' (see syntax in the code files and before and after screenshots in the data Samples file).
 
- Data Loading
  - I created a new table called hydro_solar_consumption from the joined table (see syntax in code file)
  - I noticed some null values in my table under the country_code which is attributed to continents not having a Country_code, I didnt need this rows with null 
  - I deleted the rows with null (see syntax in code file and before and after screen shots)
  - My data was finally transformed and succesfully loaded into MySQL database.
 
  
## OUTCOMES
I succesfully created a table with the country, country code, average hydro consumption and average solar energy consumption for further analysis loaded into MySQL database.

## REFLECTION
This project guides me throught the steps of extracting datasets into MySQL, tranforming them into a desired form using join and groupby, creating a new table of the transformed data and loading it in MySQL database. With fewer codes in python I could have achieved the same goal of extraction and transforming before loading it into MySQL but its a matter of requirement. 
