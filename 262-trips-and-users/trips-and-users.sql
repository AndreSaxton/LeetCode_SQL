 select x.request_at as Day
      , cast(x.qtd_cancelled/x.qtd_total as decimal(5,2)) as 'Cancellation Rate'   
from (
select t.request_at
     , cast(sum(case when t.status  = 'completed' then 1 else 0 end) as decimal(5,2) ) as qtd_completed
     , cast(sum(case when t.status <> 'completed' then 1 else 0 end) as decimal(5,2) ) as qtd_cancelled
     , cast(count(t.status) as decimal(5,2)) as qtd_total

  from Trips t
  join Users c on c.users_id = t.client_id
              and c.role     = 'client'
              and c.banned   = 'No'
  join Users d on d.users_id = t.driver_id
              and d.role     = 'driver'
              and d.banned   = 'No'
 where t.request_at between '2013-10-01' and '2013-10-03'
 group by t.request_at
) x
