/* Write your T-SQL query statement below */

select emp.name as Employee
  from Employee emp
  join Employee man on man.id = emp.managerId
 where emp.salary > man.salary