WITH CTE_Seat AS
(
   SELECT S1.id
        , S1.student
        , S2.student  AS swap_student
        , (S1.id % 2) AS is_odd
     FROM Seat S1
     LEFT
     JOIN Seat S2 ON S2.id = S1.id + 1
    WHERE (S1.id % 2) = 1

    UNION ALL

   SELECT S1.id
        , S1.student
        , S2.student  AS swap_student
        , (S1.id % 2) AS is_odd
     FROM Seat     S1
     JOIN CTE_Seat S2 ON S2.id + 1 = S1.id
    WHERE S2.is_odd = 1
)


SELECT 
       id
     , ISNULL(swap_student,student) AS student
  FROM CTE_Seat
 ORDER BY 1 ASC