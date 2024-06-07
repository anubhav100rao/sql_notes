### Revising SQL for Interviews

When preparing for SQL interviews, focus on core concepts, common queries, and problem-solving techniques. Below are essential topics with examples to guide your revision:

### Basic SQL Concepts and Queries

1. **SELECT Statement**

```sql
-- Retrieve all columns from a table called `employees`
SELECT * FROM employees;
```

2. **WHERE Clause**

```sql
-- Retrieve employees with a salary greater than 50,000
SELECT * FROM employees WHERE salary > 50000;
```

3. **JOINs**

```sql
-- Retrieve employee names and their department names using INNER JOIN
SELECT e.name, d.department_name
FROM employees e
INNER JOIN departments d ON e.department_id = d.id;
```

4. **GROUP BY and HAVING**

```sql
-- Count the number of employees in each department and show only those departments with more than 5 employees
SELECT department_id, COUNT(*) AS num_employees
FROM employees
GROUP BY department_id
HAVING COUNT(*) > 5;
```

5. **ORDER BY**

```sql
-- Retrieve employees ordered by their hire date in descending order
SELECT * FROM employees
ORDER BY hire_date DESC;
```

### Intermediate to Advanced SQL Concepts

1. **Subqueries**

```sql
-- Retrieve employees who have the highest salary in their department
SELECT *
FROM employees e1
WHERE salary = (
    SELECT MAX(salary)
    FROM employees e2
    WHERE e1.department_id = e2.department_id
);
```

2. **Aggregate Functions**

```sql
-- Retrieve the average salary of employees in each department
SELECT department_id, AVG(salary) AS avg_salary
FROM employees
GROUP BY department_id;
```

3. **Window Functions**

```sql
-- Retrieve employees along with their rank based on salary within their department
SELECT e.name, e.salary, e.department_id,
       RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS salary_rank
FROM employees e;
```

4. **Case Statements**

```sql
-- Categorize employees based on their salary
SELECT name, salary,
       CASE
           WHEN salary < 30000 THEN 'Low'
           WHEN salary BETWEEN 30000 AND 70000 THEN 'Medium'
           ELSE 'High'
       END AS salary_category
FROM employees;
```

5. **Common Table Expressions (CTEs)**

```sql
-- Use a CTE to find departments with an average salary greater than 60,000
WITH DeptAvgSalary AS (
    SELECT department_id, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
)
SELECT department_id, avg_salary
FROM DeptAvgSalary
WHERE avg_salary > 60000;
```

### Practice Problems

#### Problem 1: Highest Average Salary Department

Tables:

-   **employees**: `id`, `name`, `salary`, `department_id`, `hire_date`
-   **departments**: `id`, `department_name`

**Query**: Find the name of the department(s) with the highest average salary.

```sql
WITH DeptAvgSalary AS (
    SELECT department_id, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
)
SELECT d.department_name, das.avg_salary
FROM DeptAvgSalary das
INNER JOIN departments d ON das.department_id = d.id
WHERE das.avg_salary = (SELECT MAX(avg_salary) FROM DeptAvgSalary);
```

#### Problem 2: Employees Hired in the Last Year

**Query**: Retrieve the names of employees hired in the last year.

```sql
SELECT name
FROM employees
WHERE hire_date >= DATEADD(year, -1, GETDATE());
```

### Earlier filter

```sql
To speed up the query, you can pre-filter names with “a” in them:

with limited_first_names as (
 select
   *
 from
   first_names
 where
   name ilike '%a%'
)
, limited_last_names as (
  select
    *
  from
    last_names
  where
     name ilike '%a%'
)
select
 count(*)
from
 limited_first_names
join
 limited_last_names
on
 limited_last_names.id = limited_first_names.id
```

### Tips for SQL Interviews

1. **Explain Your Thought Process**: Clearly articulate your reasoning while solving queries.
2. **Consider Edge Cases**: Discuss potential edge cases and how your query handles them.
3. **Optimization**: Be prepared to discuss and implement query optimization techniques.
4. **Normalization**: Understand and explain database normalization principles.
5. **Hands-On Practice**: Use online platforms such as LeetCode, HackerRank, and SQLZoo to practice a variety of SQL problems.

By mastering these SQL concepts and practicing regularly, you will build the confidence and skills needed to excel in SQL interviews.
