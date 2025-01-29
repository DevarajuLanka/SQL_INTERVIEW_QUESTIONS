Here's some common sql interview questions for every data aspirants. I have proovided some question along with the answers.

--Q1. Write a sql query to fidn out customer details whose name starts with R OR S.
	  select * from orders 
	  where customer_name like 'a%' or customer_name like 's%'

	  --Q2. Write a sql query to find out duplicate records.
	  select order_id,count(1)as duplicate_records from orders 
	  group by order_id
	  having count(1)> 1
	  ;
	  --Another approach
	  with cte as (
	  select order_id,
	  row_number () over ( partition by order_id order by sales ) as rn 
	  from orders 
	  )
	  select * from cte 
	  where rn > 1

	  --Q3.Write a sql query to find out the customer who's placed second highest orders by quantity wise.
	  select max(quantity) as second_highest_quantity from orders 
	  where quantity < ( select max(quantity) from orders )

	 --Q4.Write a sql query to find out employees whose age greater than > 35
	  select *,datediff(year,dob,getdate()) as age_diff from employee
	  where datediff(year,dob,getdate()) > 35

	  --Q5.Write a sql query to find out summulative salary order by desc 
	  select *,
	  sum(salary) over (order by salary) as cummulative_salary from employee
