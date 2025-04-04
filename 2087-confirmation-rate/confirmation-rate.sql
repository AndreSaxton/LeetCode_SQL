WITH CTE_Confirmations AS
(
SELECT C.user_id
     , CONVERT(NUMERIC(5,2),COUNT(CASE WHEN C.action = 'confirmed' THEN 1 END))
     / CONVERT(NUMERIC(5,2),COUNT(C.action)) AS confirmation_rate
  FROM Confirmations C
 GROUP BY C.user_id
)

SELECT S.user_id                     AS user_id
     , ISNULL(ROUND(C.confirmation_rate,2),0) AS confirmation_rate
  FROM Signups S
  LEFT
  JOIN CTE_Confirmations C ON C.user_id = S.user_id