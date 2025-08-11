select * from User;
select * from Order_table;

-- inner join------------------------------
SELECT u.User_id,u.Name,o.Order_id,o.Order_date,o.Status FROM User u
INNER JOIN Order_table o ON u.User_id = o.User_id;
-- left join------------------------------
SELECT * FROM User u RIGHT JOIN Order_table o ON u.User_id = o.User_id where o.Shipping_address='Hyderabad';

-- right join------------------------------
SELECT * FROM User u RIGHT JOIN Order_table o ON u.User_id = o.User_id where u.User_id=1;

-- full join------------------------------
 SELECT * FROM User u LEFT JOIN Order_table o ON u.User_id = o.User_id
UNION
SELECT * FROM User u RIGHT JOIN Order_table o ON u.User_id = o.User_id;
