# Data Analytics of Layoffs between 2022-2023

## Overview

The data in this repository is intended for use in understanding trends in company layoffs, performing data analysis, and generating reports.

## Dataset Description
The dataset contains the following columns:
1. Company Name
2. Location(city)
3. Industry Type
4. Total Layoff
5. Percentage Layoffs
6. Stage of Funding
7. Country
8. Funds Raised in Millions

# Data Analysis

## Top 10 Companies had the highest number of layoffs
```sql
SELECT TOP (10) 
   company, 
   total_laid_off
FROM layoff_staging_2
ORDER BY total_laid_off DESC
```
![01](https://github.com/MoaviaMahmood/SQL_Data_Analytics_of_Independence-days-of-countries/assets/168455506/fa707a8d-b342-4c2c-9226-204991d3fa41)


   



