use mydb;
select * from User;
select * from Order_table;
select * from Order_Item;

-- creating view--------------------------------------------
create view CustomerSummary as
select u.User_id,u.Name as UserName,u.Address,
    count(o.Order_id) as TotalOrders,
    sum(o.Total_amount) as TotalSpent,
    max(o.Order_date) as LastOrderDate
from User u inner join Order_table o on u.User_id = o.User_id
where o.status = 'Delivered' 
group by u.User_id, u.Name, u.Address
order by TotalSpent desc;

select * from CustomerSummary;

-- view for security-------------------------------------
 CREATE VIEW SafeCustomerView AS
SELECT User_id,Name,Address FROM User;
 -- User access---------------------------
CREATE USER 'report_users'@'%' IDENTIFIED BY 'User@123';
GRANT SELECT ON SafeCustomerView TO 'report_users'@'%';

SELECT * FROM SafeCustomerView;




    


