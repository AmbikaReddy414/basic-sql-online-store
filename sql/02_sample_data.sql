INSERT INTO categories (category_id, category_name) VALUES
(1, 'Electronics'),
(2, 'Books'),
(3, 'Clothing'),
(4, 'Home & Kitchen'),
(5, 'Sports');

INSERT INTO customers (customer_id, first_name, last_name, email, city, signup_date) VALUES
(1, 'Amit', 'Sharma', 'amit@example.com', 'Delhi', '2023-01-10'),
(2, 'Priya', 'Gupta', 'priya@example.com', 'Mumbai', '2023-02-15'),
(3, 'Rahul', 'Verma', 'rahul@example.com', 'Bangalore', '2023-03-20'),
(4, 'Sneha', 'Patel', 'sneha@example.com', 'Delhi', '2023-04-05'),
(5, 'Vikram','Singh', 'vikram@example.com','Chennai','2023-05-01'),
(6, 'Neha',  'Joshi', 'neha@example.com','Pune','2023-06-12'),
(7, 'Rohan', 'Kumar','rohan@example.com','Mumbai','2023-07-03'),
(8, 'Anita', 'Rao','anita@example.com','Hyderabad','2023-08-22');

INSERT INTO products (product_id, product_name, category_id, price, in_stock) VALUES
(1, 'Smartphone X', 1, 25000.00, 50),
(2, 'Wireless Earbuds', 1, 3500.00, 120),
(3, 'Laptop Pro', 1, 75000.00, 20),
(4, 'Fiction Novel', 2, 499.00, 200),
(5, 'Cookbook', 2, 799.00, 150),
(6, 'T-Shirt', 3, 599.00, 300),
(7, 'Jeans', 3, 1499.00, 180),
(8, 'Blender', 4, 2499.00, 60),
(9, 'Yoga Mat', 5, 999.00, 100),
(10, 'Cricket Bat', 5, 1999.00, 40);

INSERT INTO orders VALUES
(1, 1, '2023-07-01', 'Completed', 28500.00),
(2, 2, '2023-07-03', 'Completed', 3998.00),
(3, 3, '2023-07-05', 'Cancelled', 1499.00),
(4, 4, '2023-07-08', 'Completed', 3297.00),
(5, 5, '2023-07-10', 'Completed', 77000.00),
(6, 6, '2023-07-12', 'Completed', 2499.00),
(7, 7, '2023-07-15', 'Pending', 999.00),
(8, 8, '2023-07-18', 'Completed', 3497.00);

INSERT INTO order_items VALUES
(1, 1, 1, 1, 25000.00),
(2, 1, 2, 1, 3500.00),
(3, 2, 4, 2, 499.00),
(4, 2, 9, 1, 999.00),
(5, 3, 7, 1, 1499.00),
(6, 4, 6, 3, 599.00),
(7, 4, 2, 1, 3500.00),
(8, 5, 3, 1, 75000.00),
(9, 5, 2, 1, 3500.00),
(10, 6, 8, 1, 2499.00),
(11, 7, 9, 1, 999.00),
(12, 8, 6, 1, 599.00),
(13, 8, 4, 2, 499.00);
