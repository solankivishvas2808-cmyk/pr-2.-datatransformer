# DataTransformer — MySQL Database Project

> **A professional MySQL database project demonstrating database creation, table design, relationships, joins, subqueries, date functions, string functions, aggregate/window functions, ranking, and conditional business logic.**

---

## 👨‍💻 Author

**Vishwas Solanki**

**Project Type:** MySQL Database Project  
**Database Name:** `DataTransformer`  
**Technology:** MySQL / SQL

---

## 📌 Project Overview

**DataTransformer** is a practical MySQL database project created to demonstrate commonly used SQL concepts through three related datasets:

- **Customers** — stores customer information.
- **Orders** — stores customer orders and transaction amounts.
- **Employees** — stores employee and salary information.

The project also demonstrates how SQL can be used to combine related data, analyze records, perform calculations, transform values, and generate meaningful results.

---

## 🎯 Project Objectives

The main objectives of this project are:

1. Create and use a MySQL database.
2. Create structured relational tables.
3. Apply **Primary Key** and **Foreign Key** constraints.
4. Insert and retrieve data from tables.
5. Demonstrate different types of SQL **JOINs**.
6. Use **subqueries** for analytical comparisons.
7. Work with **date and time functions**.
8. Work with **string functions**.
9. Demonstrate **aggregate and window functions**.
10. Apply conditional logic using `CASE`.
11. Calculate running totals and rankings.
12. Transform raw database information into useful results.

---

## 🗄️ Database Structure

### Database

```sql
CREATE DATABASE DataTransformer;
USE DataTransformer;
```

### Tables

| Table | Purpose |
|---|---|
| `Customers` | Stores customer details |
| `Orders` | Stores order and transaction details |
| `Employees` | Stores employee and salary details |

---

## 👥 Customers Table

The `Customers` table contains customer identification, personal information, email addresses, and registration dates.

### Main Columns

| Column | Data Type | Description |
|---|---|---|
| `CustomerID` | INT | Primary key |
| `FirstName` | VARCHAR(50) | Customer first name |
| `LastName` | VARCHAR(50) | Customer last name |
| `Email` | VARCHAR(100) | Customer email |
| `RegistrationDate` | DATE | Customer registration date |

The project defines `CustomerID` as the primary key. 

---

## 🛒 Orders Table

The `Orders` table stores order information and connects each order to a customer.

### Main Columns

| Column | Data Type | Description |
|---|---|---|
| `OrderID` | INT | Primary key |
| `CustomerID` | INT | Foreign key referencing Customers |
| `OrderDate` | DATE | Date of order |
| `TotalAmount` | DECIMAL(10,2) | Total order amount |

The project establishes the relationship between `Orders.CustomerID` and `Customers.CustomerID` using a foreign key. 

---

## 👨‍💼 Employees Table

The `Employees` table stores employee information and salary details.

### Main Columns

| Column | Data Type | Description |
|---|---|---|
| `EmployeeID` | INT | Primary key |
| `FirstName` | VARCHAR(50) | Employee first name |
| `LastName` | VARCHAR(50) | Employee last name |
| `Department` | VARCHAR(50) | Employee department |
| `HireDate` | DATE | Hiring date |
| `Salary` | DECIMAL(10,2) | Employee salary |

---

## 🔗 SQL JOIN Concepts Demonstrated

This project demonstrates multiple JOIN concepts.

### 1. INNER JOIN

Combines customers with their matching orders.

```sql
FROM Orders o
INNER JOIN Customers c
ON o.CustomerID = c.CustomerID;
```

### 2. LEFT JOIN

Returns all customers, including customers who do not have an order.

### 3. RIGHT JOIN

Returns all orders and their matching customer information.

### 4. FULL OUTER JOIN Concept

MySQL does not provide a direct `FULL OUTER JOIN` syntax. The project demonstrates the concept by combining a `LEFT JOIN` and a `RIGHT JOIN` using `UNION`.

---

## 📊 Subqueries & Data Analysis

The project uses subqueries to compare values against calculated averages.

### Average Order Amount

Orders are compared against the average order amount to identify orders above average.

```sql
SELECT AVG(TotalAmount)
FROM Orders;
```

The project then returns orders whose amount is greater than this average. 

### Employees Above Average Salary

Employee salaries are compared with the average employee salary to identify employees earning above average. 
---

## 📅 Date Functions

The project demonstrates several MySQL date functions.

### YEAR() and MONTH()

Extracts the year and month from an order date.

```sql
YEAR(OrderDate)
MONTH(OrderDate)
```

### DATEDIFF()

Calculates the difference between the current date and an order date.

```sql
DATEDIFF(CURDATE(), OrderDate)
```

### DATE_FORMAT()

Formats an order date into a readable format such as:

```text
01-May-2024
```

These operations are demonstrated in the SQL project. 

---

## 🔤 String Functions

The project demonstrates useful MySQL string functions.

### CONCAT()

Combines first and last names into a full name.

```sql
CONCAT(FirstName, ' ', LastName)
```

### REPLACE()

Replaces a specified name with another value.

```sql
REPLACE(FirstName, 'Rahul', 'Rohan')
```

### UPPER() and LOWER()

Converts text into uppercase or lowercase.

```sql
UPPER(FirstName)
LOWER(LastName)
```

### TRIM()

Removes unnecessary spaces from email values.

```sql
TRIM(Email)
```

The project includes all of these string transformations.

---

## 📈 Window Functions

The project also demonstrates MySQL window functions.

### Running Total

A cumulative order total is calculated using:

```sql
SUM(TotalAmount) OVER (
    ORDER BY OrderDate
)
```

This produces a running total as orders progress by date. 

### Order Ranking

Orders are ranked according to their total amount:

```sql
RANK() OVER (
    ORDER BY TotalAmount DESC
)
```

The highest-value order receives rank 1. 

---

## 🏷️ Conditional Logic with CASE

The project uses `CASE` expressions to categorize data.

### Order Discount

Orders are categorized into:

- `10% Discount`
- `5% Discount`
- `No Discount`

based on their total amount. 

### Employee Salary Category

Employee salaries are categorized as:

- **High**
- **Medium**
- **Low**

using salary-based conditions. 

---

## 🧠 SQL Concepts Covered

This project demonstrates:

- Database creation
- Database selection
- Table creation
- Primary Keys
- Foreign Keys
- Data insertion
- Data retrieval
- `SELECT`
- `WHERE`
- `JOIN`
- `INNER JOIN`
- `LEFT JOIN`
- `RIGHT JOIN`
- `UNION`
- Subqueries
- `AVG()`
- `SUM()`
- `YEAR()`
- `MONTH()`
- `CURDATE()`
- `DATEDIFF()`
- `DATE_FORMAT()`
- `CONCAT()`
- `REPLACE()`
- `UPPER()`
- `LOWER()`
- `TRIM()`
- Window functions
- `RANK()`
- Running totals
- `CASE`
- Data categorization

---

## 🚀 How to Run the Project

### Step 1 — Open MySQL

Open MySQL Workbench or the MySQL command-line client.

### Step 2 — Open the SQL File

Open the project SQL file:

```text
pr-2.-datatransformer.sql
```

### Step 3 — Execute the Script

Run the complete SQL script.

The script creates the database:

```sql
CREATE DATABASE DataTransformer;
```

and selects it:

```sql
USE DataTransformer;
```

### Step 4 — Verify the Database

```sql
SHOW DATABASES;
```

### Step 5 — Select the Database

```sql
USE DataTransformer;
```

### Step 6 — Check Tables

```sql
SHOW TABLES;
```

You should find the project tables:

```text
Customers
Orders
Employees
```

---

## 📁 Project Structure

```text
DataTransformer/
│
├── pr-2.-datatransformer.sql
└── README.md
```

---

## 📌 Project Highlights

This project is designed as a practical SQL learning and demonstration project. It moves beyond basic table creation by showing how relational data can be:

**Stored → Connected → Filtered → Analyzed → Transformed → Ranked → Categorized**

The SQL file contains working examples and their corresponding outputs, making it useful for academic demonstration, practical submission, and SQL practice.

---

## 🎓 Academic Use

This project can be used as a practical demonstration of:

- Relational Database Management
- SQL Query Writing
- Database Relationships
- Data Analysis
- Data Transformation
- Advanced SQL Functions

---

## 👤 Author

**Vishwas Solanki**

> *Designed and developed as a MySQL database project.*

---

## 📜 License

This project is created for **educational and academic purposes**.

---

### ⭐ DataTransformer

**A structured MySQL project demonstrating practical SQL from database design to advanced data transformation.**
