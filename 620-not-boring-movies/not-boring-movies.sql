SELECT *
  FROM Cinema
 WHERE description <> 'boring'
   AND (CAST(id AS NUMERIC(15,2)) / 2) - (id / 2) > 0 /* odd number */
 ORDER BY rating DESC