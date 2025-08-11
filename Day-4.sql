select * from User;
select * from Order_table;
select * from Products;
select * from Order_Item;
select * from Category;
-- Aggregate Functions------------------------------------ 
select count(Order_id) from Order_table;
select sum(Total_amount) from Order_table;
select min(Total_amount) from Order_table;
select max(Total_amount) from Order_table;
select round(avg(Total_amount),2) from Order_table;
-- Group by-------------------------------------------------
select sum(Total_amount) from Order_table group by Shipping_address;
-- group by having-------------------------------------------
SELECT status,COUNT(User_id) AS UserCount FROM Order_table GROUP BY status HAVING COUNT(User_id) > 1;

 