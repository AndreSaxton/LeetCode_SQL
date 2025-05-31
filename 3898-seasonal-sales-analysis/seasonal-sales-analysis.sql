WITH CTE_SEASONS AS
(
    SELECT 01 AS month, 'Winter' AS season UNION
    SELECT 02 AS month, 'Winter' AS season UNION
    SELECT 03 AS month, 'Spring' AS season UNION
    SELECT 04 AS month, 'Spring' AS season UNION
    SELECT 05 AS month, 'Spring' AS season UNION
    SELECT 06 AS month, 'Summer' AS season UNION
    SELECT 07 AS month, 'Summer' AS season UNION
    SELECT 08 AS month, 'Summer' AS season UNION
    SELECT 09 AS month, 'Fall'   AS season UNION
    SELECT 10 AS month, 'Fall'   AS season UNION
    SELECT 11 AS month, 'Fall'   AS season UNION
    SELECT 12 AS month, 'Winter' AS season
),
CTE_RANK_PRODUCTS_SEASON AS
(
    SELECT Season.season             AS season
         , P.category                AS category
         , SUM(S.quantity)           AS total_quantity
         , SUM(S.quantity * S.price) AS total_revenue
         , RANK() OVER(PARTITION BY Season.season
                           ORDER BY SUM(S.quantity) DESC
                                  , SUM(S.quantity * S.price) DESC) AS RANK
        
      FROM sales       S
      JOIN products    P      ON P.product_id = S.product_id
      JOIN CTE_SEASONS Season ON Season.month = MONTH(S.sale_date)
        
     GROUP
        BY P.category
         , Season.season
)
    
SELECT season
     , category
     , total_quantity
     , total_revenue    
  FROM CTE_RANK_PRODUCTS_SEASON
 WHERE RANK = 1