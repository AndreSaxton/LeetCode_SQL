select a.name
     , b.bonus
  from Employee a
  left
  join Bonus    b on b.empId = a.empId
 where isnull(b.bonus,0) < 1000