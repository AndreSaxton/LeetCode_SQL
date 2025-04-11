WITH CTE_days AS
(
    SELECT TOP 1
           visited_on
         , DATEADD(DAY,1,visited_on) AS next_visited_on
         , DATEADD(DAY,6,visited_on) AS date_limit
      FROM Customer
     ORDER BY visited_on ASC

     UNION ALL

    SELECT
           C.visited_on
         , DATEADD(DAY,1,C.visited_on) AS next_visited_on
         , DATEADD(DAY,6,C.visited_on) AS date_limit
      FROM Customer C
      JOIN CTE_days CTE ON CTE.next_visited_on = C.visited_on
),
CTE_amount AS
(
    SELECT C.visited_on  AS visited_on
         , SUM(C.amount) AS amount
      FROM Customer C
     GROUP BY C.visited_on
)


SELECT CTE_days.date_limit    AS visited_on
     , SUM(CTE_amount.amount) AS amount
     , ROUND(AVG(CONVERT(NUMERIC(15,2), CTE_amount.amount)),2) AS average_amount

  FROM (SELECT DISTINCT * FROM CTE_days) CTE_days

  JOIN CTE_amount ON CTE_amount.visited_on BETWEEN CTE_days.visited_on
                                               AND CTE_days.date_limit
  
 WHERE EXISTS (SELECT 1 FROM Customer C WHERE C.visited_on = CTE_days.date_limit)

 GROUP BY CTE_days.date_limit

