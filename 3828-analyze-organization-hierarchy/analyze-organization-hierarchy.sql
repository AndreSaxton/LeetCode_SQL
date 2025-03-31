WITH CTE_Hierarchy AS (
    SELECT Emp.employee_id   AS employee_id
         , Emp.employee_name AS employee_name
         , Emp.manager_id    AS manager_id
         , 1                 AS level
         , Emp.salary        AS budget
      FROM Employees Emp
     WHERE Emp.manager_id IS NULL

     UNION ALL

    SELECT Emp.employee_id   AS employee_id
         , Emp.employee_name AS employee_name
         , Emp.manager_id    AS manager_id
         , H.level + 1       AS level
         , Emp.salary        AS budget
      FROM Employees     Emp
      JOIN CTE_Hierarchy H ON H.employee_id = Emp.manager_id
    ),
CTE_Team AS (
    SELECT Emp.manager_id         AS manager_id
         , COUNT(Emp.employee_id) AS team_size
         , SUM(Emp.salary)        AS budget
      FROM Employees Emp
     GROUP BY Emp.manager_id

     UNION ALL

    SELECT Emp.manager_id     AS manager_id
         , T.team_size        AS team_size
         , T.budget           AS budget
      FROM CTE_Team  T
      JOIN Employees Emp ON Emp.employee_id = T.manager_id
    )


SELECT H.employee_id              AS employee_id
     , H.employee_name            AS employee_name
     , H.level                    AS level
     , ISNULL(SUM(T.team_size),0) AS team_size
     , ISNULL(SUM(T.budget   ),0)
     + H.budget                   AS budget
  FROM CTE_Hierarchy H
  LEFT
  JOIN CTE_Team      T ON T.manager_id = H.employee_id
 GROUP BY H.employee_id
        , H.employee_name
        , H.level
        , H.budget

 ORDER BY H.level         ASC
        , budget          DESC
        , H.employee_name ASC