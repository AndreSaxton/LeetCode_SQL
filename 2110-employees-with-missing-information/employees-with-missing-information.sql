SELECT X.employee_id
  FROM (
        SELECT emp.employee_id FROM Employees emp
         UNION
        SELECT sal.employee_id FROM Salaries  sal
       ) X
 WHERE NOT EXISTS (SELECT Y.employee_id FROM Salaries Y WHERE Y.employee_id = X.employee_id)
    OR NOT EXISTS (SELECT Z.employee_id FROM Employees Z WHERE Z.employee_id = X.employee_id)
