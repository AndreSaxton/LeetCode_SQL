    SELECT A.student_id        AS student_id
         , A.student_name      AS student_name
         , B.subject_name      AS subject_name
         , COUNT(C.student_id) AS attended_exams
      FROM Students A
CROSS JOIN Subjects B
      LEFT
      JOIN Examinations C ON C.student_id   = A.student_id
                         AND C.subject_name = B.subject_name
  GROUP BY A.student_id, A.student_name, B.subject_name
  ORDER BY A.student_id, B.subject_name