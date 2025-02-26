SELECT B.product_name
     , SUM(A.unit) AS unit
  FROM Orders A
  JOIN Products B ON B.product_id = A.product_id
 WHERE  YEAR(A.order_date) = 2020
   AND MONTH(A.order_date) = 2
 GROUP BY B.product_name
HAVING SUM(A.unit) >= 100
