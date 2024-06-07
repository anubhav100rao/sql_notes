Certainly! Below are some advanced examples involving various types of SQL JOINs. These examples will help you understand how to work with complex data relationships.

### Example 1: Self Join

**Problem:** Find pairs of employees who work in the same department.

```sql
SELECT e1.name AS employee1, e2.name AS employee2, e1.department_id
FROM employees e1
INNER JOIN employees e2 ON e1.department_id = e2.department_id
WHERE e1.id < e2.id;
```

### Explanation:

-   **Self Join**: The `employees` table is joined with itself to find pairs of employees in the same department.
-   **Condition**: The condition `e1.id < e2.id` ensures that each pair is unique and avoids pairing an employee with themselves.

### Example 2: Full Outer Join

**Problem:** List all departments and the number of employees in each department, including departments with no employees.

```sql
SELECT d.department_name, COUNT(e.id) AS num_employees
FROM departments d
LEFT JOIN employees e ON d.id = e.department_id
GROUP BY d.department_name
UNION
SELECT d.department_name, 0 AS num_employees
FROM departments d
WHERE d.id NOT IN (SELECT department_id FROM employees);
```

### Explanation:

-   **LEFT JOIN**: Retrieves all departments and their associated employees.
-   **GROUP BY**: Groups the result by department name to count the number of employees.
-   **UNION**: Combines the result with departments that have no employees.

### Example 3: Finding Orphan Records with LEFT JOIN

**Problem:** Find all employees who are not assigned to any department.

```sql
SELECT e.name
FROM employees e
LEFT JOIN departments d ON e.department_id = d.id
WHERE d.id IS NULL;
```

### Explanation:

-   **LEFT JOIN**: Retrieves all employees and their associated departments.
-   **WHERE d.id IS NULL**: Filters the result to find employees with no corresponding department.

### Example 4: Joining Multiple Tables

**Problem:** Retrieve the names of employees and their manager's name, assuming the `employees` table has a `manager_id` field referencing another employee.

```sql
SELECT e.name AS employee_name, m.name AS manager_name
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.id;
```

### Explanation:

-   **LEFT JOIN**: Joins the `employees` table with itself to retrieve the manager's name for each employee.
-   **e.manager_id = m.id**: Links an employee to their manager.

### Example 5: Three-Way Join

**Problem:** Retrieve the names of employees, their department name, and the project name they are working on.

Assume an additional table `projects`:
| id | project_name | department_id |
|-----|--------------|---------------|
| 1 | Project X | 1 |
| 2 | Project Y | 2 |

```sql
SELECT e.name AS employee_name, d.department_name, p.project_name
FROM employees e
INNER JOIN departments d ON e.department_id = d.id
INNER JOIN projects p ON d.id = p.department_id;
```

### Explanation:

-   **INNER JOIN**: Combines `employees`, `departments`, and `projects` tables based on their relationships.

### Example 6: Using CROSS JOIN

**Problem:** List all possible pairs of department names and project names.

```sql
SELECT d.department_name, p.project_name
FROM departments d
CROSS JOIN projects p;
```

### Explanation:

-   **CROSS JOIN**: Produces a Cartesian product of the `departments` and `projects` tables, generating all possible pairs.

### Example 7: Conditional Join with CASE

**Problem:** Retrieve employees along with their department names, and if they don't belong to any department, show 'No Department'.

```sql
SELECT e.name,
       CASE
           WHEN d.department_name IS NOT NULL THEN d.department_name
           ELSE 'No Department'
       END AS department_name
FROM employees e
LEFT JOIN departments d ON e.department_id = d.id;
```

### Explanation:

-   **LEFT JOIN**: Ensures all employees are included, even those without a department.
-   **CASE**: Handles the scenario where an employee does not belong to any department.

### Example 8: Multi-Column Join

**Problem:** Retrieve employee names and their projects based on multiple matching conditions.

Assume an additional table `employee_projects`:
| employee_id | project_id | role |
|-------------|------------|-------------|
| 1 | 1 | Developer |
| 2 | 2 | Manager |
| 3 | 1 | Tester |

```sql
SELECT e.name, p.project_name, ep.role
FROM employees e
INNER JOIN employee_projects ep ON e.id = ep.employee_id
INNER JOIN projects p ON ep.project_id = p.id
WHERE ep.role = 'Developer';
```

### Explanation:

-   **INNER JOIN**: Joins `employees`, `employee_projects`, and `projects` based on multiple matching conditions.
-   **WHERE**: Filters the result to include only those with the role of 'Developer'.

These advanced examples of JOINs cover a range of scenarios, including self joins, full outer joins, conditional joins, and multi-table joins. Practicing these examples will help you handle complex SQL queries effectively during interviews.
