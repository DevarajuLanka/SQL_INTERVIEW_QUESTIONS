--This question is asked in EY.
You're given a student table containing name,score,attendace column. You're problem is add them into pass category whose score > 70 and attendace > 75.
  
	 CREATE TABLE [Student]
( 
 [Name] varchar(max),
 [Score] INT,
 [Attendance] INT
)

INSERT INTO [Student]
VALUES
('Alice',98,66),
('Bob',86,56),
('Charlie',85,99),
('David',71,100),
('Frank',82,66),
('Harry',92,99),
('Vini',40,40),
('Rodri',99,96),
('Phil',49,74);

Solution is :
 select name,score,attendance,
	 case when score > 70 and Attendance > 75 then 'pass' else 'fail' 
		  end as 'Result'
	 from Student
	 order by result;
