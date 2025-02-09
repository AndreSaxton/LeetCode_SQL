/* Write your T-SQL query statement below */

select a.num as ConsecutiveNums
  from Logs a
  join Logs b on b.id = a.id+1
  join Logs c on c.id = b.id+1
 where a.num = b.num and b.num = c.num
 group by a.num