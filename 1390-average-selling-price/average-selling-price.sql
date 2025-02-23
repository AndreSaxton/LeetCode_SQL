SELECT X.product_id  AS product_id
     , ISNULL(
       CONVERT(NUMERIC(10,2),
               SUM(CONVERT(NUMERIC(10,2), X.TOTAL_PRICE)) / 
               SUM(CONVERT(NUMERIC(10,2), X.TOTAL_QTTY )))
              ,0.00) AS average_price
  FROM (
SELECT A.product_id      AS product_id
     , A.price * B.units AS TOTAL_PRICE
     , B.units           AS TOTAL_QTTY
  FROM Prices    A
  LEFT
  JOIN UnitsSold B ON B.product_id  = A.product_id
                  AND B.purchase_date BETWEEN A.start_date
                                          AND A.end_date
       ) X
 GROUP BY X.product_id