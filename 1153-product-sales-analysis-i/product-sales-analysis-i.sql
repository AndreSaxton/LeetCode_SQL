SELECT B.product_name, A.year, A.price
  FROM Sales   A
  JOIN Product B ON B.product_id = A.product_id