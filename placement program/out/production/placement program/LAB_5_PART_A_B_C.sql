

CREATE TABLE SALES_DATA(
    Region VARCHAR(30),
    Product VARCHAR(20),
    Sales_Amount INT,
    Year INT
);

INSERT INTO SALES_DATA VALUES
('North America', 'Watch', 1500, 2023),
('Europe', 'Mobile', 1200, 2023),
('Asia', 'Watch', 1800, 2023),
('North America', 'TV', 900, 2024),
('Europe', 'Watch', 2000, 2024),
('Asia','Mobile', 1000 ,2024),
('North America', 'Mobile', 1600 ,2023),
('Europe', 'TV', 1500 ,2023),
('Asia', 'TV', 1100 ,2024),
('North America', 'Watch', 1700 ,2024);

SELECT * FROM SALES_DATA;


--1. Display Total Sales Amount by Region.
	SELECT SUM(Sales_Amount) AS AMOUNT_BY_REGIOU
	FROM SALES_DATA
	GROUP BY Region
--2. Display Average Sales Amount by Product
	SELECT PRODUCT,  AVG(Sales_Amount) AS AMOUNT_BY_REGIOU
	FROM SALES_DATA
	GROUP BY Product
--3. Display Maximum Sales Amount by Year
	SELECT YEAR, MAX(Sales_Amount) AS Amount_by_Year
	FROM SALES_DATA
	GROUP BY Year
--4. Display Minimum Sales Amount by Region and Year
	SELECT YEAR, MIN(Sales_Amount) AS Amount_by_Year
	FROM SALES_DATA
	GROUP BY Year , Region
--5. Count of Products Sold by Region
	SELECT Region, COUNT(PRODUCT) AS Products_Sold_by_Region
	FROM SALES_DATA
	GROUP BY Region
--6. Display Sales Amount by Year and Product
	SELECT SUM(Sales_Amount)AS Sales_Amount_by_Year_and_Product
	FROM SALES_DATA
	GROUP BY Year , Product
--7. Display Regions with Total Sales Greater Than 5000
	SELECT  Region , SUM(Sales_Amount) AS Regions_with_Total_Sales
	FROM SALES_DATA
	GROUP BY REGION
	HAVING SUM(Sales_Amount) > 5000
	
--8. Display Products with Average Sales Less Than 10000
	SELECT  Region , SUM(Sales_Amount) AS Regions_with_Total_Sales
	FROM SALES_DATA
	GROUP BY REGION
	HAVING SUM(Sales_Amount) < 10000
--9. Display Years with Maximum Sales Exceeding 500
	SELECT Year , MAX(Sales_Amount) AS Years_with_Maximum_Sales 
	FROM SALES_DATA
	GROUP BY Year
	HAVING MAX(Sales_Amount)> 500
--10. Display Regions with at Least 3 Distinct Products Sold.
	SELECT Distinct  Region , COUNT(Distinct  Product ) AS Distinct_Products_Sold
	FROM SALES_DATA
	GROUP BY Region
	HAVING COUNT(Distinct  Product )  >= 3
--11. Display Years with Minimum Sales Less Than 1000
	SELECT Year , MIN(Sales_Amount) AS Minimum_Sales 
	FROM SALES_DATA
	GROUP BY YEAR 
	HAVING MIN(Sales_Amount) < 1000
--12. Display Total Sales Amount by Region for Year 2023, Sorted by Total Amount
	SELECT  Region ,  SUM(Sales_Amount)AS TOTAL_SALES
	FROM SALES_DATA
	WHERE Year = 2023
	GROUP BY Region
	ORDER BY SUM(Sales_Amount)
--13. Find the Region Where 'Mobile' Had the Lowest Total Sales Across All Years.
	SELECT TOP 1 Region , MIN(Sales_Amount) AS Lowest_Total_Sales 
	FROM SALES_DATA
	WHERE Product = 'MOBILE'
	GROUP BY Region
	
--14. Find the Product with the Highest Sales Across All Regions in 2023.
	SELECT Product , MAX(Sales_Amount)
	FROM SALES_DATA
	WHERE Year = 2023
	GROUP BY PRODUCT , Region
--15. Find Regions Where 'TV' Sales in 2023 Were Greater Than 1000

	SELECT Region  , SUM(Sales_Amount) AS TOTAL_AMOUNT 
	FROM SALES_DATA
	WHERE Product = 'TV'
	GROUP BY Region
	HAVING SUM(Sales_Amount) > 1000
--================================== PART B ==========================


--1. Display Count of Orders by Year and Region, Sorted by Year and Region
	SELECT * FROM SALES_DATA

	SELECT COUNT(Product)AS Orders_by_Year_and_Region
	FROM SALES_DATA
	ORDER
--2. Display Regions with Maximum Sales Amount Exceeding 1000 in Any Year, Sorted by Region

--3. Display Years with Total Sales Amount Less Than 10000, Sorted by Year Descending

--4. Display Top 3 Regions by Total Sales Amount in Year 2024

--5. Find the Year with the Lowest Total Sales Across All Regions