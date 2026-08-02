use novacart;
-- Business Q1: Which payment methods are most preferred by customers?
SELECT 
    p.payment_method AS Payment_Method, COUNT(*) AS Transaction
FROM
    payments p
WHERE
    p.payment_status = 'Success'
GROUP BY p.payment_method
ORDER BY Transaction DESC;
-- Business Q2: What is the payment success rate across different payment methods?
SELECT 
    payment_method,
    COUNT(*) AS total_transactions,
    SUM(CASE
        WHEN payment_status = 'Success' THEN 1
        ELSE 0
    END) AS successful_transactions,
    SUM(CASE
        WHEN payment_status = 'Pending' THEN 1
        ELSE 0
    END) AS Pending_transactions,
    SUM(CASE
        WHEN payment_status = 'Failed' THEN 1
        ELSE 0
    END) AS failed_transactions,
    ROUND(SUM(CASE
                WHEN payment_status = 'Success' THEN 1
                ELSE 0
            END) * 100 / COUNT(*),
            2) AS success_rate_percent
FROM
    payments
GROUP BY payment_method
ORDER BY success_rate_percent DESC;
-- Business Q3: Which payment methods contribute the highest revenue?
SELECT 
    p.payment_method AS Payment_method,
    SUM(oi.quantity * oi.unit_price) AS Revenue
FROM
    payments p
        INNER JOIN
    order_items oi ON p.order_id = oi.order_id
WHERE
    payment_status = 'Success'
GROUP BY p.payment_method
ORDER BY Revenue DESC;
-- Business Q4: How do customer payment preferences vary across different regions?
with Payment_Preference as(select 
c.state as Region,
p.payment_method as Payment_metod,
count(*) as Total_transactions,
RANK() OVER (
            PARTITION BY c.state
            ORDER BY COUNT(*) DESC
        ) AS rnk
from orders o 
inner join customers c 
on c.customer_id = o.customer_id
inner join payments p 
on o.order_id = p.order_id
where p.payment_status = "Success"
group by c.state, p.payment_method)
select
Region, Payment_metod, Total_transactions
from Payment_Preference
where rnk = 1
Order by Region; 
-- Business Q5: How have payment method usage patterns changed over time?
WITH monthly_usage AS (
    SELECT
        DATE_FORMAT(o.order_date, '%Y-%m') AS month,
        p.payment_method,
        COUNT(*) AS total_transactions
    FROM orders o
    JOIN payments p
        ON o.order_id = p.order_id
    WHERE p.payment_status = 'Success'
    GROUP BY
        DATE_FORMAT(o.order_date, '%Y-%m'),
        p.payment_method
)
SELECT
    month,
    payment_method,
    total_transactions,
    total_transactions
        - LAG(total_transactions)
          OVER (
              PARTITION BY payment_method
              ORDER BY month
          ) AS monthly_change
FROM monthly_usage
ORDER BY
    payment_method,
    month;
