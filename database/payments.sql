DESCRIBE payments;
SELECT COUNT(*) 
FROM payments;
SELECT payment_method, count(*)
FROM payments
GROUP BY payment_method;