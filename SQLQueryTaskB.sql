                        ---Create Database---
CREATE DATABASE Online_Shopping_System;
USE Online_Shopping_System;
                   ---Create Customer Table-------
CREATE TABLE Customer (
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Email VARCHAR(50) UNIQUE NOT NULL,
    PhoneNumber VARCHAR(20) NOT NULL,
    Address VARCHAR(255) NOT NULL
);
-- Create Order Table
CREATE TABLE [Order](
OrderID INT IDENTITY(1,1) PRIMARY KEY,
CustomerID INT NOT NULL,
OrderDate DATETIME DEFAULT GETDATE(),
TotalAmount DECIMAL(10,2) NOT NULL,
Status VARCHAR NOT NULL,
FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);
--- Create Product Table
CREATE TABLE Product (
    ProductID INT IDENTITY(1,1) PRIMARY KEY,
    Category VARCHAR(100),
    Name VARCHAR(255) NOT NULL,
    Description TEXT,
    Price DECIMAL(10,2) NOT NULL
);
--- Create OrderDetails Table
CREATE TABLE  OrderDetails(
  OrderDetailsID INT IDENTITY(1,1) PRIMARY KEY,
  OrderID INT NOT NULL,
  ProductID INT NOT NULL,
  Quantity INT NOT NULL,
  Price DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (OrderID) REFERENCES [Order](OrderID),
  FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);
--  CREATE Supplier Table
CREATE TABLE Supplier (
    SupplierID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(200) NOT NULL,
    ContactInfo TEXT
);
-- CREATE Product_Supplier Table 
CREATE TABLE Product_Supplier (
  SupplierID INT NOT NULL,
  ProductID INT NOT NULL,
  PRIMARY KEY (SupplierID, ProductID),
  FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID) ,
  FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);
----INSERT INTO Customer---
INSERT INTO Customer (Name, Email, PhoneNumber, Address) 
VALUES 
    ('Donia', 'Donia@example.com', '1234567890', '123 SaadEmam Street'),
    ('Noor', 'Noor@example.com', '0987654321', '456 Abdulaziz Street');
-----------------------
ALTER TABLE [Order] ALTER COLUMN Status VARCHAR(20);
---------------------------
----Insert into Order Table
INSERT INTO [Order] (CustomerID, TotalAmount, Status) 
VALUES (1, 150.75, 'Pending'),
 (2, 220.50, 'Shipped');
-- Insert into Product Table
INSERT INTO Product (Category, Name, Description, Price) 
VALUES ('Electronics', 'Laptop', 'High-performance laptop ', 10000.00),
('Clothing', 'T-Shirt', 'Cotton t-shirt', 25.99);
-- Insert into OrderDetails Table
INSERT INTO OrderDetails (OrderID, ProductID, Quantity, Price) 
VALUES (1, 1, 1, 10000.00),  
 (2, 2, 3, 77.97);    
 -- Insert into Supplier Table
 INSERT INTO Supplier (Name, ContactInfo) 
VALUES ('Join', 'Join@example.com'),
('ELSA', 'ELSA@example.com');

-- Insert into Product_Supplier Table
INSERT INTO Product_Supplier (SupplierID, ProductID) 
VALUES (1, 1), 
(2, 2); 
  -----1. DDL
-----Add a new column named rating to the Products table with an appropriate
-----data type and a default value of 0.
ALTER TABLE Product
ADD rating DECIMAL(3,1) DEFAULT 0;
---Modify the Category column to have a default value of 'new'.
ALTER TABLE Product
ADD CONSTRAINT DF_Product_Category DEFAULT 'new' FOR Category;
---Drop the rating column from the Products table.
ALTER TABLE Product
DROP COLUMN rating;
    -----------2DML
-----updatethe order date by setting it to the current date for all records where the order
--id is greater than 0.
UPDATE [Order]
SET OrderDate = GETDATE()
WHERE OrderID > 0;
-----Delete all rows from the Products table where the product name is not null
---and not equal to "Null".
DELETE FROM Product
WHERE Name IS NOT NULL 
AND Name <> 'Null';


