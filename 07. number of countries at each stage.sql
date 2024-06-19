SELECT DISTINCT stage, 
		COUNT(company) AS total_companies
FROM     layoff_staging_2
GROUP BY stage
ORDER BY total_companies DESC