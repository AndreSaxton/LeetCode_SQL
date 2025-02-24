SELECT *
  FROM Patients A
 WHERE CONCAT(' ',A.conditions) LIKE '% DIAB1%'