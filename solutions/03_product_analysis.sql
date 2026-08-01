use novacart;
-- Business Q1: Which products contribute the highest percentage of the company's total revenue?
with product_revenue as(select 
pr.product_name as Product,
sum(oi.quantity*oi.unit_price) as Revenue
from orders o 
inner join order_items oi
on o.order_id = oi.order_id
inner join products pr
on pr.product_id = oi.product_id
inner join payments p
on p.order_id = oi.order_id
where p.payment_status = "Success"
group by 
pr.product_id, pr.product_name),

total_revenue as(
select 
sum(Revenue) as Total_Revenue
from product_revenue
)
select
Product,
Revenue,
round((pr.Revenue/tr.Total_Revenue)*100,2) as Revenue_Percentage
from product_revenue pr 
cross join total_revenue tr
order by pr.Revenue desc;
-- Business Q2: Which products consistently have the lowest sales volume?
select
pr.product_name as Product,
sum(oi.quantity) as Unit_sold
from orders o 
inner join order_items oi 
on o.order_id = oi.order_id
inner join payments p 
on o.order_id = p.order_id
inner join products pr 
on oi.product_id = pr.product_id
where p.payment_status = "Success"
group by pr.product_id,pr.product_name
order by Unit_sold asc;
-- Business Q3: Which products demonstrate consistent seasonal demand patterns?
select 
pr.product_name as Product,
date_format(o.order_date, '%Y-%m') as Month,
sum(oi.quantity*oi.unit_price) as Revenue
from orders o 
inner join order_items oi 
on o.order_id = oi.order_id
inner join products pr
on pr.product_id = oi.product_id
inner join payments p
on p.order_id = o.order_id
where p.payment_status = "Success"
group by pr.product_id,
pr.product_name,
date_format(o.order_date, '%Y-%m')
order by Month, Revenue desc;
-- Business Q4: Which products are most frequently purchased together?
select 
p1.product_name,
p2.product_name,
count(*) as Purchase_Count
from order_items oi1
join order_items oi2
on oi1.order_id = oi2.order_id
and oi1.product_id < oi2.product_id
join products p1
on oi1.product_id = p1.product_id
join products p2
on oi2.product_id = p2.product_id
group by p1.product_name, p2.product_name
order by Purchase_Count desc;
-- Business Q5: Which products generate high revenue despite low sales volume, and which products generate high sales volume but low revenue?
with product_summary as(select 
pr.product_name as Product,
sum(oi.quantity) as Unit_sold,
sum(oi.quantity*oi.unit_price) as Revenue
from orders o 
inner join order_items oi
on o.order_id = oi.order_id
inner join products pr 
on pr.product_id = oi.product_id
inner join payments p
on p.order_id = o.order_id
where p.payment_status = "Success"
group by pr.product_id, pr.product_name),
averages as(
select 
avg(Unit_sold) as Avg_Units,
avg(Revenue) as Avg_Revenue
from product_summary
)
select
Product,
Unit_sold,
Revenue,
case
when Revenue > Avg_Revenue
and Unit_sold < Avg_Units then "Premium Product"
when Revenue < Avg_Revenue
and Unit_sold > Avg_Units then "High Volume Product"
else "Normal Product"
end as Classify
from product_summary
cross join averages;
-- Business Q6: Which products show consistent growth or decline in sales over time?
with revenue_summary as(select 
pr.product_name as Product,
date_format(o.order_date,"%Y-%m") as Month,
sum(oi.quantity*oi.unit_price) as Revenue
from orders o
inner join order_items oi 
on o.order_id = oi.order_id 
inner join payments p 
on o.order_id = p.order_id
inner join products pr 
on pr.product_id = oi.product_id
where p.payment_status = "Success"
GROUP BY
    pr.product_name,
    DATE_FORMAT(o.order_date, '%Y-%m')),
monthly_trend as(
select 
Product,
Month,
Revenue,
lag(Revenue)over(
partition by Product 
order by Month
) as Previous_revenue
from revenue_summary)
select
Product,
Month,
Revenue,
Previous_revenue,
ROUND(
    ((Revenue - Previous_Revenue) / Previous_Revenue) * 100,
    2
) AS Growth_Percentage,
CASE
    WHEN Previous_Revenue IS NULL THEN 'No Previous Data'
    WHEN Revenue > Previous_Revenue THEN 'Growing'
    WHEN Revenue < Previous_Revenue THEN 'Declining'
    ELSE 'Stable'
END AS Sales_Trend
from monthly_trend
order by Product, Month;