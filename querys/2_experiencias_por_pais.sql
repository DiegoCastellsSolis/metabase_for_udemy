CREATE SCHEMA dw;
CREATE SCHEMA staging;


WITH T_EXPR AS (
    SELECT 
        *,
        CASE 
            WHEN duracion LIKE '%días%' THEN 24 * CAST(SPLIT_PART(duracion, ' ', 1) AS FLOAT) 
            ELSE CAST(SPLIT_PART(duracion, ' ', 1) AS FLOAT)
        END AS duracion_hs
    FROM experiencias  
)
SELECT 
    AVG(duracion_hs) AS avg_duracion,
    AVG(duracion_hs) / 2 AS avg_duracion_half
FROM T_EXPR;
