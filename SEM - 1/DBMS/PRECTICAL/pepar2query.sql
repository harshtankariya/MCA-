CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100)
);

CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100),
    EmailID VARCHAR(100),
    City VARCHAR(100),
    Mobile VARCHAR(20),
    JoiningDate DATE,
    Salary DECIMAL(10, 2),
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Department(DepartmentID)
);


INSERT INTO Department (DepartmentID, DepartmentName) VALUES (1, 'HR');
INSERT INTO Department (DepartmentID, DepartmentName) VALUES (2, 'Finance');
INSERT INTO Department (DepartmentID, DepartmentName) VALUES (3, 'Engineering');
INSERT INTO Department (DepartmentID, DepartmentName) VALUES (4, 'Sales');
INSERT INTO Department (DepartmentID, DepartmentName) VALUES (5, 'Marketing');
INSERT INTO Department (DepartmentID, DepartmentName) VALUES (6, 'IT');
INSERT INTO Department (DepartmentID, DepartmentName) VALUES (7, 'Operations');
INSERT INTO Department (DepartmentID, DepartmentName) VALUES (8, 'Customer Service');
INSERT INTO Department (DepartmentID, DepartmentName) VALUES (9, 'Logistics');
INSERT INTO Department (DepartmentID, DepartmentName) VALUES (10, 'Research');


INSERT INTO Employee (EmployeeID, Name, EmailID, City, Mobile, JoiningDate, Salary, DeptID) 
VALUES (1, 'Paul Kelly', 'robertsonashley@hotmail.com', 'North Donna', '194.024.9703x90952', '2023-04-13', 33936, 4);

INSERT INTO Employee (EmployeeID, Name, EmailID, City, Mobile, JoiningDate, Salary, DeptID) 
VALUES (2, 'Joseph Gibson', 'nicole75@yahoo.com', 'East Andrew', '(234)662-1661x6582', '2023-06-14', 144875, 7);

INSERT INTO Employee (EmployeeID, Name, EmailID, City, Mobile, JoiningDate, Salary, DeptID) 
VALUES (3, 'Kathleen Brown', 'carla37@gmail.com', 'Lake Curtisstad', '429.663.2720x2546', '2020-03-29', 124100, 1);

INSERT INTO Employee (EmployeeID, Name, EmailID, City, Mobile, JoiningDate, Salary, DeptID) 
VALUES (4, 'Stephanie Martin', 'uboyd@gmail.com', 'Martinezberg', '524-607-6449x961', '2020-06-27', 147190, 5);

INSERT INTO Employee (EmployeeID, Name, EmailID, City, Mobile, JoiningDate, Salary, DeptID) 
VALUES (5, 'Mary Green', 'michaelcarr@clark.com', 'Lopezview', '242-108-7075x29594', '2020-07-09', 101847, 4);


SELECT * FROM Employee WHERE City ='CHANGA'
SELECT * FROM Employee WHERE City = 'Changa';

SELECT e.EmployeeID, e.Name, e.EmailID, e.Mobile, d.DepartmentName
FROM Employee e
JOIN Department d ON e.DeptID = d.DepartmentID
WHERE e.EmailID IS NULL OR e.Mobile IS NULL;

SELECT TOP 3 * FROM Employee  E 
INNER JOIN Department D 
ON E.DeptID = D.DepartmentID
GROUP BY D.DepartmentName
ORDER BY Salary

SELECT City, COUNT(*) AS EmployeeCount
FROM Employee		
GROUP BY City;

DELETE FROM Employee
WHERE DeptID = (
    SELECT DepartmentID 
    FROM Department 
    WHERE DepartmentName = 'HR'
)
AND Salary > 45000;
