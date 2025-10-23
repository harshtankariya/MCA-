-- Step 1: Create the CUSTOMER_lab_3 Table
CREATE TABLE CUSTOMER_lab_3 (
    CID INT,
    CustomerName VARCHAR(100),
    ContactName VARCHAR(100),
    Address VARCHAR(100),
    City VARCHAR(50),
    PostalCode VARCHAR(20),
    Country VARCHAR(50)
);

-- Step 2: Insert Data into CUSTOMER_lab_3
INSERT INTO CUSTOMER_lab_3 VALUES 
(1, 'Alfreds Futterkiste', 'Maria Anders', 'Obere Str. 57', 'Berlin', '12209', 'Germany'),
(2, 'Ana Trujillo Emparedados y helados', 'Ana Trujillo', 'Avda. de la Constitucion 2222', 'Mexico D.F.', '05021', 'Mexico'),
(3, 'Antonio Moreno Taqueria', 'Antonio Moreno', 'Mataderos 2312', 'Mexico D.F.', '05023', 'Mexico'),
(4, 'Around the Horn', 'Thomas Hardy', '120 Hanover Sq.', 'London', 'WA1 1DP', 'UK'),
(5, 'Berglunds snabbkop', 'Christina Berglund', 'Berguvsvagen 8', 'Lulea', 'S-958 22', 'Sweden');

-- Step 3: Queries
-- 1. City like 'L_nd__'
SELECT * FROM CUSTOMER_lab_3 WHERE City LIKE 'L_nd__';

-- 2. City contains 'L'
SELECT * FROM CUSTOMER_lab_3 WHERE City LIKE '%L%';

-- 3. City does NOT contain 'L'
SELECT * FROM CUSTOMER_lab_3 WHERE City NOT LIKE '%L%';

-- 4. CustomerName starts with 'La'
SELECT * FROM CUSTOMER_lab_3 WHERE CustomerName LIKE 'La%';

-- 5. CustomerName does NOT start with 'La'
SELECT * FROM CUSTOMER_lab_3 WHERE CustomerName NOT LIKE 'La%';

-- 6. CustomerName starts with 'a' or 'b'
SELECT * FROM CUSTOMER_lab_3 WHERE CustomerName LIKE 'a%' OR CustomerName LIKE 'b%';

-- 7. CustomerName starts with 'a', 'c', or 't'
SELECT * FROM CUSTOMER_lab_3 WHERE 
    LOWER(CustomerName) LIKE 'a%' OR 
    LOWER(CustomerName) LIKE 'c%' OR 
    LOWER(CustomerName) LIKE 't%';

-- 8. CustomerName starts with 'a' to 'd'
SELECT * FROM CUSTOMER_lab_3 WHERE LOWER(SUBSTR(CustomerName, 1, 1)) BETWEEN 'a' AND 'd';

-- 9. CustomerName ends with 'a'
SELECT * FROM CUSTOMER_lab_3 WHERE CustomerName LIKE '%a';

-- 10. CustomerName does NOT end with 'a'
SELECT * FROM CUSTOMER_lab_3 WHERE CustomerName NOT LIKE '%a';

-- 11. CustomerName starts with 'b' and ends with 's'
SELECT * FROM CUSTOMER_lab_3 WHERE CustomerName LIKE 'b%s';

-- 12. CustomerName contains 'or'
SELECT * FROM CUSTOMER_lab_3 WHERE CustomerName LIKE '%or%';

-- 13. CustomerName starts with 'a' and length >= 3
SELECT * FROM CUSTOMER_lab_3 WHERE CustomerName LIKE 'a__%';

-- 14. CustomerName with 'r' in second position
SELECT * FROM CUSTOMER_lab_3 WHERE CustomerName LIKE '_r%';

-- 15. Customers from Spain
SELECT * FROM CUSTOMER_lab_3 WHERE Country = 'Spain';

lab 4 Queries

-- Step 1: Create the EMPLOYEE_lab_3 table
CREATE TABLE EMPLOYEE_lab_3 (
  EID INT,
  EName VARCHAR(50),
  Department VARCHAR(50),
  Salary INT,
  JoiningDate DATE,
  City VARCHAR(50)
);

-- Step 2: Insert the data into EMPLOYEE_lab_3
INSERT INTO EMPLOYEE_lab_3 VALUES
(101, 'Rahul', 'Admin', 56000, '1990-01-01', 'Rajkot'),
(102, 'Hardik', 'IT', 18000, '1990-09-25', 'Ahmedabad'),
(103, 'Bhavin', 'HR', 25000, '1991-05-14', 'Baroda'),
(104, 'Bhoomi', 'Admin', 39000, '1991-02-08', 'Rajkot'),
(105, 'Rohit', 'IT', 17000, '1990-07-23', 'Jamnagar'),
(106, 'Priya', 'IT', 9000, '1990-10-18', 'Ahmedabad'),
(107, 'Neha', 'HR', 34000, '1991-12-25', 'Rajkot');

-- 1. Highest, Lowest, Total, and Average salary
SELECT MAX(Salary) AS Maximum, MIN(Salary) AS Minimum, SUM(Salary) AS Total_Sal, AVG(Salary) AS Average_Sal FROM EMPLOYEE_lab_3;

-- 2. Total number of employees
SELECT COUNT(*) AS Total_Employees FROM EMPLOYEE_lab_3;

-- 3. Maximum salary from IT department
SELECT MAX(Salary) AS Max_IT_Salary FROM EMPLOYEE_lab_3 WHERE Department = 'IT';

-- 4. Total number of unique cities
SELECT COUNT(DISTINCT City) AS Unique_Cities FROM EMPLOYEE_lab_3;

-- 5. City with total number of employees
SELECT City, COUNT(*) AS Total_Employees FROM EMPLOYEE_lab_3 GROUP BY City;

-- 6. Cities having more than one employee
SELECT City, COUNT(*) AS Employee_Count FROM EMPLOYEE_lab_3 GROUP BY City HAVING COUNT(*) > 1;

-- 7. Total salary of each department
SELECT Department, SUM(Salary) AS Total_Salary FROM EMPLOYEE_lab_3 GROUP BY Department;

-- 8. Average salary of each department (without department name)
SELECT AVG(Salary) AS Average_Salary FROM EMPLOYEE_lab_3 GROUP BY Department;

-- 9. Minimum salary of employees from Ahmedabad
SELECT MIN(Salary) AS Min_Ahmedabad_Salary FROM EMPLOYEE_lab_3 WHERE City = 'Ahmedabad';

-- 10. Departments with total salaries > 50000 and in Rajkot
SELECT Department FROM EMPLOYEE_lab_3 WHERE City = 'Rajkot' GROUP BY Department HAVING SUM(Salary) > 50000;

-- 11. Number of employees in Rajkot
SELECT COUNT(*) AS Rajkot_Employees FROM EMPLOYEE_lab_3 WHERE City = 'Rajkot';

-- 12. Difference between highest and lowest salary
SELECT MAX(Salary) - MIN(Salary) AS DIFFERENCE FROM EMPLOYEE_lab_3;

-- 13. Employees hired before 1st January, 1991
SELECT COUNT(*) AS Hired_Before_1991 FROM EMPLOYEE_lab_3 WHERE JoiningDate < '1991-01-01';

-- 14. Total salary per department exceeding 35000, sorted by salary
SELECT Department, SUM(Salary) AS Total_Salary FROM EMPLOYEE_lab_3 GROUP BY Department HAVING SUM(Salary) > 35000 ORDER BY Total_Salary;

-- 15. Departments with more than two employees
SELECT Department FROM EMPLOYEE_lab_3 GROUP BY Department HAVING COUNT(*) > 2;


_____________________________________________________________________________________________________
part B 
-- Create COMPANY_lab_3 table
CREATE TABLE COMPANY_lab_3 (
    Title VARCHAR(100),
    Company VARCHAR(50),
    Type VARCHAR(50),
    Production_year INT,
    System VARCHAR(20),
    Production_cost INT,
    Revenue INT,
    Rating INT
);

-- Insert data into COMPANY_lab_3
INSERT INTO COMPANY_lab_3 VALUES 
('Blasting Boxes', 'Simone Games', 'action adventure', 1998, 'PC', 100000, 200000, 7),
('Run Run Run!', '13 Mad Bits', 'shooter', 2011, 'PS3', 3500000, 650000, 3),
('Duck n’Go', '13 Mad Bits', 'shooter', 2012, 'Xbox', 3000000, 1500000, 5),
('SQL Wars!', 'Vertabelo', 'wargames', 2017, 'Xbox', 5000000, 25000000, 10),
('Tap Tap Hex!', 'PixelGaming Inc.', 'rhythm', 2006, 'PS2', 2500000, 3500000, 7),
('NoRisk', 'Simone Games', 'action adventure', 2004, 'PS2', 1400000, 3400000, 8);

-- 1. Display the name and total revenue for each company
SELECT Company, SUM(Revenue) AS Total_Revenue
FROM COMPANY_lab_3
GROUP BY Company;

-- 2. Report: year, count, avg cost, avg revenue
SELECT Production_year, 
       COUNT(*) AS count,
       AVG(Production_cost) AS avg_cost,
       AVG(Revenue) AS avg_revenue
FROM COMPANY_lab_3
GROUP BY Production_year;

-- 3. Profitable games by type
SELECT Type, COUNT(*) AS number_of_games
FROM COMPANY_lab_3
WHERE Revenue > Production_cost
GROUP BY Type;

-- 4. Type & total revenue, year > 2010, PS2 or PS3, ordered by revenue
SELECT Type, SUM(Revenue) AS Total_Revenue
FROM COMPANY_lab_3
WHERE Production_year > 2010 AND System IN ('PS2', 'PS3')
GROUP BY Type
ORDER BY Total_Revenue DESC;

-- 5. Company & gross profit sum, ordered by gross profit
SELECT Company, SUM(Revenue - Production_cost) AS gross_profit_sum
FROM COMPANY_lab_3
GROUP BY Company
ORDER BY gross_profit_sum DESC;

-- 6. Yearly gross profit of each company
SELECT Company, Production_year, SUM(Revenue - Production_cost) AS Gross_Profit
FROM COMPANY_lab_3
GROUP BY Company, Production_year
ORDER BY Company, Production_year;

-- 7. Companies with >1 games: name, count, avg cost
SELECT Company, COUNT(*) AS number_of_games, AVG(Production_cost) AS avg_cost
FROM COMPANY_lab_3
GROUP BY Company
HAVING COUNT(*) > 1;

