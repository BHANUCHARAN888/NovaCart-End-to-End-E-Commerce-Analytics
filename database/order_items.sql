desc order_items;
-- ============================== Checking changes 
SET SQL_SAFE_UPDATES = 0;
DELETE FROM order_items;

ALTER TABLE order_items AUTO_INCREMENT = 1;
select count(*) from order_items;
-- ============================== Checking changes