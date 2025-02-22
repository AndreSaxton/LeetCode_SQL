SELECT A.project_id
     , ROUND(AVG(CONVERT(NUMERIC(10,2),B.experience_years)),2) AS average_years
  FROM Project  A
  JOIN Employee B ON B.employee_id = A.employee_id
 GROUP BY A.project_id
 ORDER BY A.project_id
