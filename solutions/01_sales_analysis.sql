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