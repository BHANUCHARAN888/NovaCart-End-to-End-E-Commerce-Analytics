CREATE DATABASE novacart;
USE novacart;

-- =========================================
-- Customers
-- =========================================
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15),
    city VARCHAR(50),
    state VARCHAR(50),
    signup_date DATE NOT NULL
);

-- =========================================
-- Products
-- =========================================
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    brand VARCHAR(50),
    unit_price DECIMAL(10,2) NOT NULL,
    stock_quantity INT NOT NULL
);

-- =========================================
-- Orders
-- =========================================
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    order_status ENUM('Completed','Cancelled','Pending') NOT NULL,

    CONSTRAINT fk_customer
        FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);

-- =========================================
-- Order Items
-- =========================================
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,

    CONSTRAINT fk_order
        FOREIGN KEY (order_id)
        REFERENCES orders(order_id),

    CONSTRAINT fk_product
        FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);

-- =========================================
-- Payments
-- =========================================
CREATE TABLE payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT UNIQUE NOT NULL,
    payment_method ENUM(
        'Credit Card',
        'Debit Card',
        'UPI',
        'Net Banking',
        'Cash on Delivery'
    ),
    payment_status ENUM(
        'Success',
        'Failed',
        'Pending'
    ),
    payment_date DATE,

    CONSTRAINT fk_payment_order
        FOREIGN KEY (order_id)
        REFERENCES orders(order_id)
);