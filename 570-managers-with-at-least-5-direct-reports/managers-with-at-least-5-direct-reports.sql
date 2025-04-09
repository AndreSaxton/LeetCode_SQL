SELECT A.name
  FROM Employee A
 WHERE EXISTS (SELECT 1
                 FROM Employee B
                GROUP BY B.managerId
               HAVING COUNT(B.managerId) >= 5
                  AND B.managerId = A.id)