CREATE TABLE STUDENT_pre_6 (
    Rno INT PRIMARY KEY,
    Name VARCHAR(50),
    Branch VARCHAR(10)
);

INSERT INTO STUDENT_pre_6 (Rno, Name, Branch) VALUES
(101, 'Raju', 'CE'),
(102, 'Amit', 'CE'),
(103, 'Sanjay', 'ME'),
(104, 'Neha', 'EC'),
(105, 'Meera', 'EE'),
(106, 'Mahesh', 'ME');


CREATE TABLE RESULT_pre_6 (
    Rno INT PRIMARY KEY,
    SPI DECIMAL(3,1),
    FOREIGN KEY (Rno) REFERENCES STUDENT_pre_6(Rno)
);

INSERT INTO RESULT_pre_6 (Rno, SPI) VALUES
(101, 8.8),
(102, 9.2),
(103, 7.6),
(104, 8.2),
(105, 7.0),
(106, 8.9);

CREATE TABLE EMPLOYEE_pre_6 (
    EmployeeNo VARCHAR(5) PRIMARY KEY,
    Name VARCHAR(50),
    ManagerNo VARCHAR(5)
);

INSERT INTO EMPLOYEE_pre_6 (EmployeeNo, Name, ManagerNo) VALUES
('E01', 'Tarun', NULL),
('E02', 'Rohan', 'E02'),
('E03', 'Priya', 'E01'),
('E04', 'Milan', 'E03'),
('E05', 'Jay', 'E01'),
('E06', 'Anjana', 'E04');

select * from [dbo].[STUDENT_pre_6]
select * from [dbo].[RESULT_pre_6]
select * from [dbo].[EMPLOYEE_pre_6]


--1. Combine information from student and result table using cross join or Cartesian product.

	SELECT * FROM STUDENT_pre_6 CROSS JOIN RESULT_pre_6

--2. Display Rno, Name, Branch and SPI of all students.
	SELECT S.Rno , S.Name , S.Branch ,  R.SPI
	FROM STUDENT_pre_6 S JOIN RESULT_pre_6 R 
	ON S.Rno =R.Rno

--3. Display Rno, Name, Branch and SPI of CE branch�s student only.
	SELECT S.Rno , S.Name , S.Branch ,  R.SPI
	FROM STUDENT_pre_6 S INNER JOIN RESULT_pre_6 R 
	ON S.Rno =R.Rno
	WHERE S.Branch ='CE'	

--4. Display Rno, Name, Branch and SPI of other than EC branch�s student only.
	SELECT S.Rno , S.Name , S.Branch ,  R.SPI
	FROM STUDENT_pre_6 S INNER JOIN RESULT_pre_6 R 
	ON S.Rno =R.Rno
	WHERE S.Branch != 'EC'

--5. Display average result of each branch.
	SELECT S.Branch , AVG(R.SPI) AS AVERAGE_RESULT
	FROM STUDENT_pre_6 S JOIN RESULT_pre_6 R 
	ON S.Rno =R.Rno
	GROUP BY S.Branch

--6. Display average result of each branch and sort them in ascending order by SPI.
	SELECT S.Branch , AVG(R.SPI) AS AVERAGE_RESULT
	FROM STUDENT_pre_6 S JOIN RESULT_pre_6 R 
	ON S.Rno =R.Rno
	GROUP BY S.Branch
	ORDER BY AVERAGE_RESULT ASC

--7. Display average result of CE and ME branch.
	SELECT S.Branch , AVG(R.SPI) AS AVERAGE_RESULT
	FROM STUDENT_pre_6 S JOIN RESULT_pre_6 R 
	ON S.Rno =R.Rno
	WHERE S.branch IN ('CE','ME')
	GROUP BY S.Branch	

--8. Perform the left outer join on Student and Result tables.
	SELECT *
	FROM STUDENT_pre_6 S LEFT OUTER JOIN  RESULT_pre_6 R 
	ON S.Rno =R.Rno


--9. Perform the right outer join on Student and Result tables.
	SELECT *
	FROM STUDENT_pre_6 S RIGHT OUTER JOIN  RESULT_pre_6 R 
	ON S.Rno =R.Rno


--10. Perform the full outer join on Student and Result tables.
	SELECT *
	FROM STUDENT_pre_6 S FULL OUTER JOIN  RESULT_pre_6 R 
	ON S.Rno =R.Rno


--11. Retrieve the names of employee along with their manager name from the Employee table.
	SELECT E1.Name AS EMPLOYEE_NAME , E2.Name AS MANAGER_NAME  
	FROM EMPLOYEE_pre_6 E1 JOIN EMPLOYEE_pre_6 E2
	ON E1.ManagerNo = E2.EmployeeNo

	SELECT * FROM EMPLOYEE_pre_6
--------------------------- PART - B ----------------------------------------

CREATE TABLE DEPARTMENT_PRE_6 (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50),
    DepartmentCode VARCHAR(10),
    Location VARCHAR(50)
);

INSERT INTO DEPARTMENT_PRE_6 (DepartmentID, DepartmentName, DepartmentCode, Location) VALUES
(1, 'Admin', 'Admin', 'A-Block'),
(2, 'Computer', 'CE', 'C-Block'),
(3, 'Civil', 'CI', 'G-Block'),
(4, 'Electrical', 'EE', 'E-Block'),
(5, 'Mechanical', 'ME', 'B-Block');

CREATE TABLE PERSON_PRE_6 (
    PersonID INT PRIMARY KEY,
    PersonName VARCHAR(100),
    DepartmentID INT,
    Salary INT,
    JoiningDate DATE,
    City VARCHAR(50),
    FOREIGN KEY (DepartmentID) REFERENCES DEPARTMENT(DepartmentID)
);

INSERT INTO PERSON_PRE_6 (PersonID, PersonName, DepartmentID, Salary, JoiningDate, City) VALUES
(101, 'Rahul Tripathi', 2, 56000, '2000-01-01', 'Rajkot'),
(102, 'Hardik Pandya', 3, 18000, '2001-09-25', 'Ahmedabad'),
(103, 'Bhavin Kanani', 4, 25000, '2000-05-14', 'Baroda'),
(104, 'Bhoomi Vaishnav', 1, 39000, '2005-02-08', 'Rajkot'),
(105, 'Rohit Topiya', 2, 17000, '2001-07-23', 'Jamnagar'),
(106, 'Priya Menpara', NULL, 9000, '2000-10-18', 'Ahmedabad'),
(107, 'Neha Sharma', 2, 34000, '2002-12-25', 'Rajkot'),
(108, 'Nayan Goswami', 3, 25000, '2001-07-01', 'Rajkot'),
(109, 'Mehul Bhundiya', 4, 13500, '2005-01-09', 'Baroda'),
(110, 'Mohit Maru', 5, 14000, '2000-05-25', 'Jamnagar');

SELECT * FROM [dbo].[DEPARTMENT_PRE_6]
SELECT * FROM [dbo].[PERSON_PRE_6]

---1. Find all persons with their department name & code.
	SELECT P.PersonName, D.DepartmentName , D.DepartmentCode
	FROM PERSON_PRE_6 P INNER JOIN DEPARTMENT_PRE_6 D
	ON P.DepartmentID = D.DepartmentID

---2. Give department wise maximum & minimum salary with department name.
	SELECT D.DepartmentName , MAX(P.Salary) AS MAX_SALARY , MIN(P.Salary) AS MIN_SALARY
	FROM PERSON_PRE_6 P INNER JOIN DEPARTMENT_PRE_6 D
	ON P.DepartmentID = D.DepartmentID
	GROUP BY D.DepartmentName

---3. Find all departments whose total salary is exceeding 100000.
	SELECT D.DepartmentName , SUM(P.Salary) AS TOTAL_SALARY
	FROM PERSON_PRE_6 P INNER JOIN DEPARTMENT_PRE_6 D
	ON P.DepartmentID = D.DepartmentID
	GROUP BY D.DepartmentName
	HAVING SUM(P.Salary)> 100000
	
---4. Retrieve person name, salary & department name who belongs to Jamnagar city.
	SELECT P.PersonName , P.Salary , D.DepartmentName , P.City
	FROM PERSON_PRE_6 P INNER JOIN DEPARTMENT_PRE_6 D
	ON P.DepartmentID = D.DepartmentID
	WHERE P.City ='JAMNAGAR'
	
---5. Find all persons who does not belongs to any department.
	SELECT *
	FROM PERSON_PRE_6 
	WHERE DepartmentID IS NULL

---6. Find department wise person counts.
	SELECT D.DepartmentName , COUNT(P.PersonID) AS TOTAL_EMPLOYEE
	FROM PERSON_PRE_6 P INNER JOIN DEPARTMENT_PRE_6 D
	ON P.DepartmentID = D.DepartmentID
	GROUP BY D.DepartmentName

---7. Find average salary of person who belongs to Ahmedabad city.
	SELECT  AVG(P.Salary) AS AVG_SALARY
	FROM PERSON_PRE_6 P
	WHERE P.City ='Ahmedabad'
	
---8. Produce Output Like: <PersonName> earns <Salary> from department <DepartmentName> monthly. (In
---Single Column)
	SELECT CONCAT (P.PersonName ,' EARNS ' , P.Salary ,' FROM DEPARTMENT ', D.DepartmentName ,' MONTHLY ' ) AS INFORMATION
	FROM PERSON_PRE_6 P INNER JOIN DEPARTMENT_PRE_6 D 
	ON P.DepartmentID = D.DepartmentID
	
---9. List all departments who have no persons.
	SELECT D.DepartmentName 
	FROM PERSON_PRE_6 P LEFT JOIN DEPARTMENT_PRE_6 D
	ON P.DepartmentID = D.DepartmentID
	WHERE P.PersonID IS NULL

---10. Find city & department wise total, average & maximum salaries.
	SELECT P.City , D.DepartmentName ,
		SUM(P.Salary) AS TOTAL_SALARY ,
		AVG(P.Salary) AS AVG_SALARY , 
		MAX(p.Salary) AS MAX_SALARY
	FROM PERSON_PRE_6 P INNER JOIN DEPARTMENT_PRE_6 D
	ON P.DepartmentID = D.DepartmentID
	GROUP BY P.City , D.DepartmentName
---------------------- PART - C -------------------------------------
---1. Display Unique city names.
	SELECT DISTINCT CITY FROM PERSON_PRE_6

---2. List out department names in which more than two persons.
	SELECT D.DepartmentName , COUNT(P.PersonID) AS TOTAL_EMPLOYEE
	FROM PERSON_PRE_6 P INNER JOIN DEPARTMENT_PRE_6 D
	ON P.DepartmentID = D.DepartmentID	
	GROUP BY D.DepartmentName
	HAVING COUNT(P.PersonID) > 2

---3. Combine person name�s first three characters with city name�s last three characters in single column.
	SELECT CONCAT(LEFT(PersonName, 3) , RIGHT(CITY,3)) AS COMBINED_COLUMN FROM PERSON_PRE_6

	SELECT * FROM [dbo].[PERSON_PRE_6]
---4. Give 10% increment in Computer department employee�s salary.
	UPDATE PERSON_PRE_6
	SET Salary = Salary * 1.10
	WHERE DepartmentID = (
    SELECT DepartmentID
    FROM DEPARTMENT_PRE_6
    WHERE DepartmentName = 'Computer'
);

---5. Display all the person name�s who�s joining dates difference with current date is more than 365 days.
	SELECT PersonName
	FROM PERSON_PRE_6
	WHERE DATEDIFF(DAY, JoiningDate, GETDATE()) > 365;
