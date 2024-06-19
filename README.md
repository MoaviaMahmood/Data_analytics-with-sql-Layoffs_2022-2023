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

## Top 10 companies with the highest number of layoffs
```sql
SELECT TOP (10) 
   company, 
   total_laid_off
FROM layoff_staging_2
ORDER BY total_laid_off DESC
```
![01](https://github.com/MoaviaMahmood/SQL_Data_Analytics_of_Independence-days-of-countries/assets/168455506/fa707a8d-b342-4c2c-9226-204991d3fa41)

## Countries have the highest total number of layoffs
```sql
SELECT top 10
		country, 
		SUM(total_laid_off) AS total_layoffs
FROM layoff_staging_2
WHERE total_laid_off IS NOT NULL
GROUP BY country
ORDER BY total_layoffs DESC
```
![04](https://github.com/MoaviaMahmood/SQL_Data_Analytics_of_Independence-days-of-countries/assets/168455506/11dd1e7a-0c33-40a8-91cd-518fd7d2e3f4)

## Companies have the highest percentage of employees laid off
```sql
SELECT top 10
       company,
       percentage_laid_off
FROM layoff_staging_2
ORDER BY percentage_laid_off DESC
```
![05](https://github.com/MoaviaMahmood/SQL_Data_Analytics_of_Independence-days-of-countries/assets/168455506/60b893e5-6cbe-4b35-b986-83af5d434b6a)
   
## Total layoff per stage
```sql
SELECT stage,
   SUM(total_laid_off) AS total_laid_off
FROM layoff_staging_2
GROUP BY stage
ORDER BY total_laid_off DESC;
```
![08](https://github.com/MoaviaMahmood/SQL_Data_Analytics_of_Independence-days-of-countries/assets/168455506/a156e793-ce5b-4bb0-8129-23dda2330c3c)


