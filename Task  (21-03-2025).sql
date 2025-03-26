--01 Extracting Data with Conditions--

CREATE TABLE Empl(
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2)
);
INSERT INTO Empl (EmployeeID, Name, Department, Salary)
VALUES
(1, 'Jesi', 'HR', 55000),
(2, 'Srithika', 'IT', 75000),
(3, 'Cherry', 'HR', 48000),
(4, 'Rosy', 'Sales', 60000);

select * from Empl

SELECT Name
FROM Empl
WHERE Department = 'HR'
  AND Salary > 50000;

  --02 Finding Duplicate Records--

  CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    OrderAmount DECIMAL(10, 2)
);
INSERT INTO Orders (OrderID, CustomerID, OrderDate, OrderAmount)
VALUES
(1, 501, '2025-02-01', 250.75),
(2, 402, '2025-01-02', 180.50),
(3, 501, '2025-03-03', 320.00),
(4, 103, '2025-03-04', 500.00);

select * from Orders

SELECT CustomerID
FROM Orders
GROUP BY CustomerID
HAVING COUNT(CustomerID) > 1;

--03 Aggregating Data--

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    Quantity INT,
    SaleDate DATE
);
INSERT INTO Sales (SaleID, ProductID, Quantity, SaleDate)
VALUES
(1, 101, 5, '2025-03-01'),
(2, 102, 3, '2025-03-02'),
(3, 103, 2, '2025-03-03'),
(4, 104, 7, '2025-03-04'),
(5, 105, 4, '2025-03-05'),
(6, 106, 6, '2025-03-06'),
(7, 107, 8, '2025-03-07');
 select * from Sales
 SELECT ProductID, SUM(Quantity) AS TotalQuantitySold
FROM Sales
GROUP BY ProductID;

--04 Date Range Queries--

CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,
    AccountID INT,
    TransactionDate DATE,
    Amount DECIMAL(10, 2)
);
INSERT INTO Transactions (TransactionID, AccountID, TransactionDate, Amount)
VALUES
(1, 1012, '2025-02-15', 250.75),
(2, 1013, '2025-03-01', 150.50),
(3, 1032, '2025-03-05', 500.00),
(4, 1034, '2025-03-10', 75.25),
(5, 1004, '2025-03-12', 320.00),
(6, 1045, '2025-03-18', 190.00),
(7, 1033, '2025-03-20', 400.00),
(8, 1001, '2025-03-21', 125.00);
 select * from Transactions
SELECT TransactionID, AccountID, TransactionDate, Amount
FROM Transactions
WHERE TransactionDate >= DATEADD(DAY, -30, GETDATE());

--05 Updating Records--

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10, 2),
    StockQuantity INT
);

INSERT INTO Products (ProductID, ProductName, Price, StockQuantity)
VALUES
(1, 'Wallclock', 999.99, 50),
(2, 'Paintings', 599.99, 150),
(3, 'Brushes', 129.99, 75),
(4, 'acryalcs', 349.99, 30),
(5, 'Titan watches', 199.99, 90),
(6, 'Hangings', 49.99, 200);
select * from Products 

UPDATE Products
SET Price = Price * 1.10
WHERE StockQuantity < 100;

--06 Deleting Specific Records--

CREATE TABLE Userz (
    UserID INT PRIMARY KEY,
    Username VARCHAR(100),
    Email VARCHAR(100),
    Status VARCHAR(20),
	Logindate DATE
);
INSERT INTO Userz (UserID, Username, Email, Status,LoginDate)
VALUES
(1, 'Vishrutha', 'Vishruthak6@gmail.com', 'active', '2025-01-01'),
(2, 'Srithika', 'Srithi1005@gmail.com', 'inactive', '2024-03-01'),
(3, 'Padma Priya', 'srpadhma27@gmail.com', 'active', '2025-03-01'),
(4, 'Varssha', 'Varshkrish@gmail.com', 'active', '2023-05-01');

DELETE FROM Userz
WHERE Status = 'inactive'
  AND LoginDate <= DATEADD(YEAR, -1, GETDATE());
select * from Userz

--09 Handling NULL Values--

CREATE TABLE Productz (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Discount DECIMAL(5, 2)
);

INSERT INTO Productz (ProductID, ProductName, Category, Discount)
VALUES
(1, 'Electric Kettle', 'Kitchen Appliances', 10.00),
(2, 'Gaming Laptop', 'Computers', NULL),
(3, 'LED TV', 'Electronics', 15.00),
(4, 'Office Chair', 'Furniture', 20.00),
(5, 'Wall Clock', 'Home Decor', NULL),
(6, 'Smart Speaker', 'Electronics', 25.00);

SELECT ProductName,
       COALESCE(CAST(Discount AS VARCHAR(50)), 'No Discount') AS Discount
FROM Productz;

--10 Ranking and Window Functions--

CREATE TABLE Sale (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    SaleAmount DECIMAL(10, 2),
    SaleDate DATE
);
INSERT INTO Sale (SaleID, ProductID, SaleAmount, SaleDate)
VALUES
(1, 101, 500.00, '2025-03-01'),
(2, 101, 450.00, '2025-03-02'),
(3, 101, 600.00, '2025-03-03'),
(4, 102, 350.00, '2025-03-04'),
(5, 102, 400.00, '2025-03-05'),
(6, 103, 300.00, '2025-03-06'),
(7, 103, 550.00, '2025-03-07'),
(8, 103, 450.00, '2025-03-08');

SELECT SaleID,
       ProductID,
       SaleAmount,
       SaleDate,
       RANK() OVER (PARTITION BY ProductID ORDER BY SaleAmount DESC) AS SaleRank
FROM Sale;


