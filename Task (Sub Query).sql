CREATE TABLE Salesman (
    salesman_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50),
    commission DECIMAL(5,2)
);

CREATE TABLE Orders (
    ord_no INT PRIMARY KEY,
    purch_amt DECIMAL(10,2),
    ord_date DATE,
    customer_id INT,
    salesman_id INT,
    FOREIGN KEY (salesman_id) REFERENCES Salesman(salesman_id)
);

CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    cust_name VARCHAR(50),
    city VARCHAR(50),
    grade INT,
    salesman_id INT,
    FOREIGN KEY (salesman_id) REFERENCES Salesman(salesman_id)
);

CREATE TABLE company_mast (
    COM_ID INT PRIMARY KEY,
    COM_NAME VARCHAR(50)
);

CREATE TABLE item_mast (
    PRO_ID INT PRIMARY KEY,
    PRO_NAME VARCHAR(50),
    PRO_PRICE DECIMAL(10, 2),
    PRO_COM INT,
    FOREIGN KEY (PRO_COM) REFERENCES company_mast(COM_ID)
);

CREATE TABLE emp_department (
    DPT_CODE INT PRIMARY KEY,
    DPT_NAME VARCHAR(50),
    DPT_ALLOTMENT DECIMAL(12, 2)
);

CREATE TABLE emp_details (
    EMP_IDNO INT PRIMARY KEY,
    EMP_FNAME VARCHAR(50),
    EMP_LNAME VARCHAR(50),
    EMP_DEPT INT,
    FOREIGN KEY (EMP_DEPT) REFERENCES emp_department(DPT_CODE)
);

-- Insert values into Salesman table
INSERT INTO Salesman (salesman_id, name, city, commission)
VALUES
(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5003, 'Lauson Hen', 'San Jose', 0.12),
(5007, 'Paul Adam', 'Rome', 0.13);

-- Insert values into Orders table
INSERT INTO Orders (ord_no, purch_amt, ord_date, customer_id, salesman_id)
VALUES
(70001, 150.50, '2012-10-05', 3005, 5002),
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05', 3002, 5001),
(70004, 110.50, '2012-08-17', 3009, 5003),
(70007, 948.50, '2012-09-10', 3005, 5002),
(70005, 2400.60, '2012-07-27', 3007, 5001),
(70008, 5760.00, '2012-09-10', 3002, 5001),
(70010, 1983.43, '2012-10-10', 3004, 5006),
(70003, 2480.40, '2012-10-10', 3009, 5003),
(70012, 250.45, '2012-06-27', 3008, 5002),
(70011, 75.29, '2012-08-17', 3003, 5007),
(70013, 3045.60, '2012-04-25', 3002, 5001);

-- Insert values into Customer table
INSERT INTO Customer (customer_id, cust_name, city, grade, salesman_id)
VALUES
(3002, 'Nick Rimando', 'New York', 100, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3001, 'Brad Guzan', 'London', 100, 5005),
(3004, 'Fabian Johns', 'Paris', 300, 5006),
(3007, 'Brad Davis', 'New York', 200, 5001),
(3009, 'Geoff Camero', 'Berlin', 100, 5003),
(3008, 'Julian Green', 'London', 300, 5002),
(3003, 'Jozy Altidor', 'Moncow', 200, 5007);

-- Insert data into company_mast
INSERT INTO company_mast (COM_ID, COM_NAME)
VALUES
    (11, 'Samsung'),
    (12, 'iBall'),
    (13, 'Epsion'),
    (14, 'Zebronics'),
    (15, 'Asus'),
    (16, 'Frontech');

INSERT INTO item_mast (PRO_ID, PRO_NAME, PRO_PRICE, PRO_COM)
VALUES
    (101, 'Mother Board', 3200.00, 15),
    (102, 'Key Board', 450.00, 16),
    (103, 'ZIP drive', 250.00, 14),
    (104, 'Speaker', 550.00, 16),
    (105, 'Monitor', 5000.00, 11),
    (106, 'DVD drive', 900.00, 12),
    (107, 'CD drive', 800.00, 12),
    (108, 'Printer', 2600.00, 13),
    (109, 'Refill cartridge', 350.00, 13),
    (110, 'Mouse', 250.00, 12);

INSERT INTO emp_department (DPT_CODE, DPT_NAME, DPT_ALLOTMENT)
VALUES
    (57, 'IT', 65000),
    (63, 'Finance', 15000),
    (47, 'HR', 240000),
    (27, 'RD', 55000),
    (89, 'QC', 75000);

INSERT INTO emp_details (EMP_IDNO, EMP_FNAME, EMP_LNAME, EMP_DEPT)
VALUES
    (127323, 'Michale', 'Robbin', 57),
    (526689, 'Carlos', 'Snares', 63),
    (843795, 'Enric', 'Dosio', 57),
    (328717, 'Jhon', 'Snares', 63),
    (444527, 'Joseph', 'Dosni', 47),
    (659831, 'Zanifer', 'Emily', 47),
    (847674, 'Kuleswar', 'Sitaraman', 57),
    (748681, 'Henrey', 'Gabriel', 47),
    (555935, 'Alex', 'Manuel', 57),
    (539569, 'George', 'Mardy', 27),
    (733843, 'Mario', 'Saule', 63),
    (631548, 'Alan', 'Snappy', 27),
    (839139, 'Maria', 'Foster', 57);


--01
SELECT o.ord_no, o.purch_amt, o.ord_date, o.customer_id, o.salesman_id
FROM Orders o
JOIN Salesman s ON o.salesman_id = s.salesman_id
WHERE s.name = 'Paul Adam';

--02
SELECT o.ord_no, o.purch_amt, o.ord_date, o.customer_id, o.salesman_id
FROM Orders o
JOIN Salesman s ON o.salesman_id = s.salesman_id
WHERE s.city = 'London';

--03
SELECT o.ord_no, o.purch_amt, o.ord_date, o.customer_id, o.salesman_id
FROM Orders o
WHERE o.customer_id = 3007;

--04
SELECT o.ord_no, o.purch_amt, o.ord_date, o.customer_id, o.salesman_id
FROM Orders o
WHERE o.ord_date = '2012-10-10'
  AND o.purch_amt > (
    SELECT AVG(purch_amt)
    FROM Orders
    WHERE ord_date = '2012-10-10'
);

--05
SELECT o.ord_no, o.purch_amt, o.ord_date, o.customer_id, o.salesman_id
FROM Orders o
JOIN Salesman s ON o.salesman_id = s.salesman_id
WHERE s.city = 'New York';

--06
SELECT s.commission
FROM Salesman s
WHERE s.city = 'Paris';

--07
SELECT c.customer_id, c.cust_name, c.city, c.grade, c.salesman_id
FROM Customer c
JOIN Salesman s ON c.salesman_id = s.salesman_id
WHERE s.name = 'Mc Lyon' AND c.customer_id < 2001;

--08
SELECT c.grade, COUNT(*) AS customer_count
FROM Customer c
WHERE c.city = 'New York'
  AND c.grade > (SELECT AVG(grade) FROM Customer)
GROUP BY c.grade;

--09
SELECT o.ord_no, o.purch_amt, o.ord_date, o.salesman_id
FROM Orders o
JOIN Salesman s ON o.salesman_id = s.salesman_id
WHERE s.commission = (SELECT MAX(commission) FROM Salesman);

--10
SELECT o.ord_no, o.purch_amt, o.ord_date, o.customer_id, o.salesman_id, c.cust_name
FROM Orders o
JOIN Customer c ON o.customer_id = c.customer_id
WHERE o.ord_date = '2012-08-17';

--11
SELECT s.salesman_id, s.name
FROM Salesman s
JOIN Customer c ON s.salesman_id = c.salesman_id
GROUP BY s.salesman_id, s.name
HAVING COUNT(c.customer_id) > 1;

--12
SELECT ord_no, purch_amt, ord_date, customer_id, salesman_id
FROM Orders
WHERE purch_amt > (SELECT AVG(purch_amt) FROM Orders);

--13
SELECT ord_no, purch_amt, ord_date, customer_id, salesman_id
FROM Orders
WHERE purch_amt >= (SELECT AVG(purch_amt) FROM Orders);

--14
SELECT ord_date, SUM(purch_amt) AS total_amt
FROM Orders
GROUP BY ord_date
HAVING SUM(purch_amt) >= (SELECT MAX(purch_amt) FROM Orders) + 1000;

--15
SELECT *
FROM Customer
WHERE EXISTS (
    SELECT 1
    FROM Customer
    WHERE city = 'London'
);

--16
SELECT s.salesman_id, s.name, s.city, s.commission
FROM Salesman s
JOIN Customer c ON s.salesman_id = c.salesman_id
GROUP BY s.salesman_id, s.name, s.city, s.commission
HAVING COUNT(c.customer_id) > 1;

--17
SELECT s.salesman_id, s.name, s.city, s.commission
FROM Salesman s
JOIN Customer c ON s.salesman_id = c.salesman_id
GROUP BY s.salesman_id, s.name, s.city, s.commission
HAVING COUNT(c.customer_id) = 1;

--18
SELECT s.salesman_id, s.name, s.city, s.commission
FROM Salesman s
JOIN Customer c ON s.salesman_id = c.salesman_id
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY s.salesman_id, s.name, s.city, s.commission
HAVING COUNT(o.ord_no) > 1;

--19
SELECT DISTINCT s.salesman_id, s.name, s.city, s.commission
FROM Salesman s
WHERE s.city IN (
    SELECT DISTINCT c.city
    FROM Customer c
);
SELECT DISTINCT c.city FROM Customer c

--20
SELECT DISTINCT s.salesman_id, s.name, s.city, s.commission
FROM Salesman s
INNER JOIN Customer c
ON s.city = c.city;

--21
SELECT DISTINCT s.salesman_id, s.name, s.city, s.commission
FROM Salesman s
JOIN Customer c
ON s.name < c.cust_name;

--22
SELECT c1.customer_id, c1.cust_name, c1.city, c1.grade, c1.salesman_id
FROM Customer c1
WHERE c1.grade > ALL (
    SELECT c2.grade
    FROM Customer c2
    WHERE c2.city > 'New York'
);

--23
SELECT ord_no, purch_amt, ord_date, customer_id, salesman_id
FROM Orders o1
WHERE o1.purch_amt > ANY (
    SELECT o2.purch_amt
    FROM Orders o2
    WHERE o2.ord_date = '2012-09-10'
);

--24
SELECT ord_no, purch_amt, ord_date, customer_id, salesman_id
FROM Orders o
WHERE o.purch_amt < ANY (
    SELECT o2.purch_amt
    FROM Orders o2
    JOIN Customer c ON o2.customer_id = c.customer_id
    WHERE c.city = 'London'
);

--25
SELECT ord_no, purch_amt, ord_date, customer_id, salesman_id
FROM Orders o
WHERE o.purch_amt < (
    SELECT MAX(o2.purch_amt)
    FROM Orders o2
    JOIN Customer c ON o2.customer_id = c.customer_id
    WHERE c.city = 'London'
);

--26
SELECT customer_id, cust_name, city, grade, salesman_id
FROM Customer
WHERE grade > (
    SELECT MAX(grade)
    FROM Customer
    WHERE city = 'New York'
);

--27
SELECT s.name AS salesman_name, s.city, SUM(o.purch_amt) AS total_order_amount
FROM Orders o
JOIN Customer c ON o.customer_id = c.customer_id
JOIN Salesman s ON o.salesman_id = s.salesman_id
WHERE s.city = c.city
GROUP BY s.name, s.city;

--28
SELECT customer_id, cust_name, city, grade, salesman_id
FROM Customer
WHERE grade NOT IN (
    SELECT DISTINCT grade
    FROM Customer
    WHERE city = 'London'
);

--29
SELECT customer_id, cust_name, city, grade, salesman_id
FROM Customer
WHERE grade <> (
    SELECT DISTINCT grade
    FROM Customer
    WHERE city = 'Paris'
);

--30
SELECT customer_id, cust_name, city, grade, salesman_id
FROM Customer
WHERE grade NOT IN (
    SELECT DISTINCT grade
    FROM Customer
    WHERE city = 'Dallas'
);

--31
SELECT c.COM_NAME AS Company, ROUND(AVG(i.PRO_PRICE), 2) AS Average_Price
FROM item_mast i
JOIN company_mast c ON i.PRO_COM = c.COM_ID
GROUP BY c.COM_NAME;

--32
SELECT 
    c.COM_NAME AS Company,
    AVG(i.PRO_PRICE) AS Average_Price
FROM 
    item_mast i
JOIN 
    company_mast c 
ON 
    i.PRO_COM = c.COM_ID
WHERE 
    i.PRO_PRICE >= 350
GROUP BY 
    c.COM_NAME;

--33
SELECT 
    i.PRO_NAME AS Product_Name,
    i.PRO_PRICE AS Price,
    c.COM_NAME AS Company
FROM 
    item_mast i
JOIN 
    company_mast c 
ON 
    i.PRO_COM = c.COM_ID
WHERE 
    i.PRO_PRICE = (
        SELECT MAX(i2.PRO_PRICE)
        FROM item_mast i2
        WHERE i2.PRO_COM = i.PRO_COM
    );

--34
SELECT 
    EMP_IDNO, 
    EMP_FNAME, 
    EMP_LNAME, 
    EMP_DEPT
FROM 
    emp_details
WHERE 
    EMP_LNAME IN ('Gabriel', 'Dosio');

--35
SELECT 
    EMP_IDNO, 
    EMP_FNAME, 
    EMP_LNAME, 
    EMP_DEPT
FROM 
    emp_details
WHERE 
    EMP_DEPT IN (89, 63);

--36
SELECT 
    ed.EMP_FNAME, 
    ed.EMP_LNAME
FROM 
    emp_details ed
JOIN 
    emp_department d
ON 
    ed.EMP_DEPT = d.DPT_CODE
WHERE 
    d.DPT_ALLOTMENT > 50000;

--37
SELECT 
    DPT_CODE, 
    DPT_NAME, 
    DPT_ALLOTMENT
FROM 
    emp_department
WHERE 
    DPT_ALLOTMENT > (
        SELECT 
            AVG(DPT_ALLOTMENT)
        FROM 
            emp_department
    );

--38
SELECT 
    d.DPT_NAME
FROM 
    emp_department d
JOIN 
    emp_details e ON d.DPT_CODE = e.EMP_DEPT
GROUP BY 
    d.DPT_NAME
HAVING 
    COUNT(e.EMP_IDNO) > 2;

--39
SELECT 
    e.EMP_FNAME,
    e.EMP_LNAME
FROM 
    emp_details e
WHERE 
    e.EMP_DEPT = (
        SELECT DPT_CODE
        FROM emp_department
        ORDER BY DPT_ALLOTMENT
        LIMIT 1 OFFSET 1
    );
