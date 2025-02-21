SELECT *
  FROM Users A
 WHERE 1=1
--    AND A.email LIKE '%.com'
--    AND A.email LIKE '%@%'
--    AND A.email LIKE '%[^a-z0-9]+@[^a-z0-9]+[.com]'
-- AND A.email LIKE '%.com$'

-- AND A.email LIKE '%[@]%.com'
-- AND A.email LIKE '[a-z]%[@]%.com'

-- AND A.email LIKE '^[a-zA-Z0-9]+@[a-zA-Z]+.com$'
-- AND A.email LIKE '[a-zA-Z0-9]'
-- AND A.email LIKE '%[@]%'
AND A.email LIKE '[a-z0-9]%[@][a-zA-Z]%.com'
AND A.email NOT LIKE '%[.]%[@]%'