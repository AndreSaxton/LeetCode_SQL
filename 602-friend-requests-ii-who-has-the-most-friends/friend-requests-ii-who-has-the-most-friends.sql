WITH CTE AS
(
SELECT X.id        AS id
     , COUNT(X.id) AS num
     , RANK() OVER (ORDER BY COUNT(X.id) DESC) AS RANK
  FROM (
        SELECT requester_id AS id
          FROM RequestAccepted

         UNION ALL

        SELECT accepter_id AS id
          FROM RequestAccepted
       ) X
 GROUP BY X.id
)

SELECT X.id, X.num
  FROM CTE X
 WHERE RANK = 1