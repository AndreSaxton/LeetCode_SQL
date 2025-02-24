DECLARE @END_DATE   DATE = '2019-07-27'
DECLARE @BEGIN_DATE DATE = DATEADD(day,-29,'2019-07-27')

SELECT A.activity_date           AS day
     , COUNT(DISTINCT A.user_id) AS active_users
  FROM Activity A
 WHERE A.activity_date BETWEEN @BEGIN_DATE
                           AND @END_DATE
 GROUP BY A.activity_date