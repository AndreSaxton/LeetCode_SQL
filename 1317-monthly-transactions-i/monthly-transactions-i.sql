SELECT FORMAT(T.trans_date, 'yyyy-MM')  AS month
     , T.country                        AS country
     , COUNT(T.id)                      AS trans_count
     , COUNT(CASE WHEN T.state = 'approved'
                  THEN 1
                  ELSE NULL
             END)                       AS approved_count
     , SUM(T.amount)                    AS trans_total_amount
     , ISNULL(SUM(CASE WHEN T.state = 'approved'
                       THEN amount
                       ELSE NULL
                  END),0)               AS approved_total_amount
  FROM Transactions T
 GROUP BY FORMAT(T.trans_date, 'yyyy-MM'), T.country
 ORDER BY month ASC, country DESC