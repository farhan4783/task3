-- 1. Basic SELECT + WHERE + ORDER BY
SELECT * 
FROM customers 
WHERE city = 'New York' 
ORDER BY name ASC;

-- 2. GROUP BY with aggregate functions
SELECT city, COUNT(*) AS customer_count 
FROM customers 
GROUP BY city 
ORDER BY customer_count DESC;

-- 3. INNER JOIN
SELECT o.order_id, c.name AS customer_name, o.order_date, o.total_amount
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id;

-- 4. LEFT JOIN
SELECT c.name, o.order_id, o.total_amount
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id;

-- 5. RIGHT JOIN (Note: MySQL supports RIGHT JOIN, but use carefully)
SELECT o.order_id, c.name, o.total_amount
FROM orders o
RIGHT JOIN customers c ON o.customer_id = c.customer_id;

-- 6. Subquery: Customers who placed more than 3 orders
SELECT name 
FROM customers 
WHERE customer_id IN (
    SELECT customer_id 
    FROM orders 
    GROUP BY customer_id 
    HAVING COUNT(order_id) > 3
);

-- 7. Aggregate: Average order amount
SELECT AVG(total_amount) AS avg_order_amount 
FROM orders;

-- 8. Create a view: Frequent customers
CREATE VIEW frequent_customers AS
SELECT c.customer_id, c.name, COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id
HAVING total_orders > 5;

-- 9. Create an index on orders table to optimize search by order_date
CREATE INDEX idx_order_date ON orders(order_date);
