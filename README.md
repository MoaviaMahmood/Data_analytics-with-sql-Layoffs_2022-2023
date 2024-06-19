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
ORDER BY total_laid_off DESC;
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
ORDER BY total_layoffs DESC;
```
![04](https://github.com/MoaviaMahmood/SQL_Data_Analytics_of_Independence-days-of-countries/assets/168455506/11dd1e7a-0c33-40a8-91cd-518fd7d2e3f4)

## Companies have the highest percentage of employees laid off
```sql
SELECT top 10
       company,
       percentage_laid_off
FROM layoff_staging_2
ORDER BY percentage_laid_off DESC;
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

## Layoff per industry
```sql
SELECT 
    industry, 
    SUM(total_laid_off) AS total_laid_off
FROM 
    layoff_staging_2
GROUP BY 
    industry
ORDER BY 
    total_laid_off DESC;
```
![09](https://github.com/MoaviaMahmood/SQL_Data_Analytics_of_Independence-days-of-countries/assets/168455506/f3b01ec3-2148-4b3d-8fb4-72d23a53f4ec)

## What are the stages in the layoff process
```sql
SELECT DISTINCT stage, 
	COUNT(company) AS total_companies
FROM layoff_staging_2
where stage not like 'unknown'
GROUP BY stage
ORDER BY total_companies DESC;
```
![07](https://github.com/MoaviaMahmood/SQL_Data_Analytics_of_Independence-days-of-countries/assets/168455506/2efc0676-4a08-4f92-8a92-749d417b5f6b)

## Which companies have experienced the highest percentage of layoffs relative to their funds raised
```sql
SELECT top 10
    company, 
    total_laid_off, 
    round(percentage_laid_off,2) as percent_layoffs, 
    funds_raised_millions
FROM 
    layoff_staging_2
WHERE 
	total_laid_off is not null
	and percentage_laid_off is not null
	and funds_raised_millions is not null
ORDER BY 
    funds_raised_millions DESC;
```
![06](https://github.com/MoaviaMahmood/SQL_Data_Analytics_of_Independence-days-of-countries/assets/168455506/39c8ca4a-d9ef-4eb9-ab69-d0ddef4dcd07)

## Total Layoffs Per month
```sql
WITH MonthlyLayoffs AS (
    SELECT 
        DATENAME(MONTH, date) AS Months,
        SUM(Total_Laid_Off) AS Total_Laid_Off
    FROM 
        layoff_staging_2
    WHERE 
        Total_Laid_Off IS NOT NULL
    GROUP BY 
        DATENAME(MONTH, date)
)
SELECT 
    Months, 
    Total_Laid_Off
FROM 
    MonthlyLayoffs
ORDER BY 
    Total_Laid_Off DESC;
```

![03](https://github.com/MoaviaMahmood/SQL_Data_Analytics_of_Independence-days-of-countries/assets/168455506/cb179435-6154-4aa5-8fd5-4d93e6920ee2)

## Top company in each industry with the highest number of layoffs
```sql
WITH RankedLayoffs AS (
    SELECT 
        Company, 
        Industry, 
        Total_Laid_Off,
        ROW_NUMBER() OVER (PARTITION BY Industry ORDER BY Total_Laid_Off DESC) AS Rank
    FROM 
        layoff_staging_2
    WHERE 
        Total_Laid_Off IS NOT NULL
)
SELECT 
    Company, 
    Industry, 
    Total_Laid_Off
FROM 
    RankedLayoffs
WHERE 
    Rank <= 1
ORDER BY 
    Industry, 
    Rank;
```
![02](https://github.com/MoaviaMahmood/SQL_Data_Analytics_of_Independence-days-of-countries/assets/168455506/10b9fdd4-beb6-4a71-8af3-f72535ad306f)
