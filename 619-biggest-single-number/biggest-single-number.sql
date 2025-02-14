SELECT max(A.num) AS num
  FROM MyNumbers A
 WHERE EXISTS
       (
         SELECT B.num AS num
           FROM MyNumbers B
          GROUP BY B.num
         HAVING COUNT(B.num) = 1
         AND B.num = A.num
       )