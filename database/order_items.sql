desc order_items;
-- ============================== Checking changes 
SET SQL_SAFE_UPDATES = 0;
DELETE FROM order_items;

ALTER TABLE order_items AUTO_INCREMENT = 1;
select count(*) from order_items;
-- ============================== Checking changes
-- Average of order items from orders
SELECT
    ROUND(COUNT(*) / COUNT(DISTINCT order_id), 2) AS avg_items_per_order
FROM order_items;