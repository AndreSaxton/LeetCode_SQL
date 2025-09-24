SELECT customer_id
  FROM customer_transactions
 GROUP BY customer_id
HAVING COUNT(CASE WHEN transaction_type = 'purchase' THEN 1 ELSE NULL END) >= 3
   AND DATEDIFF(day, MIN(transaction_date), MAX(transaction_date)) >= 30
   AND CONVERT(NUMERIC(15,2),COUNT(CASE WHEN transaction_type = 'refund' THEN 1 ELSE NULL END))
     / CONVERT(NUMERIC(15,2),COUNT(transaction_type)) * 100 < 20