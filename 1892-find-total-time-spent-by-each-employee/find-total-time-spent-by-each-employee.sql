SELECT A.event_day             AS day
     , A.emp_id                AS emp_id
     , SUM(out_time - in_time) AS total_time
  FROM Employees A
 GROUP BY A.event_day
        , A.emp_id