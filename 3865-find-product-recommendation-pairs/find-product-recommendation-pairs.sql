   SELECT A.product_id              AS product1_id
        , B.product_id              AS product2_id
        , C.category                AS product1_category
        , D.category                AS product2_category
        , COUNT(DISTINCT A.user_id) AS customer_count

     FROM ProductPurchases A
     JOIN ProductPurchases B      ON B.user_id     = A.user_id
                                 AND B.product_id  > A.product_id
     JOIN ProductInfo           C ON C.product_id  = A.product_id
     JOIN ProductInfo           D ON D.product_id  = B.product_id

 GROUP BY A.product_id
        , B.product_id
        , C.category
        , D.category

   HAVING COUNT(DISTINCT A.user_id) >= 3

 ORDER BY customer_count DESC
        , A.product_id   ASC
        , B.product_id   ASC