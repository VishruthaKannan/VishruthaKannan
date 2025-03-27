             ----Coding Challenge - Car Rental System � SQL----
CREATE TABLE Vehicle (
    vehicleID INT PRIMARY KEY,
    make VARCHAR(50) NOT NULL,
    model VARCHAR(50) NOT NULL,
    year INT NOT NULL,
    dailyRate DECIMAL(10, 2) NOT NULL,
    status ENUM('available', 'notAvailable') NOT NULL,
    passengerCapacity INT NOT NULL,
    engineCapacity DECIMAL(5, 2) NOT NULL
);

CREATE TABLE Customer (
    customerID INT PRIMARY KEY,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phoneNumber VARCHAR(15) NOT NULL
);

CREATE TABLE Lease (
    leaseID INT PRIMARY KEY,
    vehicleID INT NOT NULL,
    customerID INT NOT NULL,
    startDate DATE NOT NULL,
    endDate DATE NOT NULL,
    type ENUM('DailyLease', 'MonthlyLease') NOT NULL,
    FOREIGN KEY (vehicleID) REFERENCES Vehicle(vehicleID)
        ON DELETE CASCADE,
    FOREIGN KEY (customerID) REFERENCES Customer(customerID)
        ON DELETE CASCADE
);

CREATE TABLE Payment (
    paymentID INT PRIMARY KEY,
    leaseID INT NOT NULL,
    paymentDate DATE NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (leaseID) REFERENCES Lease(leaseID)
        ON DELETE CASCADE
);

INSERT INTO Vehicle (vehicleID, make, model, year, dailyRate, status, passengerCapacity, engineCapacity)
VALUES
(1, 'Toyota', 'Camry', 2022, 50.00, 'available', 4, 1450),
(2, 'Honda', 'Civic', 2023, 45.00, 'available', 7, 1500),
(3, 'Ford', 'Focus', 2022, 48.00, 'notAvailable', 4, 1400),
(4, 'Nissan', 'Altima', 2023, 52.00, 'available', 7, 1200),
(5, 'Chevrolet', 'Malibu', 2022, 47.00, 'available', 4, 1800),
(6, 'Hyundai', 'Sonata', 2023, 49.00, 'notAvailable', 7, 1400),
(7, 'BMW', '3 Series', 2023, 60.00, 'available', 7, 2499),
(8, 'Mercedes', 'C-Class', 2022, 58.00, 'available', 8, 2599),
(9, 'Audi', 'A4', 2022, 55.00, 'notAvailable', 4, 2500),
(10, 'Lexus', 'ES', 2023, 54.00, 'available', 4, 2500);

INSERT INTO Customer (customerID, firstName, lastName, email, phoneNumber)
VALUES
(1, 'John', 'Doe', 'johndoe@example.com', '555-555-5555'),
(2, 'Jane', 'Smith', 'janesmith@example.com', '555-123-4567'),
(3, 'Robert', 'Johnson', 'robert@example.com', '555-789-1234'),
(4, 'Sarah', 'Brown', 'sarah@example.com', '555-456-7890'),
(5, 'David', 'Lee', 'david@example.com', '555-987-6543'),
(6, 'Laura', 'Hall', 'laura@example.com', '555-234-5678'),
(7, 'Michael', 'Davis', 'michael@example.com', '555-876-5432'),
(8, 'Emma', 'Wilson', 'emma@example.com', '555-432-1098'),
(9, 'William', 'Taylor', 'william@example.com', '555-321-6547'),
(10, 'Olivia', 'Adams', 'olivia@example.com', '555-765-4321');

INSERT INTO Lease (leaseID, vehicleID, customerID, startDate, endDate, type)
VALUES
(1, 1, 1, '2023-01-01', '2023-01-05', 'DailyLease'),
(2, 2, 2, '2023-02-15', '2023-02-28', 'MonthlyLease'),
(3, 3, 3, '2023-03-10', '2023-03-15', 'DailyLease'),
(4, 4, 4, '2023-04-20', '2023-04-30', 'MonthlyLease'),
(5, 5, 5, '2023-05-05', '2023-05-10', 'DailyLease'),
(6, 4, 3, '2023-06-15', '2023-06-30', 'MonthlyLease'),
(7, 7, 7, '2023-07-01', '2023-07-10', 'DailyLease'),
(8, 8, 8, '2023-08-12', '2023-08-15', 'MonthlyLease'),
(9, 3, 3, '2023-09-07', '2023-09-10', 'DailyLease'),
(10, 10, 10, '2023-10-10', '2023-10-31', 'MonthlyLease');

INSERT INTO Payment (paymentID, leaseID, paymentDate, amount)
VALUES
(1, 1, '2023-01-03', 200.00),
(2, 2, '2023-02-20', 1000.00),
(3, 3, '2023-03-12', 75.00),
(4, 4, '2023-04-25', 900.00),
(5, 5, '2023-05-07', 60.00),
(6, 6, '2023-06-18', 1200.00),
(7, 7, '2023-07-03', 40.00),
(8, 8, '2023-08-14', 1100.00),
(9, 9, '2023-09-09', 80.00),
(10, 10, '2023-10-25', 1500.00);

--01
UPDATE Vehicle
SET dailyRate = 68.00
WHERE make = 'Mercedes';

--02
DELETE FROM Customer
WHERE customerID = 3;

--03
ALTER TABLE Payment
CHANGE paymentDate transactionDate DATE NOT NULL;

--04
SELECT * 
FROM Customer
WHERE email = 'vk0614@gamil.com';

--05
SELECT L.leaseID, V.make, V.model, L.startDate, L.endDate, L.type
FROM Lease L
JOIN Vehicle V ON L.vehicleID = V.vehicleID
WHERE L.customerID = 5 AND L.endDate >= CURDATE();

--06
SELECT P.paymentID, P.transactionDate, P.amount, L.leaseID
FROM Payment P
JOIN Lease L ON P.leaseID = L.leaseID
JOIN Customer C ON L.customerID = C.customerID
WHERE C.phoneNumber = '555-123-1075';

--07
SELECT AVG(dailyRate) AS avgDailyRate
FROM Vehicle
WHERE status = 'available';

--08
SELECT make, model, dailyRate
FROM Vehicle
ORDER BY dailyRate DESC
LIMIT 1;

--09
SELECT V.make, V.model, L.startDate, L.endDate
FROM Lease L
JOIN Vehicle V ON L.vehicleID = V.vehicleID
WHERE L.customerID = 3;

--10
SELECT L.*, C.firstName, C.lastName, V.make, V.model
FROM Lease L
JOIN Customer C ON L.customerID = C.customerID
JOIN Vehicle V ON L.vehicleID = V.vehicleID
ORDER BY L.startDate DESC
LIMIT 1;

--11
SELECT *
FROM Payment
WHERE YEAR(transactionDate) = 2023;

--12
SELECT C.*
FROM Customer C
LEFT JOIN Lease L ON C.customerID = L.customerID
LEFT JOIN Payment P ON L.leaseID = P.leaseID
WHERE P.paymentID IS NULL;

--13
SELECT V.vehicleID, V.make, V.model, SUM(P.amount) AS totalPayments
FROM Vehicle V
JOIN Lease L ON V.vehicleID = L.vehicleID
JOIN Payment P ON L.leaseID = P.leaseID
GROUP BY V.vehicleID, V.make, V.model;

--14
SELECT C.customerID, C.firstName, C.lastName, SUM(P.amount) AS totalPayments
FROM Customer C
JOIN Lease L ON C.customerID = L.customerID
JOIN Payment P ON L.leaseID = P.leaseID
GROUP BY C.customerID, C.firstName, C.lastName;

--15
SELECT L.leaseID, V.make, V.model, L.startDate, L.endDate, L.type
FROM Lease L
JOIN Vehicle V ON L.vehicleID = V.vehicleID;

--16
SELECT L.leaseID, C.firstName, C.lastName, V.make, V.model, L.startDate, L.endDate
FROM Lease L
JOIN Customer C ON L.customerID = C.customerID
JOIN Vehicle V ON L.vehicleID = V.vehicleID
WHERE L.endDate >= CURDATE();

--17
SELECT C.customerID, C.firstName, C.lastName, SUM(P.amount) AS totalSpent
FROM Customer C
JOIN Lease L ON C.customerID = L.customerID
JOIN Payment P ON L.leaseID = P.leaseID
GROUP BY C.customerID, C.firstName, C.lastName
ORDER BY totalSpent DESC
LIMIT 1;

--18
SELECT V.vehicleID, V.make, V.model, L.leaseID, C.firstName, C.lastName, L.startDate, L.endDate
FROM Vehicle V
LEFT JOIN Lease L ON V.vehicleID = L.vehicleID AND L.endDate >= CURDATE()
LEFT JOIN Customer C ON L.customerID = C.customerID
ORDER BY V.vehicleID;
