SELECT DISTINCT
       A.product_id, A.product_name

  FROM Product A
  JOIN Sales   B ON B.product_id = A.product_id

 WHERE NOT EXISTS(
                  SELECT X.product_id
                    FROM Sales X
                   WHERE X.sale_date NOT BETWEEN '2019-01-01' AND '2019-03-31'
                     AND X.product_id = A.product_id
                 )