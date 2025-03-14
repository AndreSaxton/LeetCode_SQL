SELECT B.sell_date                AS sell_date
     , COUNT(B.product)           AS num_sold
     , STRING_AGG(B.product, ',') AS products
  FROM (
        SELECT DISTINCT
               A.sell_date
             , A.product
          FROM Activities A
       ) B
 GROUP BY B.sell_date
 ORDER BY B.sell_date