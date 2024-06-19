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
