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
