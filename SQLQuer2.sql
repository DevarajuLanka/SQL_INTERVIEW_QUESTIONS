--pivoting 
write a query to print below 3 columns category, total_sales_2019(sales in year 2019), total_sales_2020(sales in year 2020)

solution is :

select category,
	 sum( case when datepart (year,order_date) = 2018 then sales*quantity end ) as sales_2018,
	 sum( case when datepart (year,order_date) = 2019 then sales*quantity end ) as sales_2019,
	 sum( case when datepart (year,order_date) = 2020 then sales*quantity end ) as sales_2020
	 from orders 
	 group by category
