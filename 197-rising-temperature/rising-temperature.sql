select cd.id as Id
  from Weather cd
  join Weather pv on pv.recordDate = DATEADD(day, -1, convert(date, cd.recordDate))
 where pv.temperature < cd.temperature