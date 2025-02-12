SELECT ISNULL(ROUND(SUM(1/Y.QTD_player),2),0) AS fraction
  FROM Activity A

  JOIN ( SELECT player_id                      AS player_id
              , MIN(event_date)                AS FIRST_LOGIN
              , DATEADD(DAY,1,MIN(event_date)) AS SECOND_LOGIN
           FROM Activity
          GROUP BY player_id
       ) X ON X.SECOND_LOGIN = A.event_date
          AND X.player_id    = A.player_id

  JOIN (SELECT CONVERT(NUMERIC(15,2),COUNT(DISTINCT player_id)) AS QTD_player FROM Activity) Y ON 1=1