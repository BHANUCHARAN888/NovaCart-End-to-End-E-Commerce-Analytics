use novacart;
select * from products;
select * from customers;
select * from payments;
select * from orders;
select * from order_items;
-- Business Q1: How does monthly revenue change throughout the year?
-- Query for orders of each individual order_items relation.
select * 
from orders o
inner join order_items oi
on o.order_id = oi.order_id;
-- Combining tables which are required
select * 
from orders o
inner join order_items oi
on o.order_id = oi.order_id
inner join payments p
on o.order_id = p.order_id;
-- filtering the successful payments
select * 
from orders o
inner join order_items oi
on o.order_id = oi.order_id
inner join payments p
on o.order_id = p.order_id
where payment_status='Success';
-- now getting the month year not complete columns
select date_format(o.order_date,'%Y-%m') as month,
sum(oi.quantity*oi.unit_price) as Revenue
from orders o
inner join order_items oi
on o.order_id = oi.order_id
inner join payments p
on o.order_id = p.order_id
where payment_status = "Success"
group by date_format(o.order_date,'%Y-%m');
-- Business Q2: Which months generate the highest and lowest sales?
select date_format(o.order_date,"%Y-%m") as month,
sum(oi.quantity*oi.unit_price) as Revenue
from orders o
inner join order_items oi
on o.order_id = oi.order_id
inner join payments p
on o.order_id = p.order_id
where payment_status = "Success"
group by date_format(o.order_date,"%Y-%m")
order by Revenue desc
limit 1 ;
select date_format(o.order_date,"%Y-%m") as month,
sum(oi.quantity*oi.unit_price) as Revenue
from orders o
inner join order_items oi
on o.order_id = oi.order_id
inner join payments p
on o.order_id = p.order_id
where payment_status = "Success"
group by date_format(o.order_date,"%Y-%m")
order by Revenue asc
limit 1 ;
-- Business Q3: Which product categories contribute the most to overall revenue?
select ps.category,
sum(oi.quantity*oi.unit_price) as Revenue
from orders o
inner join order_items oi
on o.order_id = oi.order_id
inner join products ps
on oi.product_id = ps.product_id
inner join payments py
on oi.order_id = py.order_id
where py.payment_status = "Success"
group by ps.category
order by Revenue desc;
-- Business Q4: What is the monthly sales trend for each product category?
select date_format(o.order_date,"%Y-%m") as Month,
ps.category,
sum(oi.quantity*oi.unit_price) as Revenue
from orders o
inner join order_items oi
on o.order_id = oi.order_id
inner join products ps
on oi.product_id = ps.product_id
inner join payments py
on o.order_id = py.order_id
where payment_status = "Success"
group by Month, ps.category;
-- Business Q5: What is the Average Order Value (AOV) across different months?
select 
date_format(o.order_date,"%Y-%m") as Month_wise,
ROUND(
    SUM(oi.quantity * oi.unit_price) /
    COUNT(DISTINCT o.order_id),
    2
) AS Average_Order_Value
from orders o
inner join order_items oi
on o.order_id = oi.order_id
inner join payments p
on o.order_id = p.order_id
where payment_status = "Success"
group by Month_wise
order by Month_wise;
-- Business Q6: Which months require additional marketing efforts to improve sales performance?
select date_format(o.order_date,'%Y-%m') as month,
sum(oi.quantity*oi.unit_price) as Revenue
from orders o
inner join order_items oi
on o.order_id = oi.order_id
inner join payments p
on o.order_id = p.order_id
where payment_status = "Success"
group by date_format(o.order_date,'%Y-%m')
order by Revenue asc;
-- Business Q7: YoY (year over year comparision)
select date_format(o.order_date,'%m') as month,
sum(
case 
when year(o.order_date) = 2024
then oi.quantity * oi.unit_price
end
) as 2024_Revenue,
sum(
case 
when year(o.order_date) = 2025
then oi.quantity * oi.unit_price
end
) as 2025_Revenue
from orders o
inner join order_items oi
on o.order_id = oi.order_id
inner join payments p
on o.order_id = p.order_id
where payment_status = "Success"
group by month
order by month;
-- Business Q8: Seasonal Sales Patterns
select monthname(o.order_date) as Month,
sum(oi.quantity*oi.unit_price) as Revenue
from orders o
inner join order_items oi
on o.order_id = oi.order_id
inner join payments p
on o.order_id = p.order_id
where payment_status = "Success"
GROUP BY
    MONTH(o.order_date),
    MONTHNAME(o.order_date)
ORDER BY
    MONTH(o.order_date);