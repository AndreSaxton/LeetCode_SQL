/* Write your T-SQL query statement below */

delete x
  from Person x
 where not exists (
                select min(a.id) as min_id
                  from Person a
                 group by a.email
                having min(a.id) = x.id
              )