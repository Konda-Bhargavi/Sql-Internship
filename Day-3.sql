create table User(User_id int primary key unique,Name varchar(20), Email varchar(20) default '0', Mobile varchar(10), 
Address varchar(15), Password varchar(10));

Insert into User values(1,'Raju','raju1@gmail.com','9988776655','Hyderabad','Raju@01'),
(2,'Ramya','ramya2@gmail.com','9922334455','Delhi','Ramya@02'),
(3,'Rekha','rekha3@gmail.com','9988723456','Hyderabad','Rekha@01'),
(4,'Shekhar','shekhar4@gmail.com','8822334455','Bangalore','Shekhar@04'),
(5,'Madhu','madhu5@gmail.com','9972334455','Chennai','Madhu@05');
-- -------------------------------------------------------------
CREATE TABLE Order_table (Order_id INT PRIMARY KEY,User_id INT,Order_date DATE,
Total_amount INT,Shipping_address VARCHAR(20),status VARCHAR(10),
FOREIGN KEY (User_id) REFERENCES User(User_id));

INSERT INTO Order_table VALUES
(101, 1, '2025-08-01', 1500, 'Hyderabad', 'Pending'),
(102, 2, '2025-08-03', 2500, 'Delhi', 'Shipped'),
(103, 1, '2025-08-05', 1000, 'Hyderabad', 'Delivered'),
(104, 3, '2025-08-05', 2000, 'Hyderabad', 'Delivered'),
(105, 4, '2025-08-06', 1000, 'Bangalore', 'Pending'),
(106, 2, '2025-08-04', 2500, 'Delhi', 'Shipped');
-- ------------------------------------------------------------- 
select * from Order_table;
select Order_id,User_id,Total_amount from Order_table where status like 'De%';
select status from Order_table where Order_date between '2025-08-05' and '2025-08-06';
select * from Order_table where Total_amount=1000 or Shipping_address='Hyderabad';
select * from Order_table where Order_date between '2025-08-01' and '2025-08-06'
order by Total_amount desc;