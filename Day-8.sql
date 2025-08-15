-- stored procedure-------------------------------
DELIMITER $$
CREATE PROCEDURE GetOrdersByStatus(IN orderStatus VARCHAR(20))
BEGIN
    SELECT *
    FROM Order_table
    WHERE status = orderStatus;
END $$
DELIMITER ;

CALL GetOrdersByStatus("Delivered");

-- create function---------------------------
DELIMITER $$
CREATE FUNCTION GetUserTotalAmount(userid INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);
    SELECT SUM(Total_amount)
    INTO total
    FROM Order_table
    WHERE User_id = userid;
    RETURN IFNULL(total, 0);
END $$
DELIMITER ;
 
SELECT GetUserTotalAmount(4) AS Total_For_User2;

-- parameter and conditional logic for stored procedure-----------------------------
DELIMITER $$
CREATE PROCEDURE GetOrders(
    IN OrderStatus VARCHAR(20),
    IN MinAmount DECIMAL(10,2)
)
BEGIN
    IF OrderStatus = 'ALL' THEN
        SELECT * FROM Order_table WHERE Total_amount >= MinAmount;
    ELSEIF OrderStatus = 'Delivered' THEN
        SELECT * FROM Order_table WHERE status = 'Delivered' AND Total_amount >= MinAmount;
    ELSE
        SELECT * FROM Order_table WHERE status = OrderStatus AND Total_amount >= MinAmount;
    END IF;
END $$
DELIMITER ;

CALL GetOrders('ALL', 1500);
CALL GetOrders('Pending', 500);
 
--  parameter and conditional logic for Function-----------------------------
DELIMITER $$

CREATE FUNCTION GetUserOrder(userid INT,OrderStatus VARCHAR(20)
)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);
    SELECT SUM(Total_amount) INTO total FROM Order_table WHERE User_id = userid
    AND (
        CASE
            WHEN OrderStatus = 'ALL' THEN 1
            ELSE status = OrderStatus
        END
    );
    RETURN IFNULL(total, 0);
END $$
DELIMITER ;

SELECT GetUserOrder(1, 'ALL') AS Total_All_Status;
SELECT GetUserOrder(1, 'Delivered') AS Total_Delivered;

