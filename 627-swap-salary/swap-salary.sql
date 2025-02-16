UPDATE A
   SET sex = CASE WHEN sex = 'm' THEN 'f' ELSE 'm' END
  FROM Salary A