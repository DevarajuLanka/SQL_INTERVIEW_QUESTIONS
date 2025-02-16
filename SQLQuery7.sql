
-- write a query to find the sales ratio between office supplies and furniture.

--USE THIS COPY LINK ADDRESS FOR SCRIPT COMMANDS - "https://github.com/DevarajuLanka/SQL_INTERVIEW_QUESTIONS/blob/main/orders_data_script.txt"

with cte as (
		select category,sum(sales) as total_sales,count(*) as cnt from orders 
		where category in ('office supplies','furniture') 
		group by category 
		)
		select category, total_sales/cnt as RATIO from cte 
