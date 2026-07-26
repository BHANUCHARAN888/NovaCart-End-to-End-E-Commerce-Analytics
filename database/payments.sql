DESCRIBE payments;
-- 
SELECT COUNT(*) 
FROM payments;
-- 
SELECT payment_method, count(*)
FROM payments
GROUP BY payment_method;
--
SELECT payment_status, count(*)
FROM payments
GROUP BY payment_status; 