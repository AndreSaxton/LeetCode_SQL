WITH CTE_ORDER_YEAR AS
(
    SELECT buyer_id         AS buyer_id
         , COUNT(order_id)  AS orders_in_year
         , YEAR(order_date) AS order_year
      FROM Orders
     GROUP BY buyer_id, YEAR(order_date)
)


SELECT U.user_id                AS buyer_id
     , U.join_date              AS join_date
     , ISNULL(orders_in_year,0) AS orders_in_2019
  FROM Users  U
  LEFT
  JOIN CTE_ORDER_YEAR O ON O.buyer_id = U.user_id
                       AND order_year = 2019