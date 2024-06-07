Common Table Expressions (CTEs) are a powerful feature in SQL that allow you to create temporary result sets which can be referenced within a `SELECT`, `INSERT`, `UPDATE`, or `DELETE` statement. Here are some examples that demonstrate how to use CTEs for various purposes:

### Example 1: Basic CTE

**Problem:** Create a CTE to find the average salary of employees and then use it to find employees whose salary is above this average.

```sql
WITH AverageSalary AS (
    SELECT AVG(salary) AS avg_salary
    FROM employees
)
SELECT name, salary
FROM employees, AverageSalary
WHERE salary > avg_salary;
```

### Explanation:

-   **WITH AverageSalary AS (...)**: Defines a CTE named `AverageSalary` that calculates the average salary.
-   **Main Query**: Uses the CTE to filter employees whose salary is above the average.

### Example 2: Recursive CTE

**Problem:** Use a recursive CTE to find all employees in a hierarchical organization structure, starting from a specific manager.

Assume the `employees` table has the following columns: `id`, `name`, and `manager_id`.

```sql
WITH RECURSIVE EmployeeHierarchy AS (
    SELECT id, name, manager_id, 1 AS level
    FROM employees
    WHERE manager_id IS NULL  -- Assuming NULL for top-level managers

    UNION ALL

    SELECT e.id, e.name, e.manager_id, eh.level + 1
    FROM employees e
    INNER JOIN EmployeeHierarchy eh ON e.manager_id = eh.id
)
SELECT id, name, manager_id, level
FROM EmployeeHierarchy
ORDER BY level, manager_id;
```

### Explanation:

-   **WITH RECURSIVE EmployeeHierarchy AS (...)**: Defines a recursive CTE to build the hierarchy.
-   **Base Query**: Selects the top-level managers.
-   **Recursive Query**: Joins employees with the previous level to find subordinates.
-   **Main Query**: Selects from the recursive CTE to display the hierarchy.

### Example 3: Multiple CTEs

**Problem:** Use multiple CTEs to break down a complex query into manageable parts.

```sql
WITH DepartmentSalaries AS (
    SELECT department_id, SUM(salary) AS total_salary
    FROM employees
    GROUP BY department_id
),
HighSalaryDepartments AS (
    SELECT department_id
    FROM DepartmentSalaries
    WHERE total_salary > 100000
)
SELECT e.name, e.department_id
FROM employees e
INNER JOIN HighSalaryDepartments hsd ON e.department_id = hsd.department_id;
```

### Explanation:

-   **First CTE (`DepartmentSalaries`)**: Calculates total salary for each department.
-   **Second CTE (`HighSalaryDepartments`)**: Selects departments with total salary over 100,000.
-   **Main Query**: Joins employees with high salary departments to get the desired result.

### Example 4: CTE with Window Functions

**Problem:** Use a CTE to find the top 3 highest-paid employees in each department.

```sql
WITH RankedSalaries AS (
    SELECT id, name, salary, department_id,
           RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS rank
    FROM employees
)
SELECT id, name, salary, department_id
FROM RankedSalaries
WHERE rank <= 3
ORDER BY department_id, rank;
```

### Explanation:

-   **WITH RankedSalaries AS (...)**: Defines a CTE that ranks employees by salary within each department.
-   **Main Query**: Selects top 3 employees from each department based on the rank.

### Example 5: CTE for Data Transformation

**Problem:** Use a CTE to transform and summarize sales data.

Assume a `sales` table:
| sale_id | sale_date | amount | customer_id |
|---------|------------|--------|-------------|
| 1 | 2021-01-15 | 1000 | 1 |
| 2 | 2021-01-20 | 1500 | 2 |
| 3 | 2021-02-10 | 2000 | 1 |

```sql
WITH MonthlySales AS (
    SELECT DATE_TRUNC('month', sale_date) AS sale_month, SUM(amount) AS total_sales
    FROM sales
    GROUP BY sale_month
)
SELECT sale_month, total_sales
FROM MonthlySales
ORDER BY sale_month;
```

### Explanation:

-   **WITH MonthlySales AS (...)**: Defines a CTE that aggregates sales data by month.
-   **Main Query**: Selects and orders the summarized sales data.

### Example 6: CTE for Complex Joins

**Problem:** Use a CTE to simplify a complex join between multiple tables.

Assume the following tables: `orders`, `customers`, and `order_items`.

```sql
WITH OrderTotals AS (
    SELECT o.customer_id, o.order_id, SUM(oi.quantity * oi.price) AS order_total
    FROM orders o
    INNER JOIN order_items oi ON o.order_id = oi.order_id
    GROUP BY o.customer_id, o.order_id
)
SELECT c.customer_name, ot.order_id, ot.order_total
FROM customers c
INNER JOIN OrderTotals ot ON c.customer_id = ot.customer_id
ORDER BY c.customer_name, ot.order_total DESC;
```

### Explanation:

-   **WITH OrderTotals AS (...)**: Defines a CTE that calculates total amount for each order.
-   **Main Query**: Joins the CTE with customers to display customer names and their order totals.

These examples demonstrate how CTEs can be used for simplifying complex queries, improving readability, and performing advanced data transformations and aggregations. Practicing these examples will help you understand the versatility and power of CTEs in SQL.
