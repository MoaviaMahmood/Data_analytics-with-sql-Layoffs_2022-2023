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
