SELECT product_id, store, price
  FROM (
        SELECT A.product_id, A.store1, A.store2, A.store3
          FROM Products A
       ) AS Prod
  UNPIVOT
       (
        price FOR store IN (store1, store2, store3)
       ) AS UnpivotProd