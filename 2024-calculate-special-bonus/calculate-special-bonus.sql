SELECT A.employee_id
     , CASE WHEN LEFT(A.name,1) <> 'M'
             AND (CONVERT(NUMERIC(5,2),A.employee_id,2) / 2) - (A.employee_id / 2) > 0 /* PAIR NUMBER */
            THEN A.salary
            ELSE 0.00
       END AS bonus
  FROM Employees A
 ORDER BY A.employee_id