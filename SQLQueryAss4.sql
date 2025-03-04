                                ---On HR_DB
--1 Select all employees
USE HR_DB
SELECT *
FROM Employees;
--2 Select employees from a specific country (e.g., Egypt - CountryID = 1)
SELECT *
FROM Employees
WHERE CountryID=1
--3 Select employees who earn more than 5000
SELECT *
FROM Employees
WHERE MonthlySalary>5000
-- 4 Select employees who were hired after 2020
SELECT *
FROM Employees
WHERE HireDate > '2020-12-31'
--Select employees who have exited (i.e., those with an ExitDate set)
SELECT *
FROM Employees
WHERE ExitDate IS NOT NULL
--Select employees with a bonus percentage above 10%
SELECT *
FROM Employees
WHERE BonusPerc > 0.10;
                       ---On Shop_Database
-- 8Retrieve all possible combinations of customers and orders.
USE Shop_Database;
SELECT*
FROM Customers CROSS JOIN Orders
--9 Get all orders with the customer names.
SELECT O.*,C.Name 
FROM Orders O INNER JOIN Customers C 
ON O.CustomerID=C.CustomerID
-- 10 Get all customers, even if they haven’t placed an order.
SELECT C.*,O.OrderID
FROM Customers C LEFT JOIN Orders O 
ON C.CustomerID=O.CustomerID
--11 Get all orders, even if the customer is missing in the Customers table.
SELECT O.*,C.Name 
FROM Orders O LEFT JOIN Customers C 
ON O.CustomerID=C.CustomerID
--12 Get all orders and customers, even if they don’t have a match
SELECT O.OrderID,C.Name
FROM Orders O FULL OUTER JOIN Customers C 
ON O.CustomerID=C.CustomerID
--13 Find customers who have the same name as another customer (for duplicate detection).
SELECT C1.*,C2.*
FROM Customers C1
JOIN Customers C2 ON C1.Name = C2.Name 
AND C1.CustomerID < C2.CustomerID;
--14 Retrieve orders with amounts greater than 500 along with customer names.
SELECT O.*,C.Name
FROM Orders O JOIN Customers C 
ON O.CustomerID=C.CustomerID
WHERE O.Amount>500
--15 Find Customers Without Orders
SELECT C.*,O.OrderID
FROM Orders O FULL OUTER JOIN Customers C 
ON O.CustomerID=C.CustomerID
WHERE O.CustomerID IS NULL
--16 Count Orders Per Customer
SELECT C.CustomerID,C.Name,COUNT(O.OrderID) AS OrderCount
FROM Orders O RIGHT JOIN Customers C 
ON O.CustomerID=C.CustomerID
GROUP BY C.CustomerID , C.Name
--17 Get the Total Amount Spent by Each Customer
SELECT C.CustomerID,C.Name,SUM(O.Amount) AS Amount_Spent 
FROM Orders O RIGHT JOIN Customers C 
ON O.CustomerID=C.CustomerID
GROUP BY C.CustomerID , C.Name
--18 Update Orders Based on Customer Information 
--Increase the amount of all orders placed by "John Doe" by 10%.
UPDATE O
SET Amount += Amount * 0.10
FROM Orders O JOIN Customers C 
ON O.CustomerID=C.CustomerID
WHERE C.Name='John'
--19 Delete Orders of Customers Who No Longer Exist
DELETE O
FROM Orders O LEFT JOIN Customers C 
ON O.CustomerID=C.CustomerID
WHERE C.CustomerID IS NULL


