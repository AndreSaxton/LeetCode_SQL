SELECT A.teacher_id                 AS teacher_id
     , COUNT(DISTINCT A.subject_id) AS cnt
  FROM Teacher A
 GROUP BY A.teacher_id