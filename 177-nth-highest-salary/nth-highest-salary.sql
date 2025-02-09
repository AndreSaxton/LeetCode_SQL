CREATE FUNCTION getNthHighestSalary(@N INT) RETURNS INT AS
BEGIN
    RETURN (
        /* Write your T-SQL query statement below. */

select max(x.salary) as salary
  from (
         select a.salary
              , DENSE_RANK() OVER (ORDER BY a.salary DESC) rank_salary
           from Employee a

          union all
 
         select null as salary, null as rank_salary
       ) x
 where x.rank_salary = @N

    );
END