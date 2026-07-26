-- ============================== Checking changes 
SET SQL_SAFE_UPDATES = 0;
DELETE FROM products;

ALTER TABLE customers AUTO_INCREMENT = 1;
select count(*) from products;
-- ============================== Checking changes