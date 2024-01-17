
#DDL
create database railway_db; 
create table passenger (id int PRIMARY KEY , name varchar (50), age int);
Use railway_db;

insert into passenger
(id,name,age) values
(1,"Abhay",22),
(2,"Jay",21),
(3,"ketan",22);

rename table passenger to passenger1;
alter table passenger Add column age int;
alter table passenger drop column age;

Select * from passenger;

truncate passenger;

#DQL
Select *
From passenger ;

#DML
Insert into passenger 
(id,name,age) values 
(1,"Abhay",22),
(2,"Jay",21),
(3,"ketan",22);

Create table IF Not Exists passenger (id int PRIMARY KEY , name varchar (50), age int);

update passenger set age =25 
where age =22;

delete from passenger 
where id =3;

Select*
From passenger;

#TCL
commit;
Rollback;



Create database Google;
Use Google;
Create table emp(id int PRIMARY KEY,Name Varchar(50),Age int NOT NULL);
Insert into emp (id,Name,Age)Values
(1,"Ajay",20),
(2,"Vishal",20),
(3,"Jay",20);

Select*
From emp;

Delete From emp
where Id=3;

Create table emp2(id int PRIMARY KEY,Name Varchar(50),Age int NOT NULL);
Insert into emp2 (id,Name,Age)Values
(1,"Raj",30),
(2,"Om",60),
(3,"Sai",50);

select * from emp,emp2; # cartesion product


#Join

#natural join 
Select *
From emp,emp2
where emp.id=emp2.id;

#Left join
Select *
From emp
left outer join emp2
on emp.id=emp2.id;

#Right join
Select *
From emp
right outer join emp2
on emp.id=emp2.id;

#Full outer join
Select*
From emp
left join emp2
on emp.id=emp2.id

union all

Select *
From emp
right join emp2
on emp.id = emp2.id;

#rename
select name as employee_name from emp; #rename as clause

#String 
select concat('hello ' , name) from emp;
select upper(name) from emp;
select lower(name) from emp;

#order by
select * from emp2 order by name  desc;
select * from emp2 order by name  asc;

#Between 
select * from emp2 where age between 20 and 50;

#Aggregate function
select max(age) from emp2;

#group by
select age from emp group by age;

#General Order Of Clauses
Select city
From student
where city="Delhi"
Group By city
Having Max(marks) > 70
Order by city asc;

#nested key
select name from emp where age < (select age from emp2 where id=1);

select * from emp where name in ('Ajay', 'Vishal');


#view
create view emp_private as select name from emp;

select * from emp_private;

#Truncate
Use Google;
select *
From emp;

Truncate emp;
select *
From emp;

use google;

Alter Table emp
Change name FullName varchar(50);
Select*
From emp;

# trigger
use google;
create table main(id int,name varchar(50),age int);
Insert into main (id,Name,Age)Values
(1,"priya",20),
(2,"jay",20),
(3,"yash",20);

create table backup(id int,name varchar(50),age int);

delimiter $$
create trigger t1
before delete on main
for each row
begin
	insert into backup values (old.id,old.name,old.age);
end$$
delimiter ;

Set sql_safe_updates=0;
delete from main
where id=1;

Select *
From backup;



#Procedure
#E.g. we want to print even numbers upto 30. So the query using while loop will be as follow:
# Using while loop ...to print even numbers upto 30
delimiter $$
CREATE PROCEDURE Even_No_Loop1()
BEGIN
DECLARE EvenNo INT;
declare EvenNoString varchar(100);
SET EvenNo = 0;
set EvenNoString = '';
WHILE EvenNo <=30 DO
set EvenNoString = concat(EvenNoString, EvenNo, ',');
SET EvenNo = EvenNo + 2;
END WHILE;
select EvenNoString;
END $$
Delimiter ;

call Even_No_Loop1;







#2nd file
Use ssbt;
Select* From student;

Create database IF NOT EXISTS ssbt;

USE ssbt;
Insert into student
(Id,Name,Age) Values
(37,"Raj",20),(22,"Aashish",22);

Select* From student;

Create database LBC;
Use LBC;
Create table emp(id int Primary Key,name varchar(50),salary int Not Null);
Insert into emp(id, name,salary) values (1,"adam",25000),(2,"bob",30000),(3,"casey",40000); 
Select * From emp;









Create database college5;
Use college5;
Create table student(
rollno int Primary Key,
name varchar(50),
marks int Not Null,
grade Varchar(1),
city varchar(20)
);
Insert into student 
(rollno,name,marks,grade,city)
values
(101,"anil",78,"C","Pune"),
(102,"bhumika",93,"A","Mumbai"),
(103,"chetan",85,"B","Mumbai"),
(104,"dhruv",96,"A","Delhi"),
(105,"emanuel",12,"F","Delhi"),
(106,"farah",82,"B","Delhi")
;

Select rollno,grade,marks From student;

Select Distinct grade From student; #unique result

#clauses

Select * 
From student # Where cluse
where
marks>80;

Select *
From student
where 
city="Delhi";

Select *
From student
where
marks>70 AND city="pune";  # Both satisfy

Select *
From student
where
marks+10>100;

Select *
From student
where
marks>70 OR city="pune";

#set membership
Select *
From student
where
marks BETWEEN 70 AND 90;

Select *
From student
where
city IN ("Delhi","Jalgaon");

Select *
From student
where
city NOT IN ("Delhi","Pune");

Select *
From student
Limit 3;

#Order By Clause
Select *
From Student
Order By city Asc;

Select * 
From Student
Order By city Desc
Limit 3;


#Aggregate Function ( It is like button)
#Count()
#MAX()
#MIN()
#SUM()
#AVG()

Select MAX(Marks)
From Student;

Select MIN(Marks)
From Student;

Select COUNT(Marks)
From Student;

Select SUM(Marks)
From Student;

Select Avg(Marks)
From Student;



#Group By Clause
Select city, count(rollno)
From student
Group BY city;

Select grade,Max(Marks)
From student
Group BY grade;


Select city,avg(marks)
From student
Group By city;


#practice question

#1)write the query to find avg marks in each cityin asecending order

Select city,avg(marks)
From student
Group BY city
Order By city Asc;

#2)For the given table ,find the total payment according to each payment method.

Select mode,count(customer_id)
From payment
Group By Mode;

# Having Clause 
Select city,max(marks)
From student
Group BY city
Having max(Marks)>70;

Select city,count(rollno)
From student
Group By city
Having Max(marks) > 90;


#General Order Of Clauses
Select city
From student
where city="Delhi"
Group By city
Having Max(marks) > 70
Order by city asc;
