SELECT MAX(X.salary) AS SecondHighestSalary
  FROM Employee A
  LEFT
  JOIN (
        SELECT DENSE_RANK() OVER (ORDER BY salary DESC) AS RANK_salary
             , id
             , salary
          FROM Employee
       ) X ON X.id = A.id
          AND X.RANK_salary = 2