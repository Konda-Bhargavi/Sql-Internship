-- scalar subquery---------------------------------- 
select Order_id,Total_amount,(select avg(Total_amount) from Order_table) as Avg_Order_Amount
from Order_table;

-- corelated subquery------------------------------------------------- 
select p.Product_Id,p.Name,p.Price,p.CategoryId from Products p
where p.Price > (select avg(Price) from Products where CategoryId = p.CategoryId);

-- subqueries using inside IN,Exists,= ------------------------------------
select * from Order_table where Order_date in 
(select Order_date from Order_table where Shipping_address="Hyderabad");

SELECT u.User_id,u.Name,u.Email FROM User u
where exists (select o.Order_id from Order_table o where o.User_id = u.User_id);

select * from Products where Price = (select min(Price) from Products); 

