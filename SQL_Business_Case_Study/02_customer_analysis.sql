-- Business Q1: Which customer segments contribute the highest revenue across different product categories?
with customer_revenue as(
SELECT 
    CONCAT(c.first_name, ' ', c.last_name) AS Customer_name,
    p.category AS Category,
    SUM(oi.quantity * oi.unit_price) AS Revenue
FROM
    orders o
        INNER JOIN
    order_items oi ON o.order_id = oi.order_id
        INNER JOIN
    customers c ON o.customer_id = c.customer_id
        INNER JOIN
    products p ON oi.product_id = p.product_id
        INNER JOIN
    payments py ON o.order_id = py.order_id
WHERE
    py.payment_status = 'Success'
GROUP BY Customer_name , Category
ORDER BY Revenue DESC)

select 
Customer_name,
case
    when Revenue>=20000 then "High"
    when Revenue>=15000 then "Medium"
    else "Low"
    end as Segment,
Category,
Revenue
from customer_revenue;
-- Business Q2: Which customers make repeat purchases within a 90-day period?
with customer_order as (select 
concat(c.first_name," ",c.last_name) as Customer,
o.order_id as Order_id,
lag(o.order_date) over(
partition by c.customer_id
order by o.order_date
) as Previous_date,
o.order_date as Order_date
from orders o
inner join payments py
on o.order_id = py.order_id
inner join customers c
on o.customer_id = c.customer_id
where py.payment_status = "Success"),

customer_days as (
SELECT
	Customer,
    Order_date,
    Previous_date,
    DATEDIFF(Order_date, Previous_date) AS Days_Between
FROM customer_order
)
select 
Customer,
Previous_date,
Order_date,
Days_Between,
CASE
    WHEN Days_Between IS NULL THEN 'First Purchase'
    WHEN Days_Between <= 90 THEN 'Repeated'
    ELSE 'Not Repeated'
END AS Repeat_or_Not
from customer_days
where Days_Between<=90;
-- Business Q3: Which regions generate the highest customer demand and revenue?
SELECT 
    c.state AS State,
    COUNT(DISTINCT o.order_id) AS Total_order,
    SUM(oi.quantity * oi.unit_price) AS Revenue
FROM
    orders o
        INNER JOIN
    order_items oi ON o.order_id = oi.order_id
        INNER JOIN
    customers c ON o.customer_id = c.customer_id
        INNER JOIN
    payments p ON o.order_id = p.order_id
WHERE
    p.payment_status = 'Success'
GROUP BY c.state
ORDER BY Revenue DESC;
-- Business Q4: Which customers consistently spend above the Average Order Value (AOV)?
with Order_Revenue as(
SELECT 
    CONCAT(c.first_name, ' ', c.last_name) AS Customer,
    o.order_id AS Order_ID,
    SUM(oi.quantity * oi.unit_price) AS Order_Revenue
FROM
    orders o
        INNER JOIN
    order_items oi ON o.order_id = oi.order_id
        INNER JOIN
    customers c ON c.customer_id = o.customer_id
        INNER JOIN
    payments p ON o.order_id = p.order_id
WHERE
    p.payment_status = 'Success'
GROUP BY c.first_name , c.last_name , o.order_id),
AverageOV as (
select 
AVG(Order_Revenue) as AOV
from Order_Revenue
)
select 
Order_ID,
Customer,
Order_Revenue,
AOV,
CASE
    WHEN Order_Revenue > AOV THEN 'Above AOV'
    ELSE 'Below AOV'
END as Status
FROM Order_Revenue
CROSS JOIN AverageOV;
-- Business Q5: Which product categories receive the least interest from different customer segments?
WITH Customer_Revenue AS (
    SELECT
        c.customer_id,
        CONCAT(c.first_name, ' ', c.last_name) AS Customer,
        SUM(oi.quantity * oi.unit_price) AS Total_Revenue
    FROM orders o
    INNER JOIN order_items oi
        ON o.order_id = oi.order_id
    INNER JOIN customers c
        ON o.customer_id = c.customer_id
    INNER JOIN payments p
        ON o.order_id = p.order_id
    WHERE p.payment_status = 'Success'
    GROUP BY
        c.customer_id,
        c.first_name,
        c.last_name
),
Customer_Segment AS (
    SELECT
        customer_id,
        Customer,
        CASE
            WHEN Total_Revenue >= 20000 THEN 'High'
            WHEN Total_Revenue >= 15000 THEN 'Medium'
            ELSE 'Low'
        END AS Segment
    FROM Customer_Revenue
),
Category_Interest AS (
    SELECT
        cs.Segment,
        pr.category,
        SUM(oi.quantity) AS Total_Quantity
    FROM Customer_Segment cs
    INNER JOIN customers c
        ON cs.customer_id = c.customer_id
    INNER JOIN orders o
        ON c.customer_id = o.customer_id
    INNER JOIN order_items oi
        ON o.order_id = oi.order_id
    INNER JOIN products pr
        ON oi.product_id = pr.product_id
    INNER JOIN payments p
        ON o.order_id = p.order_id
    WHERE p.payment_status = 'Success'
    GROUP BY
        cs.Segment,
        pr.category
),
Ranked_Category AS (
    SELECT
        Segment,
        category,
        Total_Quantity,
        RANK() OVER(
            PARTITION BY Segment
            ORDER BY Total_Quantity ASC
        ) AS Category_Rank
    FROM Category_Interest
)
SELECT
    Segment,
    category,
    Total_Quantity
FROM Ranked_Category
WHERE Category_Rank = 1
ORDER BY Segment;