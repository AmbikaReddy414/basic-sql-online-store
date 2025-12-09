/* -----------------------------------------------------------
   BASIC SQL PROJECT – ONLINE STORE DATABASE
   File: 03_queries.sql
   Description: Solutions to 35 SQL practice questions
------------------------------------------------------------ */

/* ==============================
   A. BASIC SELECT + FILTERING
============================== */

-- 1. List all customers
SELECT * FROM customers;

-- 2. Show first_name, last_name, city
SELECT first_name, last_name, city 
FROM customers;

-- 3. Products costing more than 2000
SELECT product_name, price 
FROM products 
WHERE price > 2000;

-- 4. Orders with status = 'Completed'
SELECT order_id, status 
FROM orders 
WHERE status = 'Completed';

-- 5. Customers who live in Mumbai
SELECT first_name, last_name, city 
FROM customers 
WHERE city = 'Mumbai';

-- 6. Products between 500 and 3000
SELECT product_name, price 
FROM products 
WHERE price BETWEEN 500 AND 3000;

-- 7. Orders placed after 2023-07-05
SELECT order_id, order_date 
FROM orders 
WHERE order_date > '2023-07-05';


/* ==============================
   B. SORTING, LIMIT, ALIASES
============================== */

-- 8. Products sorted by price DESC
SELECT * FROM products ORDER BY price DESC;

-- 9. Customers sorted by signup_date ASC
SELECT * FROM customers ORDER BY signup_date ASC;

-- 10. Top 3 most expensive products
SELECT product_name, price
FROM products
ORDER BY price DESC
LIMIT 3;

-- 11. Rename product_name → name and price → cost
SELECT product_name AS name, price AS cost 
FROM products;


/* ==============================
   C. AGGREGATIONS
============================== */

-- 12. Count customers
SELECT COUNT(*) AS total_customers
FROM customers;

-- 13. Average product price
SELECT AVG(price) AS avg_price 
FROM products;

-- 14. Total revenue of completed orders
SELECT SUM(total_amount) AS total_revenue
FROM orders
WHERE status = 'Completed';

-- 15. Min and Max product price
SELECT MIN(price) AS min_price, MAX(price) AS max_price
FROM products;

-- 16. Count products in each category
SELECT category_id, COUNT(product_id) AS product_count
FROM products
GROUP BY category_id;


/* ==============================
   D. GROUP BY + HAVING
============================== */

-- 17. Count customers per city
SELECT city, COUNT(*) AS customer_count
FROM customers
GROUP BY city;

-- 18. Count orders by status
SELECT status, COUNT(*) AS order_count
FROM orders
GROUP BY status;

-- 19. Total spent by each customer
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;

-- 20. Units sold per category
SELECT 
    c.category_name,
    SUM(oi.quantity) AS total_units_sold
FROM categories c
JOIN products p ON c.category_id = p.category_id
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY c.category_name;

-- 21. Categories with total units sold > 2
SELECT 
    c.category_name,
    SUM(oi.quantity) AS total_units_sold
FROM categories c
JOIN products p ON c.category_id = p.category_id
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY c.category_name
HAVING SUM(oi.quantity) > 2;


/* ==============================
   E. JOINS (INNER, LEFT)
============================== */

-- 22. Orders with customer name + order date
SELECT 
    o.order_id,
    c.first_name,
    c.last_name,
    o.order_date
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id;

-- 23. Order items with product name + order date
SELECT 
    oi.order_item_id,
    oi.order_id,
    oi.product_id,
    oi.quantity,
    oi.unit_price,
    p.product_name,
    o.order_date
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id;

-- 24. Customers + number of orders (include zero orders)
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(o.order_id) AS order_count
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;

-- 25. Order + customer name + total quantity
SELECT 
    o.order_id,
    c.first_name,
    c.last_name,
    SUM(oi.quantity) AS total_quantity
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY o.order_id, c.first_name, c.last_name;

-- 26. Products with category name
SELECT 
    p.product_name,
    c.category_name
FROM products p
LEFT JOIN categories c ON p.category_id = c.category_id;


/* ==============================
   F. SUBQUERIES
============================== */

-- 27. Products above average price
SELECT *
FROM products
WHERE price > (SELECT AVG(price) FROM products);

-- 28. Customers who spent more than 30,000 total
SELECT *
FROM (
    SELECT 
        c.customer_id,
        c.first_name,
        c.last_name,
        SUM(o.total_amount) AS total_amount
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    GROUP BY c.customer_id, c.first_name, c.last_name
) AS customer_totals
WHERE total_amount > 30000;

-- 29. Product(s) with highest price
SELECT *
FROM products
WHERE price = (SELECT MAX(price) FROM products);


/* ==============================
   G. DML (INSERT, UPDATE, DELETE)
============================== */

-- 30. Insert a new customer
INSERT INTO customers (customer_id, first_name, last_name, email, city, signup_date)
VALUES (9, 'Karan', 'Mehta', 'karan@example.com', 'Kolkata', '2023-09-01');

-- 31. Insert a new product in Electronics category
INSERT INTO products (product_id, product_name, category_id, price, in_stock)
VALUES (11, 'Smartwatch Pro', 1, 6999, 75);

-- 32. Update Neha’s city to Delhi
UPDATE customers
SET city = 'Delhi'
WHERE first_name = 'Neha' AND last_name = 'Joshi';

-- 33. Reduce stock of Smartphone X by 2
UPDATE products
SET in_stock = in_stock - 2
WHERE product_name = 'Smartphone X';

-- 34. Delete cancelled order + its items
DELETE FROM order_items
WHERE order_id IN (SELECT order_id FROM orders WHERE status = 'Cancelled');

DELETE FROM orders
WHERE status = 'Cancelled';

-- 35. Mark high-value orders
UPDATE orders
SET status = 'High Value'
WHERE total_amount > 5000;
