WITH CTE_Delivery AS
(
    SELECT delivery_id
         , customer_id
         , order_date
         , customer_pref_delivery_date
         , MIN(order_date) OVER (PARTITION BY customer_id ORDER BY order_date ASC) first_order
         , ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date ASC) RN
      FROM Delivery
)


SELECT ROUND(CONVERT(NUMERIC(10,4),
             COUNT(CASE WHEN first_order = customer_pref_delivery_date
                        THEN 1
                        ELSE NULL
                   END))
           / CONVERT(NUMERIC(10,4),COUNT(delivery_id))
           * 100,2)              AS immediate_percentage
  FROM CTE_Delivery
 WHERE RN = 1