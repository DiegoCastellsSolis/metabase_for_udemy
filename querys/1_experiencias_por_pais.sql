CREATE SCHEMA dw;
CREATE SCHEMA staging;

----------------------------------      total_ventas        --------------------------------------
SELECT 
  SUM(e.precio) AS tot_billed
FROM
  staging.experiencias e
INNER JOIN staging.venta_experiencias ve ON e.id = ve.id_experiencia
WHERE ve.fecha_venta BETWEEN {{DATE_FROM}} AND {{DATE_TO}} 
 
----------------------------------      pais_mayor_venta        --------------------------------------
 SELECT 
  pais
FROM
  staging.experiencias e
INNER JOIN staging.venta_experiencias ve ON e.id = ve.id_experiencia
WHERE ve.fecha_venta BETWEEN {{DATE_FROM}} AND {{DATE_TO}} 
GROUP BY pais
ORDER BY count(pais) DESC
LIMIT 1
----------------------------------      experiencia_mas_vendida        --------------------------------------
 SELECT 
  e.experiencia
FROM
  staging.experiencias e
INNER JOIN staging.venta_experiencias ve ON e.id = ve.id_experiencia
WHERE ve.fecha_venta BETWEEN {{DATE_FROM}} AND {{DATE_TO}} 
GROUP BY e.experiencia
ORDER BY count(e.experiencia) DESC
LIMIT 1
----------------------------------      venta_exp_tracker        --------------------------------------
SELECT
  e.experiencia,
  SUM(e.precio) AS tot_billed
FROM
  staging.experiencias e
INNER JOIN staging.venta_experiencias ve ON e.id = ve.id_experiencia
WHERE ve.fecha_venta BETWEEN {{DATE_FROM}} AND {{DATE_TO}}
GROUP BY
  e.experiencia
ORDER BY
  tot_billed DESC
LIMIT 5;
 
----------------------------------      proporcion_ventas        --------------------------------------
SELECT
  e.pais,
  COUNT(e.pais) AS count_billed
FROM
  staging.experiencias e
INNER JOIN staging.venta_experiencias ve ON e.id = ve.id_experiencia
WHERE ve.fecha_venta BETWEEN {{DATE_FROM}} AND {{DATE_TO}}
GROUP BY
  e.pais
ORDER BY
  count_billed DESC 























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
