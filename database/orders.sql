DESCRIBE orders;
ALTER TABLE orders
ADD COLUMN total_amount DECIMAL(10,2) DEFAULT 0.00;
-- ============================== Checking changes 
SET SQL_SAFE_UPDATES = 0;
DELETE FROM orders;

ALTER TABLE orders AUTO_INCREMENT = 1;
select count(*) from orders;
-- ============================== Checking changes