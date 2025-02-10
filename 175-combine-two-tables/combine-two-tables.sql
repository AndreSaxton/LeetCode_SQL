SELECT A.firstName, A.lastName, B.city , B.state
  FROM Person A
  LEFT
  JOIN Address B ON B.personId = A.personId