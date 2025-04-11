WITH CTE_Queue AS
(
   SELECT Q.person_name
        , Q.weight
        , Q.turn
        , Q.weight AS total_weight
     FROM Queue Q
    WHERE Q.turn = 1

    UNION ALL

   SELECT Q.person_name
        , Q.weight
        , Q.turn
        , Q.weight + CTE.total_weight AS total_weight
     FROM Queue     Q
     JOIN CTE_Queue CTE ON CTE.turn + 1 = Q.turn
    WHERE Q.weight + CTE.total_weight <= 1000
)


SELECT TOP 1 person_name
  FROM CTE_Queue
 ORDER BY turn DESC