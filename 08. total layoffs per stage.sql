SELECT stage, SUM(total_laid_off) AS total_laid_off
FROM layoff_staging_2
GROUP BY stage
ORDER BY total_laid_off DESC;
