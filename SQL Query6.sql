Q1. Find the top N highest-grossing products per category.
 with cte as (
 select product_id,category,sum(sales) as total_sales 
 from orders 
 group by product_id,category
 ),
 cte2 as (
 select *,
 ROW_NUMBER () over ( partition by category order by total_sales desc ) as rn 
 from cte 
 )
 select product_id,category,total_sales from cte2
 where rn < = 3 ;

 Q2.Write a query to identify the first and last transaction for each customer within a specific time range.
 select *,
 first_value (emp_name) over ( partition by dept_id order by emp_age ) as youngest_employee,
 first_value (emp_name) over ( partition by dept_id order by emp_age desc ) as oldest_employee,
 last_value (emp_name ) over ( partition by dept_id order by emp_age rows between current row and unbounded following ) as oldest_employee 
 from employee ;

 Q3. Write a query to identify the first and last transaction for each customer within a specific time range.
 select customer_name,min (cast (order_date as date)) as first_order from orders 
 where order_date between '2021-11-01' and '2021-11-30'
 group by customer_name ;
 select customer_name,max (cast ( order_date as date )) from orders 
 where order_date between '2021-11-01' and '2021-11-30'
 group by customer_name 
 having order_date = '2021-11-01' and order_date = '2021-11-30';

 Q4.Write a query to find customers who have made purchases in every quarter of the year.
 select customer_name from 
 (
 select customer_name,datepart ( quarter,order_date ) as order_quarter from orders 
 where datepart(year,order_date) = 2021
 group by customer_name ,datepart ( quarter,order_date )
 ) as quarterly_purchase
 group by customer_name
 having count ( distinct order_quarter ) = 4 ;
 
 Q5.Write a query to retrieve the second highest salary from an employee table without using LIMIT or OFFSET.
 select max(salary) as second_high_salary from employee
 where salary < ( select max(salary) from employee)

 Q6.Implement a SQL query to rank products by their sales within each region and break ties using additional criteria.
 with cte as (
 select product_id,region,sum(sales) as total_sales 
 from orders 
 group by product_id,region
 ),
 cte2 as (
 select *,
 Rank () over ( partition by region order by total_sales desc ) as rn 
 from cte 
 )
 select product_id,region,total_sales from cte2
 where rn < = 3 ;
 Q6.Find the top 3 customers who contributed the most to revenue in the last year
 with cte as (
 select customer_name,sum(sales) as total_sales from orders 
 where datepart(year,order_date) = 2020
 group by customer_name 
 ),
 cte2 as (
 select *,
 ROW_NUMBER () over ( order by total_sales desc ) as rn 
 from cte 
 )
 select customer_name,total_sales from cte2 
 where rn < = 3
