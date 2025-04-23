SELECT U.*
  FROM Users U
 WHERE REGEXP_LIKE (mail,'^[a-z]+[0-9a-zA-Z_.-]*@leetcode[.]{1}com$')