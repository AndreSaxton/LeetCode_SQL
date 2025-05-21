WITH CTE_ProductCategoryPurchases AS
(
SELECT DISTINCT
       ProdP.user_id
     , ProdI.category AS category1
     , ProdI.category AS category2
     , 1              AS TIPO
  FROM ProductPurchases ProdP
  JOIN ProductInfo      ProdI ON ProdI.product_id = ProdP.product_id

 UNION ALL

SELECT 
       ProdP.user_id
     , CTE.category1  AS category1
     , ProdI.category AS category2
     , 2              AS TIPO
  FROM CTE_ProductCategoryPurchases CTE
  JOIN ProductInfo      ProdI ON ProdI.category  > CTE.category1
  JOIN ProductPurchases ProdP ON ProdP.product_id = ProdI.product_id
                             AND ProdP.user_id    = CTE.user_id
 WHERE 1=1
   AND CTE.category1 <> ProdI.category
   AND CTE.TIPO       = 1
)

  SELECT category1
       , category2
       , COUNT(DISTINCT user_id) AS customer_count
    FROM CTE_ProductCategoryPurchases CTE
   WHERE CTE.TIPO = 2
GROUP BY category1
       , category2
  HAVING COUNT(DISTINCT user_id) >= 3
ORDER BY customer_count DESC
       , category1
       , category2