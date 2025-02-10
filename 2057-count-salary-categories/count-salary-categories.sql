SELECT X.category, IFNULL(Y.accounts_count,0) AS accounts_count
  FROM (
        SELECT 'Low Salary' AS category
         UNION ALL
        SELECT 'Average Salary' AS category
         UNION ALL
        SELECT 'High Salary' AS category
       ) X
  LEFT
  JOIN (
        SELECT CASE WHEN income < 20000 THEN 'Low Salary'
                    WHEN income BETWEEN 20000 AND 50000 THEN 'Average Salary'
                    ELSE 'High Salary'
               END AS category
             , COUNT(*) AS accounts_count
          FROM Accounts
         GROUP BY CASE WHEN income < 20000 THEN 'Low Salary'
                       WHEN income BETWEEN 20000 AND 50000 THEN 'Average Salary'
                       ELSE 'High Salary'
                  END
       ) Y ON Y.category = X.category