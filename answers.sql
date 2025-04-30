-- Question 1: Create a new table in 1NF
CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(50)
);

-- Insert cleaned-up rows (1 product per row)
INSERT INTO ProductDetail_1NF VALUES (101, 'John Doe', 'Laptop');
INSERT INTO ProductDetail_1NF VALUES (101, 'John Doe', 'Mouse');
INSERT INTO ProductDetail_1NF VALUES (102, 'Jane Smith', 'Tablet');
INSERT INTO ProductDetail_1NF VALUES (102, 'Jane Smith', 'Keyboard');
INSERT INTO ProductDetail_1NF VALUES (102, 'Jane Smith', 'Mouse');
INSERT INTO ProductDetail_1NF VALUES (103, 'Emily Clark', 'Phone');

-- Check your results
SELECT * FROM ProductDetail_1NF;

-- Question 2: Create a new table in 2NF
-- Create a table for customer and order (no products)
CREATE TABLE CustomerOrders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- Insert unique orders and customers
INSERT INTO CustomerOrders VALUES (101, 'John Doe');
INSERT INTO CustomerOrders VALUES (102, 'Jane Smith');
INSERT INTO CustomerOrders VALUES (103, 'Emily Clark');

-- Create a table for order items only (product and quantity)
CREATE TABLE OrderItems (
    OrderID INT,
    Product VARCHAR(50),
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES CustomerOrders(OrderID)
);

-- Insert order items
INSERT INTO OrderItems VALUES (101, 'Laptop', 2);
INSERT INTO OrderItems VALUES (101, 'Mouse', 1);
INSERT INTO OrderItems VALUES (102, 'Tablet', 3);
INSERT INTO OrderItems VALUES (102, 'Keyboard', 1);
INSERT INTO OrderItems VALUES (102, 'Mouse', 2);
INSERT INTO OrderItems VALUES (103, 'Phone', 1);

-- Join them back if needed to see the full details
SELECT 
    co.OrderID, 
    co.CustomerName, 
    oi.Product, 
    oi.Quantity
FROM CustomerOrders co
JOIN OrderItems oi ON co.OrderID = oi.OrderID;

