SELECT A.customer_id, COUNT(A.visit_id) AS count_no_trans
  FROM Visits A
 WHERE NOT EXISTS (SELECT 1 FROM Transactions B WHERE B.visit_id = A.visit_id)
 GROUP BY A.customer_id