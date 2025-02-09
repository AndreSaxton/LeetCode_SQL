/* Write your T-SQL query statement below */

select x.Department, x.Employee, x.Salary
from (
select b.name   as Department
     , a.name   as Employee
     , a.salary as Salary
     , DENSE_RANK() OVER (PARTITION BY a.departmentId ORDER BY a.salary DESC) AS TOP_SALARY
from Employee a
join Department b on b.id = a.departmentId
) x
where x.TOP_SALARY <= 3