CREATE TABLE Product
(
	PID INT ,
	Pname VARCHAR(30),
	City VARCHAR(30),
	Quantity INT,
	salesunit INT
)

INSERT INTO Product VALUES
(101, 'Amul Butter', 'Anand', 500, 1200),
(102, 'Parle-G', 'Mumbai', 1500, 4500),
(103, 'Tata Tea', 'Kolkata', 800, 2100),
(104, 'Haldiram Bhujia', 'Nagpur', 600, 1800),
(105, 'Dabur Chyawanprash', 'Ghaziabad', 400, 950),
(106, 'Bata Shoes', 'Gurugram', 350, 720),
(107, 'Godrej Storewel', 'Mumbai', 120, 280),
(108, 'Titan Watch', 'Bengaluru', 250, 640),
(109, 'Saffola Gold', 'Mumbai', 700, 1600),
(110, 'Wagh Bakri Tea', 'Ahmedabad', 900, 2300)

--1. Find all products that have a Quantity greater than the average quantity of all products.
SELECT * FROM Product
WHERE Quantity > 
(SELECT AVG(Quantity) FROM Product)

--2. Display the ProductName of products sold in the same city as 'Titan Watch'.
SELECT * FROM Product
WHERE City = 
(SELECT City FROM Product 
WHERE Pname = 'Titan Watch')

--3. Find the details of the products with the maximum Quantity.
SELECT * FROM Product
WHERE Quantity = 
(SELECT MAX(Quantity) FROM Product)

--4. List products whose salesUnit is higher than the salesUnit of ProductID 105.
SELECT * FROM Product
WHERE salesunit > 
(SELECT salesunit FROM Product
WHERE PID = 105)

--5. Find products that have a lower Quantity than the minimum Quantity found in 'Ahmedabad'.
SELECT * FROM  Product
WHERE Quantity >
(SELECT MIN(Quantity) FROM Product
WHERE City = 'Ahmedabad')

--6. Display products whose salesUnit is greater than the average salesUnit of products in 'Mumbai'.
SELECT * FROM Product
WHERE salesunit > 
(SELECT AVG(salesunit) FROM Product
WHERE City = 'Mumbai')

--7. Find the product name with the lowest salesUnit.
SELECT * FROM Product
WHERE salesunit = 
(SELECT MIN(salesunit) FROM Product)                     

--8. List all products sold in cities that have more than 50 total Quantity across all their products.
SELECT * FROM Product 
WHERE City IN 
(SELECT City FROM Product 
GROUP BY City 
HAVING SUM(Quantity) > 50)

--9. Show products whose Quantity is exactly equal to the salesUnit of 'Bata Shoes'.
SELECT * FROM Product
WHERE Quantity = 
(SELECT salesunit FROM Product
WHERE Pname = 'Bata Shoes')

--10. Find the city which has the product with the highest salesUnit. (IN, ALL, ANY & Correlated)
SELECT * FROM Product
WHERE salesunit = 
(SELECT MAX(salesunit) FROM Product)

--11. Find all products sold in cities where at least one product has a Quantity of zero.
SELECT * FROM Product
WHERE City IN
(SELECT City FROM Product
WHERE Quantity = 0)

--12. List products whose salesUnit is greater than the salesUnit of all products in 'Kolkata'.
SELECT * FROM Product
WHERE salesunit > ALL
(SELECT salesunit FROM Product
WHERE City = 'Kolkata')

--13. Find products that belong to cities where the average salesUnit is greater than 10.
SELECT * FROM Product
WHERE City IN
(SELECT City FROM Product
GROUP BY City
HAVING AVG(salesunit) > 10)

--14.Display products that have a Quantity greater than any product's Quantity in 'Pune'.
SELECT * FROM Product
WHERE Quantity > ANY
(SELECT Quantity FROM Product
WHERE City = 'pune')

--15. Find all products whose ProductName is the same as any product sold in 'Ahmedabad'.
SELECT * FROM Product
WHERE Pname = ANY
(SELECT Pname FROM Product
WHERE City = 'Ahmedabad')

--16. Select products where the Quantity is greater than the average Quantity of their own city.
SELECT * FROM Product p1
WHERE Quantity > 
(SELECT AVG(Quantity) FROM Product p2
WHERE p1.City = p2.City)

--17. Find cities where the total salesUnit is higher than the total salesUnit of 'Vadodara'.
SELECT City, SUM(salesunit) AS total_salesunit FROM Product
GROUP BY City
HAVING SUM(salesunit) > 
(SELECT SUM(salesunit) FROM Product
WHERE City = 'Vadodara')

--18. List products that are sold in the city that has the maximum variety (count) of products.
SELECT * FROM Product
WHERE City =
(SELECT TOP 1 City FROM Product
GROUP BY City
ORDER BY COUNT(*) DESC)

--19. Find the second highest Quantity from the Product table using a subquery.
SELECT * FROM Product
WHERE Quantity = 
(SELECT MAX(Quantity) FROM Product)


--20.Display the ProductName and a calculated column showing the difference between its Quantity and the global average Quantity.
SELECT Pname, Quantity - (SELECT AVG(Quantity) FROM Product) AS DIFFERENCE FROM Product