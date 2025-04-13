WITH CTE_SALES AS
(
   SELECT product_id AS product_id
        , year       AS first_year
        , quantity   AS quantity
        , price      AS price
        , DENSE_RANK() OVER (PARTITION BY product_id ORDER BY year ASC) AS RN
     FROM Sales
)

SELECT product_id
     , first_year
     , quantity
     , price
  FROM CTE_SALES
 WHERE RN = 1