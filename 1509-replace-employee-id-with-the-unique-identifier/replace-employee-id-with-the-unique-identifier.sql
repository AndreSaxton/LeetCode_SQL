SELECT B.unique_id, A.name
  FROM Employees A
  LEFT
  JOIN EmployeeUNI B ON B.id = A.id
