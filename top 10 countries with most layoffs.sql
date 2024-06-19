SELECT top 10
		country, 
		SUM(total_laid_off) AS total_layoffs
FROM layoff_staging_2
WHERE total_laid_off IS NOT NULL
GROUP BY country
ORDER BY total_layoffs DESC