WITH CTE_Products AS (
  SELECT DISTINCT
         product_id AS product_id
       , 10         AS price
    FROM Products
),

CTE_Prices AS (
  SELECT product_id  AS product_id
       , new_price   AS price
       , change_date AS change_date
       , RANK () OVER (PARTITION BY product_id ORDER BY change_date DESC) AS RANK
    FROM Products
   WHERE change_date <= '2019-08-16'
)


SELECT Prod.product_id
     , ISNULL(Pric.price, Prod.price) AS price
  FROM CTE_Products Prod
  LEFT
  JOIN CTE_Prices Pric ON Pric.product_id   = Prod.product_id
                      AND Pric.RANK = 1