Solved an interesting sql interview question which is asked in cognizant.

	create table emp(id int,emp_name varchar(20),gender varchar(10),dept varchar(30),salary int)

insert into emp values (1, 'Tildie', 'Female', 'Support', 1676);
insert into emp values (2, 'Averil', 'Female', 'Engineering', 1572);
insert into emp values (3, 'Matthiew', 'Male', 'Engineering', 1477);
insert into emp values (4, 'Reinald', 'Male', 'Services', 1877);
insert into emp values (5, 'Karola', 'female', 'Marketing', 1029);
insert into emp values (6, 'Manon', 'male', 'Research and Development', 1729);
insert into emp values (7, 'Tabbie', 'Female', 'Research and Development', 1000);
insert into emp values (8, 'Corette', 'Female', 'Marketing', 1624);
insert into emp values (9, 'Edward', 'Male', 'Accounting', 1157);
insert into emp values (10, 'Philipa', 'Female', 'Human Resources', 1992);
insert into emp values (11, 'Ingeberg', 'Female', 'Services', 1515);
insert into emp values (12, 'Kort', 'Male', 'Support', 1005);
insert into emp values (13, 'Shelby', 'Male', 'Product Management', 1020);
insert into emp values (14, 'Shelden', 'Male', 'Legal', 1354);
insert into emp values (15, 'Sonya', 'Female', 'Marketing', 1321);

Approach;
--first need to seggregate the data by department wise using row_number function and then used the case function to get the max and min salary holders.
	 with cte as (
		 select *,
		 row_number () over ( partition by dept order by salary desc) as maximum_salary,
		 row_number () over ( partition by dept order by salary asc) as minimum_salary
		 from emp 
		 )
		 select dept,
		 max( case when minimum_salary = 1 then salary end ) as lowest_salary,
		 max( case when maximum_salary = 1 then salary end ) as maximum_salary 
		 from cte 
		 group by dept ;
