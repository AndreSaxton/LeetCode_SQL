SELECT A.query_name

     , ROUND(SUM(CONVERT(NUMERIC(15,2), A.rating) /
                 CONVERT(NUMERIC(15,2), A.position))
            / COUNT(A.query_name),2) AS quality

     , ROUND((COUNT(CASE WHEN A.rating < 3 THEN 1.00 ELSE NULL END)
            / CONVERT(NUMERIC(15,2), COUNT(A.query_name))
            * 100),2)
             AS poor_query_percentage

  FROM Queries A

 GROUP BY A.query_name