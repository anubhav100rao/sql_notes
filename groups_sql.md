Here are some advanced SQL examples that utilize the `GROUP BY` clause in more complex scenarios.

### Example 1: Grouping with Multiple Columns

**Problem:** Find the number of employees in each department, broken down by their job title.

```sql
SELECT department_id, job_title, COUNT(*) AS num_employees
FROM employees
GROUP BY department_id, job_title
ORDER BY department_id, job_title;
```

### Explanation:

-   **GROUP BY department_id, job_title**: Groups employees by both department and job title.
-   **COUNT(\*)**: Counts the number of employees in each group.
-   **ORDER BY department_id, job_title**: Orders the result by department and job title.

### Example 2: Filtering Groups with HAVING

**Problem:** List departments that have more than 3 employees with a salary greater than 50,000.

```sql
SELECT department_id, COUNT(*) AS num_high_salary_employees
FROM employees
WHERE salary > 50000
GROUP BY department_id
HAVING COUNT(*) > 3;
```

### Explanation:

-   **WHERE salary > 50000**: Filters employees before grouping.
-   **GROUP BY department_id**: Groups the remaining employees by department.
-   **HAVING COUNT(\*) > 3**: Filters groups to include only those with more than 3 employees.

### Example 3: Aggregating with Conditional Logic

**Problem:** Find the total salary for each department and also the total salary for employees hired after 2020-01-01.

```sql
SELECT department_id,
       SUM(salary) AS total_salary,
       SUM(CASE WHEN hire_date > '2020-01-01' THEN salary ELSE 0 END) AS recent_hires_total_salary
FROM employees
GROUP BY department_id;
```

### Explanation:

-   **SUM(salary)**: Calculates the total salary for each department.
-   **SUM(CASE WHEN hire_date > '2020-01-01' THEN salary ELSE 0 END)**: Conditionally sums the salary of employees hired after a specific date.

### Example 4: Grouping with JOINS

**Problem:** Find the average salary of employees for each department, including departments with no employees.

```sql
SELECT d.department_name, COALESCE(AVG(e.salary), 0) AS avg_salary
FROM departments d
LEFT JOIN employees e ON d.id = e.department_id
GROUP BY d.department_name;
```

### Explanation:

-   **LEFT JOIN**: Ensures all departments are included, even those with no employees.
-   **COALESCE(AVG(e.salary), 0)**: Returns 0 for departments with no employees instead of NULL.

### Example 5: Nested Group BY with Subqueries

**Problem:** Find the top 2 departments with the highest average employee salary.

```sql
SELECT department_id, avg_salary
FROM (
    SELECT department_id, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
) AS dept_avg_salaries
ORDER BY avg_salary DESC
LIMIT 2;
```

### Explanation:

-   **Inner Query**: Calculates the average salary for each department.
-   **Outer Query**: Orders the departments by average salary and limits the result to the top 2.

### Example 6: Grouping with ROLLUP

**Problem:** Generate a report of total sales by year and quarter, with subtotals and a grand total.

Assume we have a `sales` table:
| sale_id | sale_date | amount |
|---------|------------|--------|
| 1 | 2021-01-15 | 1000 |
| 2 | 2021-04-20 | 1500 |
| 3 | 2022-02-10 | 2000 |
| 4 | 2022-03-15 | 2500 |

```sql
SELECT YEAR(sale_date) AS year, QUARTER(sale_date) AS quarter, SUM(amount) AS total_sales
FROM sales
GROUP BY ROLLUP(YEAR(sale_date), QUARTER(sale_date));
```

### Explanation:

-   **GROUP BY ROLLUP(YEAR(sale_date), QUARTER(sale_date))**: Produces subtotals for each year and quarter, and a grand total.

### Example 7: Grouping with CUBE

**Problem:** Generate a report of total sales by year, quarter, and month, with subtotals for each combination.

```sql
SELECT YEAR(sale_date) AS year,
       QUARTER(sale_date) AS quarter,
       MONTH(sale_date) AS month,
       SUM(amount) AS total_sales
FROM sales
GROUP BY CUBE(YEAR(sale_date), QUARTER(sale_date), MONTH(sale_date));
```

### Explanation:

-   **GROUP BY CUBE(YEAR(sale_date), QUARTER(sale_date), MONTH(sale_date))**: Produces subtotals for each combination of year, quarter, and month.

### Example 8: Grouping with Window Functions

**Problem:** Find the cumulative total sales for each department over time.

Assume a `department_sales` table:
| department_id | sale_date | amount |
|---------------|------------|--------|
| 1 | 2021-01-15 | 1000 |
| 1 | 2021-04-20 | 1500 |
| 2 | 2022-02-10 | 2000 |
| 2 | 2022-03-15 | 2500 |

```sql
SELECT department_id, sale_date, amount,
       SUM(amount) OVER (PARTITION BY department_id ORDER BY sale_date) AS cumulative_sales
FROM department_sales;
```

### Explanation:

-   **SUM(amount) OVER (PARTITION BY department_id ORDER BY sale_date)**: Calculates the cumulative total sales for each department over time.

These examples illustrate advanced uses of the `GROUP BY` clause and related concepts, demonstrating how to handle more complex grouping and aggregation tasks in SQL.
