SELECT B.name                    AS name
     , SUM(ISNULL(A.distance,0)) AS travelled_distance
  FROM Users B
  LEFT
  JOIN Rides A ON B.id = A.user_id
 GROUP BY B.name, B.id
 ORDER BY travelled_distance DESC, B.name ASC