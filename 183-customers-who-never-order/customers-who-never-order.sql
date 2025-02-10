select a.name as Customers
  from Customers a
 where not exists (select 1 from Orders b where b.customerId = a.id)