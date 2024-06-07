Sure, let's dive into some more advanced examples using subqueries. These examples will cover various scenarios and will help you understand the power and flexibility of subqueries in SQL.

### Example 1: Correlated Subquery

**Problem:** Find employees whose salary is above the average salary of their department.

```sql
SELECT e1.name, e1.salary, e1.department_id
FROM employees e1
WHERE e1.salary > (
    SELECT AVG(e2.salary)
    FROM employees e2
    WHERE e2.department_id = e1.department_id
);
```

### Explanation:

-   **Inner Subquery:** Calculates the average salary for each department.
-   **Outer Query:** Selects employees whose salary is greater than the average salary of their respective department.

### Example 2: Nested Subqueries

**Problem:** Retrieve the names of employees who work in the department with the highest average salary.

```sql
SELECT name
FROM employees
WHERE department_id = (
    SELECT department_id
    FROM (
        SELECT department_id, AVG(salary) AS avg_salary
        FROM employees
        GROUP BY department_id
        ORDER BY avg_salary DESC
        LIMIT 1
    ) AS highest_avg_salary_dept
);
```

### Explanation:

-   **Innermost Subquery:** Calculates the average salary for each department and sorts them in descending order.
-   **Second-Level Subquery:** Limits the result to the department with the highest average salary.
-   **Outer Query:** Selects employees who belong to the department with the highest average salary.

### Example 3: Using EXISTS with Subqueries

**Problem:** Find departments that have more than 3 employees.

```sql
SELECT department_name
FROM departments d
WHERE EXISTS (
    SELECT 1
    FROM employees e
    WHERE e.department_id = d.id
    GROUP BY e.department_id
    HAVING COUNT(*) > 3
);
```

### Explanation:

-   **Subquery:** Groups employees by department and filters those departments with more than 3 employees.
-   **EXISTS Clause:** Checks if there is any department that meets the criteria specified in the subquery.

### Example 4: Subquery in SELECT Clause

**Problem:** Retrieve the names of employees and their respective department names using a subquery in the SELECT clause.

```sql
SELECT e.name,
       (SELECT d.department_name
        FROM departments d
        WHERE d.id = e.department_id) AS department_name
FROM employees e;
```

### Explanation:

-   **Subquery in SELECT Clause:** Retrieves the department name for each employee by matching `department_id` from the `departments` table.

### Example 5: Subquery with Multiple Conditions

**Problem:** Find the employees who have the maximum salary in their respective departments.

```sql
SELECT name, salary, department_id
FROM employees e1
WHERE salary = (
    SELECT MAX(salary)
    FROM employees e2
    WHERE e1.department_id = e2.department_id
);
```

### Explanation:

-   **Subquery:** Finds the maximum salary for each department.
-   **Outer Query:** Selects employees who have the maximum salary in their respective department.

### Example 6: Using Subqueries with Aggregation Functions

**Problem:** List the departments where the total salary expenditure exceeds 200,000.

```sql
SELECT department_name
FROM departments d
WHERE (
    SELECT SUM(salary)
    FROM employees e
    WHERE e.department_id = d.id
) > 200000;
```

### Explanation:

-   **Subquery:** Calculates the total salary for each department.
-   **Outer Query:** Filters departments where the total salary exceeds 200,000.

### Example 7: Combining Subqueries and Window Functions

**Problem:** Find the top 3 highest-paid employees in each department.

```sql
SELECT name, salary, department_id
FROM (
    SELECT name, salary, department_id,
           RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS rank
    FROM employees
) ranked_employees
WHERE rank <= 3;
```

### Explanation:

-   **Inner Query:** Uses the `RANK()` window function to assign a rank to employees within each department based on salary.
-   **Outer Query:** Filters employees to return only the top 3 highest-paid in each department.

### Example 8: Complex Subquery with Multiple Tables

**Problem:** Retrieve the names of employees who have never managed a project.

Assume we have an additional table `projects`:

**projects**
| id | project_name | manager_id |
|-----|--------------|------------|
| 1 | Project X | 2 |
| 2 | Project Y | 3 |

```sql
SELECT name
FROM employees e
WHERE NOT EXISTS (
    SELECT 1
    FROM projects p
    WHERE p.manager_id = e.id
);
```

### Explanation:

-   **Subquery:** Checks for the existence of any project managed by an employee.
-   **NOT EXISTS Clause:** Filters out employees who have managed a project.

These examples should give you a solid understanding of how to use subqueries in various complex scenarios. Practicing these will enhance your SQL skills and prepare you for challenging interview questions.
