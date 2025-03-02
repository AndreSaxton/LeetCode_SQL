SELECT A.user_id
     , CONCAT(UPPER(LEFT(A.name,1))
             ,LOWER(SUBSTRING(A.name,2,LEN(A.name)))) AS name
  FROM Users A
 ORDER BY A.user_id