CREATE DATABASE DataTransformer;
USE DataTransformer;

=========================================

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    RegistrationDate DATE
);

INSERT INTO Customers
(CustomerID, FirstName, LastName, Email, RegistrationDate)
VALUES
(11, 'Rahul', 'Patel', 'rahul.patel@gmail.com', '2024-01-15'),
(12, 'Neha', 'Shah', 'neha.shah@gmail.com', '2024-02-20'),
(13, 'Amit', 'Mehta', 'amit.mehta@gmail.com', '2024-03-10'),
(14, 'Pooja', 'Desai', 'pooja.desai@gmail.com', '2024-04-05');

output:-
select * from customers;
+------------+-----------+----------+-----------------------+------------------+
| CustomerID | FirstName | LastName | Email                 | RegistrationDate |
+------------+-----------+----------+-----------------------+------------------+
|         11 | Rahul     | Patel    | rahul.patel@gmail.com | 2024-01-15       |
|         12 | Neha      | Shah     | neha.shah@gmail.com   | 2024-02-20       |
|         13 | Amit      | Mehta    | amit.mehta@gmail.com  | 2024-03-10       |
|         14 | Pooja     | Desai    | pooja.desai@gmail.com | 2024-04-05       |
+------------+-----------+----------+-----------------------+------------------+
4 rows in set (0.002 sec)

=====================================================================================

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Orders
(OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
(201, 11, '2024-05-01', 250.50),
(202, 12, '2024-05-05', 450.75),
(203, 11, '2024-05-10', 1250.00),
(204, 13, '2024-05-15', 800.00),
(205, 12, '2024-05-20', 350.00);

output:-
select * from Orders;
+---------+------------+------------+-------------+
| OrderID | CustomerID | OrderDate  | TotalAmount |
+---------+------------+------------+-------------+
|     201 |         11 | 2024-05-01 |      250.50 |
|     202 |         12 | 2024-05-05 |      450.75 |
|     203 |         11 | 2024-05-10 |     1250.00 |
|     204 |         13 | 2024-05-15 |      800.00 |
|     205 |         12 | 2024-05-20 |      350.00 |
+---------+------------+------------+-------------+
5 rows in set (0.000 sec)

=======================================================

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    HireDate DATE,
    Salary DECIMAL(10,2)
);

INSERT INTO Employees
(EmployeeID, FirstName, LastName, Department, HireDate, Salary)
VALUES
(101, 'Karan', 'Joshi', 'Sales', '2021-05-15', 60000),
(102, 'Riya', 'Sharma', 'HR', '2022-08-20', 50000),
(103, 'Dhruv', 'Trivedi', 'IT', '2020-03-10', 80000),
(104, 'Kavya', 'Rana', 'Finance', '2023-01-25', 45000);

output:-
select * from Employees;
+------------+-----------+----------+------------+------------+----------+
| EmployeeID | FirstName | LastName | Department | HireDate   | Salary   |
+------------+-----------+----------+------------+------------+----------+
|        101 | Karan     | Joshi    | Sales      | 2021-05-15 | 60000.00 |
|        102 | Riya      | Sharma   | HR         | 2022-08-20 | 50000.00 |
|        103 | Dhruv     | Trivedi  | IT         | 2020-03-10 | 80000.00 |
|        104 | Kavya     | Rana     | Finance    | 2023-01-25 | 45000.00 |
+------------+-----------+----------+------------+------------+----------+
4 rows in set (0.000 sec)

==============================================================================
#iNNER JOIN

SELECT
    ->     o.OrderID,
    ->     o.OrderDate,
    ->     o.TotalAmount,
    ->     c.CustomerID,
    ->     c.FirstName,
    ->     c.LastName,
    ->     c.Email
    -> FROM Orders o
    -> INNER JOIN Customers c
    -> ON o.CustomerID = c.CustomerID;
+---------+------------+-------------+------------+-----------+----------+-----------------------+
| OrderID | OrderDate  | TotalAmount | CustomerID | FirstName | LastName | Email                 |
+---------+------------+-------------+------------+-----------+----------+-----------------------+
|     201 | 2024-05-01 |      250.50 |         11 | Rahul     | Patel    | rahul.patel@gmail.com |
|     202 | 2024-05-05 |      450.75 |         12 | Neha      | Shah     | neha.shah@gmail.com   |
|     203 | 2024-05-10 |     1250.00 |         11 | Rahul     | Patel    | rahul.patel@gmail.com |
|     204 | 2024-05-15 |      800.00 |         13 | Amit      | Mehta    | amit.mehta@gmail.com  |
|     205 | 2024-05-20 |      350.00 |         12 | Neha      | Shah     | neha.shah@gmail.com   |
+---------+------------+-------------+------------+-----------+----------+-----------------------+
5 rows in set (0.000 sec)

========================================================================================================
#left JOIN

SELECT
    ->     c.CustomerID,
    ->     c.FirstName,
    ->     c.LastName,
    ->     o.OrderID,
    ->     o.OrderDate,
    ->     o.TotalAmount
    -> FROM Customers c
    -> LEFT JOIN Orders o
    -> ON c.CustomerID = o.CustomerID;
+------------+-----------+----------+---------+------------+-------------+
| CustomerID | FirstName | LastName | OrderID | OrderDate  | TotalAmount |
+------------+-----------+----------+---------+------------+-------------+
|         11 | Rahul     | Patel    |     203 | 2024-05-10 |     1250.00 |
|         11 | Rahul     | Patel    |     201 | 2024-05-01 |      250.50 |
|         12 | Neha      | Shah     |     205 | 2024-05-20 |      350.00 |
|         12 | Neha      | Shah     |     202 | 2024-05-05 |      450.75 |
|         13 | Amit      | Mehta    |     204 | 2024-05-15 |      800.00 |
|         14 | Pooja     | Desai    |    NULL | NULL       |        NULL |
+------------+-----------+----------+---------+------------+-------------+
6 rows in set (0.000 sec)
=================================================================================
##RIGHT JOIN

SELECT
    ->     o.OrderID,
    ->     o.OrderDate,
    ->     o.TotalAmount,
    ->     c.CustomerID,
    ->     c.FirstName,
    ->     c.LastName
    -> FROM Customers c
    -> RIGHT JOIN Orders o
    -> ON c.CustomerID = o.CustomerID;
+---------+------------+-------------+------------+-----------+----------+
| OrderID | OrderDate  | TotalAmount | CustomerID | FirstName | LastName |
+---------+------------+-------------+------------+-----------+----------+
|     201 | 2024-05-01 |      250.50 |         11 | Rahul     | Patel    |
|     202 | 2024-05-05 |      450.75 |         12 | Neha      | Shah     |
|     203 | 2024-05-10 |     1250.00 |         11 | Rahul     | Patel    |
|     204 | 2024-05-15 |      800.00 |         13 | Amit      | Mehta    |
|     205 | 2024-05-20 |      350.00 |         12 | Neha      | Shah     |
+---------+------------+-------------+------------+-----------+----------+
5 rows in set (0.000 sec)

============================================================================
##FULL OUTER JOIN

SELECT
    ->     c.CustomerID,
    ->     c.FirstName,
    ->     c.LastName,
    ->     o.OrderID,
    ->     o.OrderDate,
    ->     o.TotalAmount
    -> FROM Customers c
    -> LEFT JOIN Orders o
    -> ON c.CustomerID = o.CustomerID
    -> 
    -> UNION
    -> 
    -> SELECT
    ->     c.CustomerID,
    ->     c.FirstName,
    ->     c.LastName,
    ->     o.OrderID,
    ->     o.OrderDate,
    ->     o.TotalAmount
    -> FROM Customers c
    -> RIGHT JOIN Orders o
    -> ON c.CustomerID = o.CustomerID;
+------------+-----------+----------+---------+------------+-------------+
| CustomerID | FirstName | LastName | OrderID | OrderDate  | TotalAmount |
+------------+-----------+----------+---------+------------+-------------+
|         11 | Rahul     | Patel    |     203 | 2024-05-10 |     1250.00 |
|         11 | Rahul     | Patel    |     201 | 2024-05-01 |      250.50 |
|         12 | Neha      | Shah     |     205 | 2024-05-20 |      350.00 |
|         12 | Neha      | Shah     |     202 | 2024-05-05 |      450.75 |
|         13 | Amit      | Mehta    |     204 | 2024-05-15 |      800.00 |
|         14 | Pooja     | Desai    |    NULL | NULL       |        NULL |
+------------+-----------+----------+---------+------------+-------------+
6 rows in set (0.006 sec)

================================================================================
##Average Order Amount

SELECT
    ->     c.CustomerID,
    ->     c.FirstName,
    ->     c.LastName,
    ->     o.TotalAmount
    -> FROM Customers c
    -> JOIN Orders o
    -> ON c.CustomerID = o.CustomerID
    -> WHERE o.TotalAmount > (
    ->     SELECT AVG(TotalAmount)
    ->     FROM Orders
    -> );
+------------+-----------+----------+-------------+
| CustomerID | FirstName | LastName | TotalAmount |
+------------+-----------+----------+-------------+
|         11 | Rahul     | Patel    |     1250.00 |
|         13 | Amit      | Mehta    |      800.00 |
+------------+-----------+----------+-------------+
2 rows in set (0.006 sec)

=========================================================
##Employees Above Average Salary

SELECT
    ->     EmployeeID,
    ->     FirstName,
    ->     LastName,
    ->     Salary
    -> FROM Employees
    -> WHERE Salary > (
    ->     SELECT AVG(Salary)
    ->     FROM Employees
    -> );
+------------+-----------+----------+----------+
| EmployeeID | FirstName | LastName | Salary   |
+------------+-----------+----------+----------+
|        101 | Karan     | Joshi    | 60000.00 |
|        103 | Dhruv     | Trivedi  | 80000.00 |
+------------+-----------+----------+----------+
2 rows in set (0.000 sec)

===========================================================
##Year and Month

SELECT
    ->     OrderID,
    ->     OrderDate,
    ->     YEAR(OrderDate) AS OrderYear,
    ->     MONTH(OrderDate) AS OrderMonth
    -> FROM Orders;
+---------+------------+-----------+------------+
| OrderID | OrderDate  | OrderYear | OrderMonth |
+---------+------------+-----------+------------+
|     201 | 2024-05-01 |      2024 |          5 |
|     202 | 2024-05-05 |      2024 |          5 |
|     203 | 2024-05-10 |      2024 |          5 |
|     204 | 2024-05-15 |      2024 |          5 |
|     205 | 2024-05-20 |      2024 |          5 |
+---------+------------+-----------+------------+
5 rows in set (0.002 sec)

=============================================================
##Date Difference

SELECT
    ->     OrderID,
    ->     OrderDate,
    ->     CURDATE() AS CurrentDate,
    ->     DATEDIFF(CURDATE(), OrderDate) AS DifferenceInDays
    -> FROM Orders;
+---------+------------+-------------+------------------+
| OrderID | OrderDate  | CurrentDate | DifferenceInDays |
+---------+------------+-------------+------------------+
|     201 | 2024-05-01 | 2026-10-06  |              888 |
|     202 | 2024-05-05 | 2026-10-06  |              884 |
|     203 | 2024-05-10 | 2026-10-06  |              879 |
|     204 | 2024-05-15 | 2026-10-06  |              874 |
|     205 | 2024-05-20 | 2026-10-06  |              869 |
+---------+------------+-------------+------------------+
5 rows in set (0.003 sec)

================================================================
##Date Format

SELECT
    ->     OrderID,
    ->     OrderDate,
    ->     DATE_FORMAT(OrderDate, '%d-%b-%Y') AS FormattedDate
    -> FROM Orders;
+---------+------------+---------------+
| OrderID | OrderDate  | FormattedDate |
+---------+------------+---------------+
|     201 | 2024-05-01 | 01-May-2024   |
|     202 | 2024-05-05 | 05-May-2024   |
|     203 | 2024-05-10 | 10-May-2024   |
|     204 | 2024-05-15 | 15-May-2024   |
|     205 | 2024-05-20 | 20-May-2024   |
+---------+------------+---------------+
5 rows in set (0.002 sec)

===================================================================
##full name

SELECT
    ->     CustomerID,
    ->     CONCAT(FirstName, ' ', LastName) AS FullName
    -> FROM Customers;
+------------+-------------+
| CustomerID | FullName    |
+------------+-------------+
|         11 | Rahul Patel |
|         12 | Neha Shah   |
|         13 | Amit Mehta  |
|         14 | Pooja Desai |
+------------+-------------+
4 rows in set (0.003 sec)

=======================================================================
##Replace Name

SELECT
    ->     CustomerID,
    ->     FirstName,
    ->     REPLACE(FirstName, 'Rahul', 'Rohan') AS NewFirstName
    -> FROM Customers;
+------------+-----------+--------------+
| CustomerID | FirstName | NewFirstName |
+------------+-----------+--------------+
|         11 | Rahul     | Rohan        |
|         12 | Neha      | Neha         |
|         13 | Amit      | Amit         |
|         14 | Pooja     | Pooja        |
+------------+-----------+--------------+
4 rows in set (0.000 sec)

==========================================================================
##Uppercase / Lowercase

SELECT
    ->     CustomerID,
    ->     UPPER(FirstName) AS UpperFirstName,
    ->     LOWER(LastName) AS LowerLastName
    -> FROM Customers;
+------------+----------------+---------------+
| CustomerID | UpperFirstName | LowerLastName |
+------------+----------------+---------------+
|         11 | RAHUL          | patel         |
|         12 | NEHA           | shah          |
|         13 | AMIT           | mehta         |
|         14 | POOJA          | desai         |
+------------+----------------+---------------+
4 rows in set (0.002 sec)

==============================================================================
##Trim Email

SELECT
    ->     CustomerID,
    ->     Email,
    ->     TRIM(Email) AS CleanEmail
    -> FROM Customers;
+------------+-----------------------+-----------------------+
| CustomerID | Email                 | CleanEmail            |
+------------+-----------------------+-----------------------+
|         11 | rahul.patel@gmail.com | rahul.patel@gmail.com |
|         12 | neha.shah@gmail.com   | neha.shah@gmail.com   |
|         13 | amit.mehta@gmail.com  | amit.mehta@gmail.com  |
|         14 | pooja.desai@gmail.com | pooja.desai@gmail.com |
+------------+-----------------------+-----------------------+
4 rows in set (0.000 sec)

==================================================================================
##Running Total

SELECT
    ->     OrderID,
    ->     OrderDate,
    ->     TotalAmount,
    ->     SUM(TotalAmount) OVER (
    ->         ORDER BY OrderDate
    ->     ) AS RunningTotal
    -> FROM Orders;
+---------+------------+-------------+--------------+
| OrderID | OrderDate  | TotalAmount | RunningTotal |
+---------+------------+-------------+--------------+
|     201 | 2024-05-01 |      250.50 |       250.50 |
|     202 | 2024-05-05 |      450.75 |       701.25 |
|     203 | 2024-05-10 |     1250.00 |      1951.25 |
|     204 | 2024-05-15 |      800.00 |      2751.25 |
|     205 | 2024-05-20 |      350.00 |      3101.25 |
+---------+------------+-------------+--------------+
5 rows in set (0.005 sec)

======================================================================================
##Rank Orders

SELECT
    ->     OrderID,
    ->     OrderDate,
    ->     TotalAmount,
    ->     RANK() OVER (
    ->         ORDER BY TotalAmount DESC
    ->     ) AS OrderRank
    -> FROM Orders;
+---------+------------+-------------+-----------+
| OrderID | OrderDate  | TotalAmount | OrderRank |
+---------+------------+-------------+-----------+
|     203 | 2024-05-10 |     1250.00 |         1 |
|     204 | 2024-05-15 |      800.00 |         2 |
|     202 | 2024-05-05 |      450.75 |         3 |
|     205 | 2024-05-20 |      350.00 |         4 |
|     201 | 2024-05-01 |      250.50 |         5 |
+---------+------------+-------------+-----------+
5 rows in set (0.001 sec)

=========================================================================================
#Discount

SELECT
    ->     OrderID,
    ->     TotalAmount,
    ->     CASE
    ->         WHEN TotalAmount > 1000 THEN '10% Discount'
    ->         WHEN TotalAmount > 500 THEN '5% Discount'
    ->         ELSE 'No Discount'
    ->     END AS Discount
    -> FROM Orders;
+---------+-------------+--------------+
| OrderID | TotalAmount | Discount     |
+---------+-------------+--------------+
|     201 |      250.50 | No Discount  |
|     202 |      450.75 | No Discount  |
|     203 |     1250.00 | 10% Discount |
|     204 |      800.00 | 5% Discount  |
|     205 |      350.00 | No Discount  |
+---------+-------------+--------------+
5 rows in set (0.000 sec)
===========================================================================================
##Employee Salary Category

SELECT
    ->     EmployeeID,
    ->     FirstName,
    ->     LastName,
    ->     Salary,
    ->     CASE
    ->         WHEN Salary >= 70000 THEN 'High'
    ->         WHEN Salary >= 50000 THEN 'Medium'
    ->         ELSE 'Low'
    ->     END AS SalaryCategory
    -> FROM Employees;
+------------+-----------+----------+----------+----------------+
| EmployeeID | FirstName | LastName | Salary   | SalaryCategory |
+------------+-----------+----------+----------+----------------+
|        101 | Karan     | Joshi    | 60000.00 | Medium         |
|        102 | Riya      | Sharma   | 50000.00 | Medium         |
|        103 | Dhruv     | Trivedi  | 80000.00 | High           |
|        104 | Kavya     | Rana     | 45000.00 | Low            |
+------------+-----------+----------+----------+----------------+
4 rows in set (0.000 sec)