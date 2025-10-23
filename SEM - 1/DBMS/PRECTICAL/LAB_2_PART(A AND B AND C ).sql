CREATE TABLE EMPLOYEE_LAB_2 (
    EmpNo INT,
    EmpName VARCHAR(50),
    JoiningDate DATE,
    Salary DECIMAL(10,2),
    City VARCHAR(50)
);
INSERT INTO EMPLOYEE_LAB_2 VALUES (101, 'Keyur', '2002-01-05', 12000.00, 'Rajkot');
INSERT INTO EMPLOYEE_LAB_2 VALUES (102, 'Hardik', '2004-02-15', 14000.00, 'Ahmedabad');
INSERT INTO EMPLOYEE_LAB_2 VALUES (103, 'Kajal', '2006-03-14', 15000.00, 'Baroda');
INSERT INTO EMPLOYEE_LAB_2 VALUES (104, 'Bhoomi', '2005-06-23', 12500.00, 'Ahmedabad');
INSERT INTO EMPLOYEE_LAB_2 VALUES (102, 'Harmit', '2004-02-15', 14000.00, 'Rajkot');
SELECT * FROM EMPLOYEE_LAB_2

---1. Display the name of employee whose salary is greater than 13000 and city is either Rajkot or Baroda.
		SELECT EmpName  FROM EMPLOYEE_LAB_2 WHERE Salary > 13000 AND City IN ('RAJKOT' , 'BARODA')

---2. Display the name of employee in ascending order by their name.
		SELECT  EmpName FROM EMPLOYEE_LAB_2 ORDER BY EmpName ASC

---3. Retrieve all unique cities.
		SELECT DISTINCT City FROM EMPLOYEE

---4. Update the city of Keyur and Bhoomi to NULL.
		UPDATE EMPLOYEE_LAB_2 SET CITY = NULL WHERE EmpName IN ('KEYUR ', 'BHOOMI' )

---5. Display the name of employee whose city is NULL.
		SELECT EmpName FROM EMPLOYEE_LAB_2 WHERE City IS NULL 

---6. Delete all the records of Employee table having salary greater than and equals to 14000.
	DELETE FROM EMPLOYEE_LAB_2 WHERE Salary >= 14000

---7. Delete all the Employees who belongs to ‘RAJKOT’ city.
	DELETE FROM EMPLOYEE_LAB_2  WHERE City = 'Rajkot'

---8. Delete all the Employees who joined after 1-1-2007.
	DELETE FROM EMPLOYEE_LAB_2 WHERE JoiningDate > '2007-01-01'

---9. Delete all the records of Employee table. (Use Truncate)
		TRUNCATE TABLE EMPLOYEE_LAB_2

---10. Remove Employee table. (Use Drop)
		DROP TABLE EMPLOYEE_LAB_2

---11. Delete all the records of DEPOSIT table. (Use Truncate)
		TRUNCATE TABLE DEPOSIT

---12. Remove DEPOSIT table. (Use Drop)
		DROP TABLE DEPOSIT

---13. Remove BRANCH table. (Use Drop)
		DROP TABLE BRANCH 

---14. Remove CUSTOMERS table. (Use Drop)
		DROP TABLE CUSTOMERS

---15. Remove BORROW table. (Use Drop)
		DROP TABLE BORROW
-------------------------------------------- PART B ------------------------------
CREATE TABLE ACCOUNT_LAB_2 (
    ACTNO INT,
    CNAME VARCHAR(50),
    BNAME VARCHAR(50),
    AMOUNT DECIMAL(10,2),
    ADATE DATE
);

INSERT INTO ACCOUNT_LAB_2 VALUES (101, 'ANIL', 'VRCE', 1000.00, '1995-03-01');
INSERT INTO ACCOUNT_LAB_2 VALUES (102, 'SUNIL', 'AJNI', 5000.00, '1996-01-04');
INSERT INTO ACCOUNT_LAB_2 VALUES (103, 'MEHUL', 'KAROLBAGH', 3500.00, '1995-11-17');
INSERT INTO ACCOUNT_LAB_2 VALUES (104, 'MADHURI', 'CHANDI', 1200.00, '1995-12-17');
INSERT INTO ACCOUNT_LAB_2 VALUES (105, 'PRMOD', 'M.G. ROAD', 3000.00, '1996-03-27');
INSERT INTO ACCOUNT_LAB_2 VALUES (106, 'SANDIP', 'ANDHERI', 2000.00, '1996-03-31');
INSERT INTO ACCOUNT_LAB_2 VALUES (107, 'SHIVANI', 'VIRAR', 1000.00, '1995-09-05');
INSERT INTO ACCOUNT_LAB_2 VALUES (108, 'KRANTI', 'NEHRU PLACE', 5000.00, '1995-07-02');
INSERT INTO ACCOUNT_LAB_2 VALUES (109, 'MINU', 'POWAI', 7000.00, '1995-08-10');

SELECT * FROM ACCOUNT_LAB_2

---1. Retrieve all unique BNAME.
		SELECT DISTINCT BNAME FROM ACCOUNT_LAB_2

---2. Display the Cname in ascending order by their amount and if amount is same then in descending order by cname.
		SELECT CNAME 
		FROM ACCOUNT_LAB_2 
		ORDER BY AMOUNT ASC, CNAME DESC


---3. Update the BNAME of Anil and Shivani to NULL.
		UPDATE ACCOUNT_LAB_2 SET BNAME = NULL WHERE CNAME IN ('ANIL', 'SHIVANI')


---4. Display the Cname of customers whose Bname is NULL.
	SELECT CNAME 	FROM ACCOUNT_LAB_2 WHERE BNAME IS NULL


---5. Delete all the records of Account table having amount greater than and equals to 4000. 
	DELETE FROM ACCOUNT_LAB_2  WHERE AMOUNT >= 4000

---6. Delete all the accounts Bname is CHANDI.
	DELETE FROM ACCOUNT_LAB_2 WHERE BNAME = 'CHANDI'

---7. Delete all the accounts having adate after 1-10-1995.
	DELETE FROM ACCOUNT_LAB_2 WHERE ADATE > '1995-10-01'

---8. Delete all the records of Account table. (Use Truncate)
	TRUNCATE TABLE ACCOUNT_LAB_2

---9. Remove Account table. (Use Drop)
	DROP TABLE ACCOUNT_LAB_2

---------------------- PART C ---------------------------------

---1. Display the Cname whose Bname is either AJNI or CHANDI and amount is greater than 3000 and sort the
    --result in ascending order by their amount and if amount is same then in descending order by cname.
		SELECT CNAME 
		FROM ACCOUNT_LAB_2 
		WHERE BNAME IN ('AJNI', 'CHANDI') AND AMOUNT > 3000
		ORDER BY AMOUNT ASC, CNAME DESC


---2. Retrieve top 3 unique BNAME and sort them in ascending order on BNAME.
		SELECT TOP 3  DISTINCT BNAME FROM ACCOUNT_LAB_2 ORDER BY BNAME ASC


---3. Display the Cname whose ACTNO is greater than 103 and sort the result in ascending order by their amount
    --and if amount is same then in descending order by cname.
	SELECT CNAME 
	FROM ACCOUNT_LAB_2
	WHERE ACTNO > 103
	ORDER BY AMOUNT ASC, CNAME DESC


---4. Update the BNAME of Anil, Mehul and Shivani to NULL.
	UPDATE ACCOUNT_LAB_2 
	SET BNAME = NULL 
	WHERE CNAME IN ('ANIL', 'MEHUL', 'SHIVANI')


---5. Display the Cname of customers whose Bname is NULL.
	SELECT CNAME 
	FROM ACCOUNT_LAB_2 
	WHERE BNAME IS NULL


---6. Update the amount of Anil to 5000.
	UPDATE ACCOUNT_LAB_2 
	SET AMOUNT = 5000 
	WHERE CNAME = 'ANIL'


---7. Update amount of actno 109 to NULL.
	UPDATE ACCOUNT_LAB_2 
	SET AMOUNT = NULL 
	WHERE ACTNO = 109


---8. Retrieve all the records of account table as per their bname in descending order.
	SELECT * 
	FROM ACCOUNT_LAB_2 
	ORDER BY BNAME DESC


---9. Delete all the records of Account table. (Use Truncate)
	TRUNCATE TABLE ACCOUNT_LAB_2

---10. Remove Account table. (Use Drop)
	DROP TABLE ACCOUNT_LAB_2

