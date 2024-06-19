select *
from employee
where (department, salary) in (
        select department,
            max(salary) as salary
        from employee
        group by department
    )
order by department asc;
select *
FROM department
where department not in (
        select distinct department
        from employee
    );
-- correlated subquery
-- find all employee having their salary greater than the average of their department
select *
from employee e1
where salary > (
        select avg(salary) as salary
        from employee e2
        where e2.department = e1.department
    );