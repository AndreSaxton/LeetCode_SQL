SELECT B.name, SUM(A.amount) AS balance
  FROM Transactions A
  JOIN Users        B ON B.account = A.account
 GROUP BY B.name
HAVING SUM(A.amount) > 10000
