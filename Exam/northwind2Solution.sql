select count(*)
from suppliers
where country <> 'USA';

select count(*)
from suppliers
where country != 'USA';


-- 5
select count(*)
from order_details od
join products p on od.product_id= p.product_id
join suppliers s on p.supplier_id=s.supplier_id
where s.city='Tokyo'

-- 7
select Max(supplier_count)
from (
    select count(distinct p.supplier_id) As supplier_count
    from order_details od 
    join products p on od.product_id=p.product_id
    group by od.order_id
) as order_supplier_counts;

-- 9
select count(*)
from (
    select od.order_id
    from order_details od
    join products p on od.product_id=p.product_id
    join suppliers s on p.supplier_id=s.supplier_id
    group by od.order_id
    having count(distinct s.country) =1) x


-- 12
select count(*)
from (
    select et.employee_id
    from Employee_territories et
    join Territories t on t.territory_id=et.territory_id
    group by et.employee_id
    having count(t.region_id)=(
        select count(region_id)
        from region
        ) 
    ) emp_all

-- 13

SELECT COUNT(*)
FROM (
         SELECT distinct o.order_id
         FROM orders o
         JOIN order_details od ON od.order_id = o.order_id
         WHERE o.freight > 10.0 -- Moved the freight condition to the
         GROUP BY o.order_id
         HAVING SUM(od.quantity) <= 10
     ) AS tmp;

-- 14
select count(*)
from customers
where contact_title like '%Manager'

-- 15
select count(*)
from (
    select o.employee_id
    from orders o 
    join order_details od on od.order_id=o.order_id 
    join products p on p.product_id= od.product_id
    group by o.employee_id
    having count(distinct p.category_id) = (
    select count(*)
    from Categories
    )
) emp_all


-- exam 2023
-- 3
select max(x.cnt)
from
(select count(*) as cnt 
from orders o
join employees e on e.employee_id = o.employee_id
join customers c on c.customer_id =o.customer_id
group by c.customer_id, e.employee_id) x

select max(x.cnt)
from(
    select count(*) as cnt
    from orders
    group by customer_id, employee_id
) x

-- 5
select count(distinct od.product_id)
from order_details od
join orders o on od.order_id=o.order_id
join employee_territories et on o.employee_id=et.employee_id
join territories t on et.territory_id=t.territory_id
join region r on t.region_id=r.region_id
where r.region_description ='Southern'

-- 11
select count(distinct o.order_id)
from orders o 
join shippers s on o.ship_via=s.shipper_id and not o.shipped_date is null
where s.company_name='Federal Shipping'

-- 13
select count(distinct o.customer_id)
from orders o
join order_details od on o.order_id=od.order_id
where od.discount=(select max(discount)
from order_details)

-- 15
select count(customer_id)
from customers
where contact_title not like '%Sales%' 

-- 17
select count(*)
from (
select distinct customer_id
from orders o 
join order_details od on o.order_id=od.order_id
join products p on od.product_id=p.product_id
join categories c on p.category_id=c.category_id
group by customer_id
having count(distinct c.category_id) =(select count(category_id)
from categories)
) x





