-- Step 1: Create the database
CREATE DATABASE nikes;

-- Step 2: Switch to the nike database
USE nikes;

-- Step 3: Create tables
CREATE TABLE categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL
);

CREATE TABLE suppliers (
    supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_name VARCHAR(100) NOT NULL,
    contact_name VARCHAR(100),
    contact_email VARCHAR(100)
);

CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    contact_email VARCHAR(100)
);

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category_id INT,
    supplier_id INT,
    price DECIMAL(10, 2),
    stock_quantity INT,
    FOREIGN KEY (category_id) REFERENCES categories(category_id),
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
);

-- Step 4: Insert sample data into the categories table
INSERT INTO categories (category_name) VALUES
('Shoes'), 
('Soccer'), 
('Apparel'), 
('Golf'), 
('Accessories');

-- Step 5: Insert sample data into the suppliers table
INSERT INTO suppliers (supplier_name, contact_name, contact_email) VALUES
('Supplier One', 'John Doe', 'john@supplierone.com'),
('Supplier Two', 'Jane Smith', 'jane@suppliertwo.com'),
('Supplier Three', 'Bob Brown', 'bob@supplierthree.com');

-- Step 6: Insert sample data into the customers table
INSERT INTO customers (customer_name, contact_email) VALUES
('Alice Johnson', 'alice@domain.com'),
('Bob Williams', 'bob@domain.com'),
('Charlie Brown', 'charlie@domain.com');

-- Step 7: Insert sample data into the orders table
INSERT INTO orders (customer_id, order_date, total_amount) VALUES
(1, '2023-07-01', 300.00),
(2, '2023-07-05', 150.00),
(3, '2023-07-10', 200.00);

-- Step 8: Insert sample data into the order_items table
INSERT INTO order_items (order_id, product_id, quantity) VALUES
(1, 1, 2),
(1, 2, 1),
(2, 3, 1),
(3, 4, 1),
(3, 5, 2);

-- Step 9: Insert sample data into the products table
INSERT INTO products (product_name, category_id, supplier_id, price, stock_quantity) VALUES
('Nike Air Max 90', 1, 1, 120.00, 50),
('Nike Air Force 1', 1, 2, 110.00, 45),
('Nike Dunk Low', 1, 3, 100.00, 40),
('Nike React Infinity Run', 1, 1, 160.00, 35),
('Nike Blazer Mid', 1, 2, 130.00, 50),
('Nike Pegasus 37', 1, 3, 120.00, 60),
('Nike ZoomX Vaporfly', 1, 1, 250.00, 20),
('Nike Air Zoom Tempo', 1, 2, 200.00, 30),
('Nike Free RN 5.0', 1, 3, 100.00, 55),
('Nike Joyride Run', 1, 1, 140.00, 40),
('Nike Phantom GT', 2, 2, 200.00, 25),
('Nike Mercurial Superfly', 2, 3, 275.00, 15),
('Nike Tiempo Legend', 2, 1, 230.00, 20),
('Nike Phantom Vision', 2, 2, 250.00, 10),
('Nike Vapor 13', 2, 3, 260.00, 20),
('Nike Phantom VNM', 2, 1, 240.00, 30),
('Nike Premier II', 2, 2, 120.00, 50),
('Nike Lunar Gato', 2, 3, 140.00, 35),
('Nike Streetgato', 2, 1, 100.00, 40),
('Nike Phantom GT2', 2, 2, 210.00, 25),
('Nike Pro Top', 3, 3, 35.00, 100),
('Nike Dri-FIT Tee', 3, 1, 25.00, 150),
('Nike Club Fleece', 3, 2, 60.00, 80),
('Nike Sportswear Hoodie', 3, 3, 70.00, 70),
('Nike Training Shorts', 3, 1, 30.00, 120),
('Nike Yoga Pants', 3, 2, 50.00, 90),
('Nike Windrunner Jacket', 3, 3, 90.00, 60),
('Nike Running Cap', 3, 1, 20.00, 200),
('Nike Elite Socks', 3, 2, 15.00, 250),
('Nike ACG Jacket', 3, 3, 200.00, 40),
('Nike Vapor Golf', 4, 1, 300.00, 10),
('Nike Air Zoom Infinity', 4, 2, 250.00, 20),
('Nike Roshe G', 4, 3, 120.00, 30),
('Nike Victory G Lite', 4, 1, 150.00, 25),
('Nike Lunar Control', 4, 2, 180.00, 15),
('Nike Flex Golf', 4, 3, 100.00, 35),
('Nike Explorer 2', 4, 1, 140.00, 20),
('Nike Air Zoom Victory', 4, 2, 160.00, 25),
('Nike Premier Golf', 4, 3, 200.00, 20),
('Nike Flyknit Elite', 4, 1, 220.00, 15),
('Nike AeroBill Classic', 5, 2, 25.00, 150),
('Nike Heritage 86', 5, 3, 30.00, 100),
('Nike Fanny Pack', 5, 1, 35.00, 90),
('Nike Heritage Backpack', 5, 2, 50.00, 60),
('Nike Elite Backpack', 5, 3, 80.00, 50),
('Nike Gym Sack', 5, 1, 20.00, 120),
('Nike Yoga Mat', 5, 2, 40.00, 70),
('Nike Training Belt', 5, 3, 25.00, 100),
('Nike Resistance Band', 5, 1, 15.00, 150);

-- Step 10: JOIN queries

-- 1. Retrieve all products along with their category names
SELECT p.product_name, c.category_name
FROM products p
JOIN categories c ON p.category_id = c.category_id;

-- 2. Retrieve all products along with their supplier names
SELECT p.product_name, s.supplier_name
FROM products p
JOIN suppliers s ON p.supplier_id = s.supplier_id;

-- 3. Retrieve all orders along with customer names
SELECT o.order_id, c.customer_name, o.order_date, o.total_amount
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id;

-- 4. Retrieve all order items along with product names and quantities
SELECT oi.order_id, p.product_name, oi.quantity
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id;

-- 5. Retrieve all orders along with customer names and ordered product names
SELECT o.order_id, c.customer_name, p.product_name, oi.quantity
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id;
# Retrieve the most expensive product in each category:
SELECT category_name, product_name, price
FROM products p
JOIN categories c ON p.category_id = c.category_id
WHERE price = (
    SELECT MAX(price) 
    FROM products 
    WHERE category_id = p.category_id
);

# Retrieve the names of customers who have placed orders with a total amount greater than $200:
SELECT customer_name, total_amount
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE total_amount > (
    SELECT AVG(total_amount) 
    FROM orders
);

# Retrieve the name of the supplier who supplies the product with the highest price:
SELECT supplier_name, product_name, price
FROM suppliers s
JOIN products p ON s.supplier_id = p.supplier_id
WHERE price = (
    SELECT MAX(price) 
    FROM products
);

# Retrieve the product names and quantities for the orders placed by 'Alice Johnson':
SELECT product_name, quantity
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
WHERE order_id IN (
    SELECT order_id
    FROM orders
    WHERE customer_id = (
        SELECT customer_id 
        FROM customers 
        WHERE customer_name = 'Alice Johnson'
    )
);

# Retrieve the names of products that have a stock quantity less than the average stock quantity of all products:
SELECT product_name, stock_quantity
FROM products
WHERE stock_quantity < (
    SELECT AVG(stock_quantity) 
    FROM products
);

Conclusion of the Nike Database Project
The Nike Database Project was designed to create a structured and efficient database system for managing various aspects of Nike's product inventory, suppliers, customers, and orders. The project involved several key steps, including the creation of multiple tables, insertion of sample data, and execution of complex queries to extract meaningful insights. Here are the main accomplishments and learnings from the project:

Database Creation:

Successfully created the nike database, which includes tables for products, categories, suppliers, customers, orders, and order_items.
Defined relationships between tables using foreign keys to maintain data integrity and enable efficient querying.
Data Insertion:

Inserted sample data into all tables, ensuring a diverse range of products, categories, suppliers, customers, and orders.
Demonstrated how to populate tables with realistic






