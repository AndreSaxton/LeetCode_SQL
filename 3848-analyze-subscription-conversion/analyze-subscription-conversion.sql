WITH CTE_UserActivity AS
(
    SELECT user_id
         , SUM(CASE WHEN activity_type = 'free_trial' THEN activity_duration ELSE 0 END) AS trial_duration
         , COUNT(CASE WHEN activity_type = 'free_trial' THEN 1 ELSE NULL END           ) AS trial_qty
         , SUM(CASE WHEN activity_type = 'paid' THEN activity_duration ELSE 0 END      ) AS paid_duration
         , COUNT(CASE WHEN activity_type = 'paid' THEN 1 ELSE NULL END                 ) AS paid_qty
      FROM UserActivity
     GROUP BY user_id
)

SELECT user_id AS user_id
     , ROUND(CONVERT(NUMERIC(10,2),trial_duration) / trial_qty,2) AS trial_avg_duration
     , ROUND(CONVERT(NUMERIC(10,2),paid_duration)  / paid_qty ,2) AS paid_avg_duration
  FROM CTE_UserActivity
 WHERE paid_qty > 0
 ORDER BY user_id
