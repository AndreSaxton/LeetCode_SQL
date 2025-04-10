WITH CTE_Cust_Prod AS
(
   SELECT C.customer_id
        , COUNT(DISTINCT C.product_key) AS QTD_product_key
     FROM Customer C
 GROUP BY C.customer_id
)


   SELECT CTE.customer_id
     FROM CTE_Cust_Prod CTE
        , Product       P
 GROUP BY CTE.customer_id
        , CTE.QTD_product_key
   HAVING CTE.QTD_product_key = COUNT(P.product_key)