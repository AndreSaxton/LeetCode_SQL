SELECT max(num) AS num
  FROM (
         SELECT num AS num
           FROM MyNumbers
          GROUP BY num
         HAVING COUNT(num) = 1
       ) X