-- ============================== Checking changes 
SET SQL_SAFE_UPDATES = 0;
DELETE FROM customers;

ALTER TABLE customers AUTO_INCREMENT = 1;
select count(*) from customers;
-- ============================== Checking changes