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


### Advanced SQL Join Examples

To illustrate more complex SQL join operations, let's use two tables: `orders` and `customers`. Below are their structures and sample data:

#### `customers` Table

| customer_id | name      | city         |
|-------------|-----------|--------------|
| 1           | Alice     | New York     |
| 2           | Bob       | Los Angeles  |
| 3           | Charlie   | Chicago      |
| 4           | David     | San Francisco|

#### `orders` Table

| order_id | customer_id | amount | order_date |
|----------|-------------|--------|------------|
| 101      | 1           | 300    | 2023-06-15 |
| 102      | 2           | 150    | 2023-06-18 |
| 103      | 1           | 200    | 2023-06-20 |
| 104      | 3           | 450    | 2023-06-25 |
| 105      | 5           | 100    | 2023-06-30 |

### Example 1: INNER JOIN with Multiple Conditions and Aggregation

**Objective:** Find the total order amount for each customer who has placed orders after `2023-06-18`.

```sql
SELECT c.name, SUM(o.amount) AS total_amount
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_date > '2023-06-18'
GROUP BY c.name;
```

**Explanation:**
- This query joins the `customers` and `orders` tables.
- It filters orders placed after `2023-06-18`.
- It groups the results by customer name and calculates the total order amount for each customer.

### Example 2: LEFT JOIN with a Subquery

**Objective:** List all customers along with their total order amount. Include customers who have not placed any orders, showing their total order amount as `NULL`.

```sql
SELECT c.name, sub.total_amount
FROM customers c
LEFT JOIN (
    SELECT customer_id, SUM(amount) AS total_amount
    FROM orders
    GROUP BY customer_id
) sub ON c.customer_id = sub.customer_id;
```

**Explanation:**
- The subquery calculates the total order amount for each customer.
- The outer query performs a `LEFT JOIN` to include all customers, even those without orders.
- The result includes the customer name and their total order amount or `NULL` if they haven't placed any orders.

### Example 3: Self JOIN

**Objective:** Find customers who live in the same city.

```sql
SELECT c1.name AS customer1, c2.name AS customer2, c1.city
FROM customers c1
INNER JOIN customers c2 ON c1.city = c2.city AND c1.customer_id < c2.customer_id;
```

**Explanation:**
- This query joins the `customers` table with itself.
- It matches customers living in the same city, ensuring that each pair of customers is listed only once by using `c1.customer_id < c2.customer_id`.

### Example 4: FULL OUTER JOIN with COALESCE

**Objective:** List all customers and their orders, including customers without orders and orders without matching customers.

```sql
SELECT COALESCE(c.name, 'Unknown') AS customer_name, o.amount, o.order_date
FROM customers c
FULL OUTER JOIN orders o ON c.customer_id = o.customer_id;
```

**Explanation:**
- The `FULL OUTER JOIN` returns all rows from both tables.
- The `COALESCE` function replaces `NULL` customer names with 'Unknown' for orders without matching customers.

### Example 5: LEFT JOIN with Filtering on the Joined Table

**Objective:** List all customers and their last order amount. If a customer has no orders, show `NULL`.

```sql
SELECT c.name, o.amount AS last_order_amount
FROM customers c
LEFT JOIN (
    SELECT customer_id, amount
    FROM orders
    WHERE order_date = (SELECT MAX(order_date) FROM orders WHERE customer_id = orders.customer_id)
) o ON c.customer_id = o.customer_id;
```

**Explanation:**
- The subquery selects the latest order for each customer.
- The outer query performs a `LEFT JOIN` to include all customers, showing the amount of their last order or `NULL` if they haven't placed any orders.

### Example 6: CROSS JOIN with Complex Condition

**Objective:** Generate all possible pairs of customers and orders, but only include pairs where the customer lives in the same city where the order was placed.

Assuming we have a `cities` table where orders were placed:

#### `cities` Table

| order_id | city         |
|----------|--------------|
| 101      | New York     |
| 102      | Los Angeles  |
| 103      | New York     |
| 104      | Chicago      |
| 105      | San Francisco|

```sql
SELECT c.name AS customer_name, o.order_id, o.amount
FROM customers c
CROSS JOIN orders o
JOIN cities ct ON o.order_id = ct.order_id
WHERE c.city = ct.city;
```

**Explanation:**
- This query generates all possible pairs of customers and orders using `CROSS JOIN`.
- It then filters the pairs based on the condition that the customer's city matches the city where the order was placed.



### Example 7: Multi-Table Join with Aggregation and Filtering

**Objective:** List the customers along with the total amount they have spent on orders that are above the average order amount.

#### Tables:

- `customers`: As defined previously.
- `orders`: As defined previously.

```sql
SELECT c.name, SUM(o.amount) AS total_spent
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
WHERE o.amount > (SELECT AVG(amount) FROM orders)
GROUP BY c.name
HAVING SUM(o.amount) > 0;
```

**Explanation:**
- This query joins the `customers` and `orders` tables.
- It filters orders to include only those with amounts greater than the average order amount.
- It groups the results by customer name and calculates the total amount spent.
- The `HAVING` clause ensures only customers who have spent more than 0 are included.

### Example 8: Join with Window Functions

**Objective:** List each order with the total amount spent by the same customer in all their orders.

#### Tables:

- `customers`: As defined previously.
- `orders`: As defined previously.

```sql
SELECT o.order_id, c.name, o.amount, SUM(o.amount) OVER (PARTITION BY o.customer_id) AS total_spent
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id;
```

**Explanation:**
- This query joins the `orders` and `customers` tables.
- It uses the `SUM` window function to calculate the total amount spent by each customer across all their orders.
- The `PARTITION BY` clause groups the calculations by customer.

### Example 9: Subquery in Join Condition

**Objective:** List customers and their orders, including only the most recent order for each customer.

#### Tables:

- `customers`: As defined previously.
- `orders`: As defined previously.

```sql
SELECT c.name, o.order_id, o.amount, o.order_date
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
INNER JOIN (
    SELECT customer_id, MAX(order_date) AS max_order_date
    FROM orders
    GROUP BY customer_id
) mo ON o.customer_id = mo.customer_id AND o.order_date = mo.max_order_date;
```

**Explanation:**
- This query joins the `customers` and `orders` tables.
- It uses a subquery to find the most recent order date for each customer.
- It joins this subquery with the `orders` table to get details of the most recent orders.

### Example 10: Join with Conditional Aggregation

**Objective:** List customers and their total number of orders, total amount spent, and the number of orders that are above a certain threshold.

#### Tables:

- `customers`: As defined previously.
- `orders`: As defined previously.

```sql
SELECT c.name, 
       COUNT(o.order_id) AS total_orders,
       SUM(o.amount) AS total_spent,
       SUM(CASE WHEN o.amount > 200 THEN 1 ELSE 0 END) AS orders_above_200
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.name;
```

**Explanation:**
- This query joins the `customers` and `orders` tables.
- It uses conditional aggregation to count orders above a certain threshold (200 in this case).
- It groups the results by customer name.

### Example 11: Self Join with Aggregation

**Objective:** Find pairs of customers who have placed orders in the same month.

#### Tables:

- `customers`: As defined previously.
- `orders`: As defined previously.

```sql
SELECT c1.name AS customer1, c2.name AS customer2, DATE_FORMAT(o1.order_date, '%Y-%m') AS order_month
FROM customers c1
INNER JOIN orders o1 ON c1.customer_id = o1.customer_id
INNER JOIN orders o2 ON DATE_FORMAT(o1.order_date, '%Y-%m') = DATE_FORMAT(o2.order_date, '%Y-%m')
INNER JOIN customers c2 ON o2.customer_id = c2.customer_id AND c1.customer_id < c2.customer_id
GROUP BY customer1, customer2, order_month;
```

**Explanation:**
- This query performs multiple joins to find customers who have placed orders in the same month.
- It uses a self-join on the `orders` table to match orders from the same month.
- It ensures each pair is listed only once by using `c1.customer_id < c2.customer_id`.

### Example 12: Recursive CTE with Join

**Objective:** Find a hierarchical structure of departments and employees, where each department can have a parent department.

#### Tables:

- `departments` Table

| department_id | name           | parent_department_id |
|---------------|----------------|----------------------|
| 1             | HR             | NULL                 |
| 2             | IT             | 1                    |
| 3             | Development    | 2                    |
| 4             | Marketing      | NULL                 |

- `employees` Table: As defined previously.

```sql
WITH RECURSIVE department_hierarchy AS (
    SELECT department_id, name, parent_department_id, 1 AS level
    FROM departments
    WHERE parent_department_id IS NULL
    UNION ALL
    SELECT d.department_id, d.name, d.parent_department_id, dh.level + 1
    FROM departments d
    INNER JOIN department_hierarchy dh ON d.parent_department_id = dh.department_id
)
SELECT dh.level, dh.name AS department_name, e.name AS employee_name
FROM department_hierarchy dh
LEFT JOIN employees e ON dh.department_id = e.department_id
ORDER BY dh.level, department_name;
```

**Explanation:**
- This query uses a recursive CTE to build a hierarchy of departments.
- It joins this hierarchy with the `employees` table to list employees under each department.
- It orders the results by hierarchy level and department name.

### Conclusion

These advanced examples demonstrate the versatility and power of SQL joins in complex scenarios. Understanding how to combine joins with subqueries, window functions, conditional aggregation, self-joins, and recursive CTEs allows you to tackle a wide range of data retrieval and manipulation tasks efficiently.