----books table------
DROP TABLE IF EXISTS Books;
CREATE TABLE Books(
Book_ID SERIAL PRIMARY KEY,
Title VARCHAR(80),
Author VARCHAR(80),
Genre VARCHAR(80),
Published_Year INT,
Price NUMERIC(10,2),
Stock INT
);

---- customers table-------
DROP TABLE IF EXISTS Customers;
CREATE TABLE Customers(
Customer_ID SERIAL PRIMARY KEY,
Name VARCHAR(80),
Email VARCHAR(100),
Phone VARCHAR(50),
City VARCHAR(110),
Country VARCHAR(100)
);

---- Orders table-----------
DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders(
Order_ID SERIAL PRIMARY KEY,
Customer_ID INT REFERENCES Customers(Customer_ID),
Book_ID INT REFERENCES Books(Book_ID),
Order_Date DATE,
Quantity INT,
Total_Amount NUMERIC(10,2)
);

----import data into Books table------

COPY Books (Book_ID,Title,Author,Genre,Published_Year,Price,Stock)
FROM
'D:\DataAnalysis\Sql\SqlClass\DAY30 PROJECT\Books.csv'
csv header
delimiter ',';

----import data into customers table------

COPY Customers(Customer_ID,Name,Email,Phone,City,Country)
FROM
'D:\DataAnalysis\Sql\SqlClass\DAY30 PROJECT\Customers.csv'
CSV HEADER
delimiter ',';

----import data into Order table------

COPY Orders(Order_ID,Customer_ID,Book_ID,Order_Date,Quantity,Total_Amount)
FROM
'D:\DataAnalysis\Sql\SqlClass\DAY30 PROJECT\Orders.CSV'
CSV HEADER
DELIMITER ','

SELECT * FROM Books;
SELECT * FROM Customers;
SELECT * FROM Orders;

---Q1--Retrieve all books in the 'Fiction' genere.
SELECT * FROM Books
WHERE genre='Fiction'

--Q2--Find Books published after the year 1950.
SELECT * FROM Books
WHERE published_year>1950;

--Q3--List all customers from canada.
SELECT * FROM Customers
WHERE country='Canada'

--Q4----Shows orders placed in November 2023.
SELECT * FROM Orders
WHERE order_date BETWEEN '2023-11-01' AND '2023-11-30'
ORDER BY order_date ASC

--Q5--Retrive the total sock of books available.
SELECT SUM(stock) AS Total_stocks FROM Books ;

--Q6--Find the details of most expensive book.
SELECT * FROM Books 
ORDER BY price DESC
LIMIT 1 OFFSET 0;

--Q7--Show all customers who ordered more than 1 quantity of a book 
SELECT * FROM orders 
WHERE quantity>1 
ORDER BY quantity ASC;

--Q8--Retrive all orders where the total amount exceeds $20.
SELECT * FROM orders
WHERE total_amount>20;

--Q9-- List all genres available in the Books table
SELECT DISTINCT genre FROM Books

--Q10--Find the books with lowest stocks.
SELECT * FROM Books 
ORDER BY stock ASC
LIMIT 1 ;

--Q11-- Calculate the total revenue generated from all orders 
SELECT SUM(total_amount) AS Revenue FROM orders;


-------ADVANCE----QUESTIONS-------

--Q1--Retirve the total number of books sold for each genere.

SELECT  B.genre, SUM(o.quantity) 
FROM Orders o
JOIN Books B
ON o.Book_ID = B.Book_ID
GROUP BY B.genre;

--Q2--Find the average price of book in Fantasy Genre.
SELECT  AVG(price) AS Average_price
FROM books
where genre = 'Fantasy' ;

--Q3-- List customers who have placed atleast 2 Order.
SELECT c.name, O.Customer_ID, COUNT(o.Order_ID) AS order_count
FROM Customers c
JOIN Orders o
ON  o.Customer_ID = c.Customer_ID
GROUP BY o.Customer_ID , c.name
HAVING COUNT(o.Order_ID)>=2 

--Q4--Find the most frequently ordered book.
SELECT B.title , o.Book_ID , COUNT(o.order_id) AS ORDER_COUNT
FROM orders o
JOIN Books B ON o.Book_ID = B.Book_ID
GROUP BY o.Book_ID , B.title
ORDER BY ORDER_COUNT DESC LIMIT 1;

--Q5--Show the top 3 most expensive books of 'Fantasy' Genre
SELECT * FROM Books 
WHERE Genre='Fantasy' 
ORDER BY price DESC
LIMIT 3  ;

--Q6-- Find the 7th most expensive book
SELECT * FROM Books
ORDER BY price DESC
LIMIT 1 OFFSET 6

--Q7-- Retrive total quantity of books sold by each author.
SELECT b.author, SUM(o.quantity) AS book_sold_each_other  FROM Books b
join orders o ON b.Book_id=o.Book_id
GROUP BY b.author 
ORDER BY book_sold_each_other DESC ;

--Q8--List the cities where customers who spent over $30 are located.
SELECT DISTINCT(c.city), o.total_amount 
FROM customers c
JOIN orders o
ON o.customer_id = c.customer_id
GROUP BY c.city, o.total_amount
HAVING o.total_amount>30;

--Q8--2ND METHOD BY WHERE CLAUSE
SELECT DISTINCT(c.city), o.total_amount
FROM customers c
JOIN orders o
ON o.customer_id = c.customer_id
WHERE o.total_amount>30;

--Q9--Find the customer who spent the most on orders
SELECT c.name, c.customer_id, SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o
ON o.customer_id=c.customer_id
GROUP BY c.name, c.customer_id
ORDER BY total_spent DESC LIMIT 1;

--Q10--Calculate the stock remaining after fulfilling all orders.
SELECT b.book_id,b.title,b.stock, COALESCE(SUM(o.quantity),0) AS order_quantity,
b.stock-COALESCE(SUM(o.quantity),0) AS Remaining_stock from Books b
LEFT JOIN Orders o
ON b.book_id=o.book_id
GROUP BY b.book_id ORDER BY b.book_id;