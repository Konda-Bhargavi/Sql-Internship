create database mydb;
use mydb;
-- create Table using default constraint--------------------------------------- 
create table User(User_id int,Name varchar(20), Email varchar(20) default '0', Mobile varchar(10), 
Address varchar(15), Password varchar(10));

-- inserting values using null----------------------------- 
Insert into User values(1,'Raju','raju1@gmail.com','9988776655','Hyderabad','Raju@01'),
(2,'Ramya','ramya2@gmail.com','9922334455','Delhi','Ramya@02'),
(3,'Rekha','rekha3@gmail.com','9988723456','Hyderabad','Rekha@01'),
(4,'Shekhar','shekhar4@gmail.com','8822334455','Bangalore','Shekhar@04'),
(4,'Shekhar',null,'8822334455','Bangalore','Shekhar@04');
SET SQL_SAFE_UPDATES = 0;
-- update and delete--------------------------------
update User set Password='Rekha@03' where Name='Rekha'; 
delete from User where Email Is null;
