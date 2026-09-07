use chinook;
select * from album;
select * from artist;
select * from customer;
select * from employee;
select * from genre;
select * from invoice;
select * from invoiceline;
select * from mediatype;
select * from playlist;
select * from playlisttrack;
select * from track;

SHOW TABLES;
SELECT 'Artist' AS TableName, COUNT(*) AS RowCount FROM Artist
UNION ALL
SELECT 'Album', COUNT(*) FROM Album
UNION ALL
SELECT 'Track', COUNT(*) FROM Track
UNION ALL
SELECT 'Genre', COUNT(*) FROM Genre
UNION ALL
SELECT 'MediaType', COUNT(*) FROM MediaType
UNION ALL
SELECT 'Playlist', COUNT(*) FROM Playlist
UNION ALL
SELECT 'PlaylistTrack', COUNT(*) FROM PlaylistTrack
UNION ALL
SELECT 'Employee', COUNT(*) FROM Employee
UNION ALL
SELECT 'Customer', COUNT(*) FROM Customer
UNION ALL
SELECT 'Invoice', COUNT(*) FROM Invoice
UNION ALL
SELECT 'InvoiceLine', COUNT(*) FROM InvoiceLine;

-- Check NULL values
-- CUSTOMER 
SELECT
    SUM(CustomerId IS NULL) AS Null_CustomerId,
    SUM(FirstName IS NULL) AS Null_FirstName,
    SUM(LastName IS NULL) AS Null_LastName,
    SUM(Country IS NULL) AS Null_Country,
    SUM(SupportRepId IS NULL) AS Null_SupportRepId
FROM Customer;

-- INVOICE 

SELECT
    SUM(InvoiceId IS NULL) AS Null_InvoiceId,
    SUM(CustomerId IS NULL) AS Null_CustomerId,
    SUM(InvoiceDate IS NULL) AS Null_InvoiceDate,
    SUM(BillingCountry IS NULL) AS Null_BillingCountry,
    SUM(Total IS NULL) AS Null_Total
FROM Invoice;

-- Check duplicate records  
-- in all primary keys 

SELECT CustomerId, COUNT(*) AS Count
FROM Customer
GROUP BY CustomerId
HAVING COUNT(*) > 1;

SELECT InvoiceId, COUNT(*) AS Count
FROM Invoice
GROUP BY InvoiceId
HAVING COUNT(*) > 1;

SELECT EmployeeId, COUNT(*) AS Count
FROM Employee
GROUP BY EmployeeId
HAVING COUNT(*) > 1;

-- join tables
SELECT i.InvoiceId, i.CustomerId
FROM Invoice i
LEFT JOIN Customer c
    ON i.CustomerId = c.CustomerId
WHERE c.CustomerId IS NULL;

SELECT il.InvoiceLineId, il.InvoiceId
FROM InvoiceLine il
LEFT JOIN Invoice i
    ON il.InvoiceId = i.InvoiceId
WHERE i.InvoiceId IS NULL;

SELECT il.InvoiceLineId, il.TrackId
FROM InvoiceLine il
LEFT JOIN Track t
    ON il.TrackId = t.TrackId
WHERE t.TrackId IS NULL;

-- . SALES ANSWERS 
-- 1  MOST REVENUE COUNTRY 

SELECT BillingCountry AS Country,
       ROUND(SUM(Total), 2) AS Revenue
FROM Invoice
GROUP BY BillingCountry
ORDER BY Revenue DESC;

-- 2  TOP SPENT CUSTOMER 
select * from customer;
select * from invoice;
SELECT c.CustomerId,
       CONCAT(c.FirstName, ' ', c.LastName) AS Customer,
       ROUND(SUM(i.Total), 2) AS TotalSpent
FROM Customer c
JOIN Invoice i
    ON c.CustomerId = i.CustomerId
GROUP BY c.CustomerId, c.FirstName, c.LastName
ORDER BY TotalSpent DESC;

-- 3   SALES TREND 
select * from invoice;
SELECT DATE_FORMAT(InvoiceDate, '%Y-%m') AS Month,
       ROUND(SUM(Total), 2) AS Sales
FROM Invoice
GROUP BY DATE_FORMAT(InvoiceDate, '%Y-%m')
ORDER BY Month;

-- 4    HIGHEST SALES EMPLOYEE 
 SELECT e.EmployeeId,
       CONCAT(e.FirstName, ' ', e.LastName) AS Employee,
       ROUND(SUM(i.Total), 2) AS Sales
FROM Employee e
JOIN Customer c
    ON e.EmployeeId = c.SupportRepId
JOIN Invoice i
    ON c.CustomerId = i.CustomerId
GROUP BY e.EmployeeId, e.FirstName, e.LastName
ORDER BY Sales DESC;

-- MARKETING ANSWERS
-- 1  best-selling tracks and artists

SELECT t.Name AS Track,
       a.Name AS Artist,
       SUM(il.Quantity) AS UnitsSold,
       ROUND(SUM(il.UnitPrice * il.Quantity), 2) AS Revenue
FROM InvoiceLine il
JOIN Track t
    ON il.TrackId = t.TrackId
JOIN Album al
    ON t.AlbumId = al.AlbumId
JOIN Artist a
    ON al.ArtistId = a.ArtistId
GROUP BY t.TrackId, t.Name, a.ArtistId, a.Name
ORDER BY UnitsSold DESC, Revenue DESC;

 
-- 2 Best-performing genres by country
SELECT i.BillingCountry AS Country,
       g.Name AS Genre,
       SUM(il.Quantity) AS UnitsSold,
       ROUND(SUM(il.UnitPrice * il.Quantity), 2) AS Revenue
FROM Genre g
JOIN Track t
    ON g.GenreId = t.GenreId
JOIN InvoiceLine il
    ON t.TrackId = il.TrackId
JOIN Invoice i
    ON il.InvoiceId = i.InvoiceId
JOIN Customer c
    ON i.CustomerId = c.CustomerId
GROUP BY i.BillingCountry, g.GenreId, g.Name
ORDER BY Country, Revenue DESC;

-- 3  purchased recently ( last 90 days )
SELECT c.CustomerId,
       CONCAT(c.FirstName, ' ', c.LastName) AS Customer,
       MAX(i.InvoiceDate) AS LastPurchase
FROM Customer c
LEFT JOIN Invoice i
    ON c.CustomerId = i.CustomerId
GROUP BY c.CustomerId, c.FirstName, c.LastName
HAVING MAX(i.InvoiceDate) IS NULL
    OR DATEDIFF(CURDATE(), DATE(MAX(i.InvoiceDate))) > 90
ORDER BY LastPurchase;

-- HR 
-- 1 , Who reports to whom?

SELECT CONCAT(e.FirstName, ' ', e.LastName) AS Employee,
       e.Title AS EmployeeTitle,
       CONCAT(m.FirstName, ' ', m.LastName) AS Manager,
       m.Title AS ManagerTitle
FROM Employee e
LEFT JOIN Employee m
    ON e.ReportsTo = m.EmployeeId
ORDER BY e.EmployeeId;

--  MY OWN QS 
-- Which countries have the highest average invoice value?

SELECT BillingCountry AS Country,
       COUNT(*) AS NumberOfInvoices,
       ROUND(AVG(Total), 2) AS AverageInvoiceValue,
       ROUND(SUM(Total), 2) AS Revenue
FROM Invoice
GROUP BY BillingCountry
ORDER BY AverageInvoiceValue DESC;



 
 
 



