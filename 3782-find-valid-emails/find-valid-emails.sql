SELECT user_id, email
  FROM Users A
 WHERE A.email LIKE '[a-z0-9]%[@][a-zA-Z]%.com'
   AND A.email NOT LIKE '%[.]%[@]%'