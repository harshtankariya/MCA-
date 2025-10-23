CREATE TABLE DEPOSIT (
	ACTNO INT , 
	CNAME VARCHAR(50),
	BNAME VARCHAR(50),
	AMOUNT DECIMAL(8,2),
	ADATE DATETIME 
)

CREATE TABLE BRANCH (
	BNAME VARCHAR(50),
	CITY VARCHAR(50)
)

CREATE TABLE CUSTOMERS (
	CNAME VARCHAR(50),
	CITY VARCHAR(50)
)

CREATE TABLE BORROW (
	LOANNO INT ,
	CNAME VARCHAR(50),
	BNAME VARCHAR(50),
	AMOUNT DECIMAL(8,2)
)

SELECT * FROM DEPOSIT

INSERT INTO DEPOSIT VALUES (101 ,  'ANIL', 'VRCE', 1000 , '1-MAR-95')

INSERT INTO DEPOSIT VALUES (102 ,  'SUNIL', 'AJNI ', 5000 , '4-JAN-96'),
						   (103 ,  'MEHUL', 'KAROLBAGH ', 3500 , '17-NOV-95'),
						   (104 ,  'MADHURI', 'CHANDI ', 1200 , '17-DEC-96'),
						   (105 ,  'PRMOD', 'M.G. ROAD  ', 3000 , '27-MAR-96'),
						   (106 ,  'SANDIP', 'ANDHERI ', 2000 , '31-MAR-96'),
						   (107 ,  'SHIVANI', 'VIRAR ', 1000 , '5-SEP-95'),
						   (108 ,  'KRANTI', 'NEHRU PLACE  ', 5000 , '4-JUL-95'),
						   (109 ,  'MINU', 'POWAI ', 7000 , '10-AUG-95');

INSERT INTO CUSTOMERS VALUES('ANIL','CALCUTTA'),
('SUNIL','DELHI'),
('MEHIL','BARODA'),
('MANDAR','PATNA'),
('MADHURI','NAGPUR'),
('PRAMOD','NAGPUR'),
('SANDIP','SURAT'),
('SHIVANI','BOMBAY'),
('KRANTI','BOMBAY');
INSERT INTO CUSTOMERS VALUES('NAREN','BOMBAY');

INSERT INTO BRANCH VALUES('VRCE','NAGPUR'),
						 ('AJNI','NAGPUR'),
						 ('KAROLBAGH','DELHI'),
						 ('CHANDI','DELHI'),
						 ('DHARAMPETH','NAGPUR'),
						 ('M.G.ROAD','BANGLORE'),
						 ('ANDHERI','BOMBAY'),
						 ('VIRAR','BOMBAY'),
					  	 ('NEHRU PLACE','DELHI'),
						 ('POWAI','BOMBAY');

INSERT INTO BORROW VALUES(201,'ANIL','VRCE',1000.00),
						 (206,'MEHUL','AJNI',5000.00),
						 (311,'SUNIL','DHARAMPETH',3000.00),
						 (321,'MADHURI','ANDHERI',2000.00),
						 (375,'PRAMOD','VIRAR',8000.00),
						 (481,'KRANTI','NEHRU PLACE',3000.00);

SELECT * FROM DEPOSIT
SELECT * FROM BORROW
SELECT * FROM BRANCH
SELECT * FROM CUSTOMERS

--4. Insert a record (550,’JAY’,’AJNI’,NULL)in the BORROW table
	INSERT INTO BORROW VALUES(550,'JAY','AJNI',NULL);
--5. Display Account No, Customer Name & Amount from DEPOSIT.
	SELECT ACTNO, CNAME, AMOUNT FROM DEPOSIT
--6. Display Loan No, Amount from BORROW.	SELECT LOANNO, AMOUNT FROM BORROW--7. Display loan details of all customers who belongs to ‘ANDHERI’ branch.	SELECT CNAME FROM DEPOSIT
	WHERE BNAME='ANDHERI'

--8. Give account no and amount of depositor, whose account no is equals to 106. 
	SELECT ACTNO , AMOUNT FROM DEPOSIT WHERE ACTNO='106' 

--9. Give name of borrowers having amount greater than 5000. 
	SELECT * FROM BORROW WHERE AMOUNT>'5000'

--10. Give name of customers who opened account after date '1-12-96'. 
	SELECT * FROM DEPOSIT WHERE ADATE>'1-DEC-95'

--11. Display name of customers whose account no is less than 105.
	SELECT * FROM DEPOSIT WHERE ACTNO<105
--12. Display name of customer who belongs to either ‘NAGPUR’ Or ‘DELHI’. (OR & IN)
	SELECT * FROM BRANCH WHERE CITY='NAGPUR' OR CITY='DELHI'

	SELECT * FROM BRANCH WHERE CITY IN ('NAGPUR','DELHI')

--13. Display name of customers with branch whose amount is greater than 4000 and account no is less than 105.
	SELECT CNAME, BNAME FROM DEPOSIT WHERE AMOUNT>'4000' AND ACTNO<'105'
--14. Find all borrowers whose amount is greater than equals to 3000 & less than equals to 8000. (AND & BETWEEN)
	SELECT * FROM BORROW WHERE AMOUNT>=3000 AND AMOUNT<=8000

	SELECT * FROM BORROW WHERE AMOUNT BETWEEN 3000 AND 8000

--15. Find all depositors who do not belongs to ‘ANDHERI’ branch.
	SELECT * FROM DEPOSIT WHERE BNAME!='ANDHERI'
--16. Display Account No, Customer Name & Amount of such customers who belongs to ‘AJNI’, ‘KAROLBAGH’ Or ‘M.G.ROAD’ and Account No is less than 104.
	SELECT ACTNO , CNAME, AMOUNT FROM DEPOSIT WHERE BNAME IN ('AJNI','KAROLBAGH','M.G.ROAD') AND ACTNO<'104'
--17. Display all the details of first five customers.
	SELECT TOP 5 * FROM CUSTOMERS

--18. Display all the details of first three depositors whose amount is greater than 1000.
	SELECT TOP 3 * FROM DEPOSIT WHERE AMOUNT>1000

--19. Display Loan No, Customer Name of first five borrowers whose branch name does not belongs to ‘ANDHERI’.
	SELECT TOP 5 LOANNO, CNAME FROM BORROW WHERE BNAME!='ANDHERI'

--20. Retrieve all unique cities using DISTINCT. (Use Customers Table)
	SELECT DISTINCT CITY FROM CUSTOMERS 
--21. Retrieve all unique branches using DISTINCT. (Use Branch Table)	SELECT DISTINCT BNAME FROM BRANCH 

--22. Retrieve all the records of customer table as per their city name in ascending order.
 SELECT * FROM CUSTOMERS ORDER BY CITY 

--23. Retrieve all the records of deposit table as per their amount column in descending order.
	SELECT * FROM DEPOSIT ORDER BY AMOUNT DESC 

--24. Update deposit amount of all customers from 3000 to 5000.
	UPDATE DEPOSIT SET AMOUNT = 5000 WHERE AMOUNT = 3000

--25. Change branch name of ANIL from VRCE to C.G. ROAD. (Use Borrow Table) 
    UPDATE BORROW SET BNAME='C.G.ROAD' WHERE CNAME = 'ANIL'
	
--26. Update Account No of SANDIP to 111 & Amount to 5000. 
 UPDATE DEPOSIT SET ACTNO=111 , amount=5000 WHERE CNAME = 'SANDIP'

--27. Give 10% Increment in Loan Amount.
	UPDATE BORROW SET AMOUNT = AMOUNT * 1.10;

	explain it in simple words:
		What does "10% increment" mean?
		 It means you are adding 10% more money to each loan.

		 example:
			Suppose you have a loan amount of ₹1000.
			10% of ₹1000 = ₹100
			New amount = ₹1000 + ₹100 = ₹1100
			Now instead of doing two steps (calculate 10%, then add), we can do it in one step using multiplication:
			₹1000 × 1.10 = ₹1100 
		Or simply:
			New Amount = Old Amount × 1.10

	   SIMPLE EXAMPLE  :- Old Amount × 1.10 = New Amount (after 10% increase)

--28. Update deposit amount of all depositors to 5000 whose account no between 103 & 107.
	UPDATE DEPOSIT SET AMOUNT = 5000 WHERE ACTNO BETWEEN 103 AND 107

--29. Update amount of loan no 321 to NULL.
	UPDATE BORROW SET AMOUNT = NULL  WHERE LOANNO=321

--30. Display the name of borrowers whose amount is NULL.
	SELECT * FROM BORROW WHERE AMOUNT IS  NULL

------------------------------------------- Part B -----------------------------------------
CREATE TABLE STUDENT (
    RollNo INT,
    Name VARCHAR(50),
    Birthdate DATE,
    SPI DECIMAL(4,2),
    City VARCHAR(50),
    Backlog INT,
    Branch VARCHAR(10)
);

INSERT INTO STUDENT VALUES
(101, 'Keyur', '1992-01-05', 8.5, 'Rajkot', 2, 'CE'),
(102, 'Hardik', '1994-02-15', 9.0, 'Ahmedabad', 0, 'CE'),
(103, 'Kajal', '1996-03-14', 10.0, 'Baroda', 0, 'IT'),
(104, 'Bhoomi', '1995-06-23', 8.9, 'Ahmedabad', 1, 'ICT'),
(105, 'Harmit', '1994-02-15', 9.8, 'Rajkot', 1, 'IT'),
(106, 'Jay', '1994-02-15', 7.9, 'Rajkot', 2, 'CE');

--1. Give RollNo and Name of students, whose RollNo is greater than 103 and backlog is greater than 0 and branch is either CE or IT.
	SELECT RollNo ,Name  FROM STUDENT WHERE RollNo > 103 AND Backlog > 0 AND BRANCH IN ('CE','IT')

-- 2. Give name of students whose SPI is between 8 and 9 and branch is either CE or IT. (OR & IN)
	SELECT NAME FROM STUDENT WHERE SPI BETWEEN 8 AND 9 AND (BRANCH IN ('CE' , 'IT'))

	SELECT Name
	FROM STUDENT
	WHERE SPI BETWEEN 8 AND 9 AND (Branch = 'CE' OR Branch = 'IT');

-- 3. Find all students who do not belongs to ‘CE’ branch.
	SELECT * FROM STUDENT WHERE BRANCH != 'CE'

--4. Display RollNo and Name of first three students.
	SELECT TOP 3 RollNo , Name FROM STUDENT

--5. Display all the details of first three students whose SPI is greater than 8.5.	
	SELECT TOP 3 * FROM STUDENT ORDER BY SPI DESC

--6. Retrieve all unique cities using DISTINCT
	SELECT DISTINCT City FROM STUDENT;

--7. Retrieve all unique branches using DISTINCT
	SELECT DISTINCT BRANCH FROM STUDENT;

--8. Retrieve all the records of student table as per their Backlog in descending order and then SPI in ascending order.
	SELECT * FROM STUDENT ORDER BY Backlog DESC, SPI ASC;

--9. Update the branch and city of Jay to MCA and Jamangar respectively.
	UPDATE STUDENT SET Branch ='MCA' , City ='Jamangar' WHERE Name='JAY'

--10. Update the backlog of Keyur and Bhoomi to NULL.
	UPDATE STUDENT SET Backlog = NULL WHERE Name IN ('Keyur', 'Bhoomi')

--11. Display the name of students whose backlog is NULL and backlog is greater than 1 and branch is either CE or IT.
	SELECT Name FROM STUDENT WHERE Backlog IS NULL  AND  BRANCH IN ('CE','IT') 
	
	SELECT Name
	FROM STUDENT
	WHERE (Backlog IS NULL OR Backlog > 1)
    AND Branch IN ('CE', 'IT');




