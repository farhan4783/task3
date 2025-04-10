# task3

# SQL for Data Analysis Task

## 🎯 Objective
Use SQL to extract, manipulate, and analyze data from an e-commerce database using standard queries, joins, subqueries, views, and indexing techniques.

## 🧰 Tools
- MySQL Workbench
- MySQL Server

## 📁 Dataset
Used a mock e-commerce database with tables: `customers`, `orders`, `products`, `order_items`.

## 📌 Task Coverage
- SELECT, WHERE, ORDER BY, GROUP BY
- Aggregate functions (SUM, AVG, COUNT)
- INNER JOIN, LEFT JOIN, RIGHT JOIN
- Subqueries
- Creating Views
- Creating Indexes
- Query Optimization

## 📄 Files
- `queries.sql`: All SQL queries used in the task.
- `screenshots/`: Folder containing output screenshots for each query.

## 📸 Screenshots

### Subquery Example
Query:
```sql
SELECT product_name
FROM products
WHERE product_id IN (
    SELECT product_id FROM order_items WHERE quantity > 5
);
