SELECT emp.employee_id
  FROM Employees emp
  LEFT
  JOIN Employees man on man.employee_id = emp.manager_id
 WHERE man.employee_id IS NULL
   AND emp.manager_id  IS NOT NULL
   AND emp.salary       < 30000
 ORDER BY emp.employee_id