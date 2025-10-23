CREATE TABLE PRODUCTS(
	PRODUCT_ID INT  PRIMARY KEY , 
	PRODUCT_NAME VARCHAR(100) NOT NULL,
	PRICE DECIMAL(10,2) NOT NULL 
	)
SELECT * FROM PRODUCTS


INSERT INTO PRODUCTS VALUES(1, 'Smatphone', 350000),
(2, 'Laptop', 65000),
(3, 'Headphones', 5500),
(4, 'Television', 85000),
(5, 'Gaming Console', 32000);

------------     Create a cursor Product_Cursor to fetch all the rows from a products table.    ---------------------

DECLARE 
	@PRODUCT_ID INT , 
	@PRODUCT_NAME VARCHAR(100),
	@PRICE DECIMAL(10,2) 

DECLARE FECH_ALL_REC CURSOR
	FOR SELECT * FROM PRODUCTS

OPEN FECH_ALL_REC  -- OPEN CURSOR 

FETCH NEXT FROM FECH_ALL_REC INTO 
	@PRODUCT_ID ,
	@PRODUCT_NAME ,
	@PRICE 

WHILE @@FETCH_STATUS = 0 
BEGIN 
	PRINT CAST (@PRODUCT_ID AS VARCHAR(100))+''+@PRODUCT_NAME+''+CAST(@PRICE AS VARCHAR(100))
FETCH NEXT FROM FECH_ALL_REC INTO 
	@PRODUCT_ID,
	@PRODUCT_NAME,	
	@PRICE
END

CLOSE FECH_ALL_REC -- CLOSE CURSOR 
DEALLOCATE FECH_ALL_REC

------------     Create a cursor Product_Cursor_Fetch to fetch the records in form of ProductID_ProductName.(Example: 1_Smartphone)  ---------------------

DECLARE 
	@P_ID INT ,
	@P_NAME VARCHAR(100)

DECLARE  PID_PNAME CURSOR
	FOR SELECT PRODUCT_ID , PRODUCT_NAME FROM PRODUCTS 
	OPEN PID_PNAME
		FETCH NEXT FROM PID_PNAME INTO 
			@P_ID,
			@P_NAME

			WHILE @@FETCH_STATUS = 0 
				BEGIN
					PRINT CAST(@P_ID AS VARCHAR(100)) +''+@P_NAME 
					FETCH NEXT FROM PID_PNAME INTO 
					@P_ID,
					@P_NAME
				END
	CLOSE PIN_PNAME
	DEALLOCATE PIN_PNAME 

	-------------Create a cursor Product_CursorUpdate that retrieves all the data from the products table and increases the price by 10%.


DECLARE 
	@PRODUCT_ID INT , 
	@PRODUCT_NAME VARCHAR(100),
	@PRICE DECIMAL(10,2) 

DECLARE FECH_ALL_REC_INCREE CURSOR
	FOR SELECT * FROM PRODUCTS

OPEN FECH_ALL_REC_INCREE  -- OPEN CURSOR 

FETCH NEXT FROM FECH_ALL_REC_INCREE INTO 
	@PRODUCT_ID ,
	@PRODUCT_NAME ,
	@PRICE 

WHILE @@FETCH_STATUS = 0 
BEGIN 
	UPDATE PRODUCTS SET PRICE = @PRICE*1.10
	WHERE PRODUCT_ID=@PRODUCT_ID
	PRINT CAST(@PRODUCT_ID AS VARCHAR(100)) +''+@PRODUCT_NAME +''+CAST(@PRICE AS VARCHAR(100))
FETCH NEXT FROM FECH_ALL_REC_INCREE INTO 
	@PRODUCT_ID,
	@PRODUCT_NAME,	
	@PRICE
END

CLOSE FECH_ALL_REC_INCREE -- CLOSE CURSOR 
DEALLOCATE FECH_ALL_REC_INCREE

-----------  Create a cursor to insert details of Products into the NewProducts table if the product is “Laptop” (Note:Create NewProducts table first with same fields as Products table)