WITH CTE_Scores AS
(
   SELECT student_id
        , subject
        , FIRST_VALUE(score) OVER (PARTITION BY student_id, subject ORDER BY exam_date ASC) AS first_score
        , LAST_VALUE(score) OVER (PARTITION BY student_id, subject ORDER BY exam_date ASC) AS latest_score
        , ROW_NUMBER() OVER (PARTITION BY student_id, subject ORDER BY exam_date DESC) AS RN
     FROM Scores
)


SELECT CTE.student_id   AS student_id
     , CTE.subject      AS subject
     , CTE.first_score  AS first_score
     , CTE.latest_score AS latest_score
  FROM CTE_Scores CTE
 WHERE CTE.first_score < CTE.latest_score
   AND CTE.RN = 1