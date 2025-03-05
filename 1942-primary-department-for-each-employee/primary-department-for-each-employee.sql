SELECT A.employee_id, A.department_id
  FROM Employee A
 WHERE A.primary_flag = 'Y'

 UNION

SELECT A.employee_id, A.department_id
  FROM Employee A
 WHERE NOT EXISTS (SELECT TOP 1 1
                     FROM Employee X
                    WHERE X.employee_id  = A.employee_id
                      AND X.primary_flag = 'Y')                      