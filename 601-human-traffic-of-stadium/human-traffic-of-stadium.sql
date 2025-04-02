WITH Stadiums AS (
   SELECT S1.id         AS id
        , S1.visit_date AS visit_date
        , S1.people     AS people
        , S1.id + 1     AS next_id
        , S1.id         AS initial_id
     FROM Stadium S1
    WHERE NOT EXISTS (SELECT 1 FROM Stadium S2 WHERE S2.id = S1.id-1 AND S2.people >= 100)
      AND S1.people >= 100

    UNION ALL

   SELECT S2.id         AS id
        , S2.visit_date AS visit_date
        , S2.people     AS people
        , S2.id + 1     AS next_id
        , S1.initial_id AS initial_id
     FROM Stadiums S1
     JOIN Stadium  S2 ON S2.id = S1.next_id
    WHERE S2.people >= 100
)

SELECT S1.id
     , S1.visit_date
     , S1.people
  FROM Stadiums S1
 WHERE EXISTS (SELECT 1
                 FROM Stadiums S2
                WHERE S2.initial_id = S1.initial_id
                GROUP BY S2.initial_id
               HAVING COUNT(S2.initial_id) >= 3)
 ORDER BY S1.visit_date ASC