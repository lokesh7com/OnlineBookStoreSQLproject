# 📚 Bookstore SQL Project

## 📌 Project Overview

This project is a **Bookstore Database Management and Analysis Project** built using **PostgreSQL**. The project focuses on managing books, customers, and orders while using SQL queries to extract meaningful business insights.

The database consists of three main tables:

- 📖 **Books** – Stores information about books, authors, genres, prices, publication years, and stock.
- 👤 **Customers** – Stores customer details such as name, email, phone, city, and country.
- 🛒 **Orders** – Stores customer orders, ordered books, order dates, quantities, and total amounts.

The project includes both **basic and advanced SQL queries** covering filtering, aggregation, sorting, joins, grouping, subqueries, and business analysis.

---

## 🎯 Project Objectives

The main objectives of this project are:

- Create and manage a relational bookstore database.
- Analyze book inventory and pricing.
- Understand customer purchasing behavior.
- Analyze order and sales data.
- Calculate total revenue generated from orders.
- Identify best-selling books and authors.
- Analyze book stock levels.
- Find high-value customers.
- Practice SQL concepts using real-world business scenarios.

---

## 🗂️ Database Schema

The project contains the following tables:

### 📖 Books Table

| Column | Description |
|---|---|
| Book_ID | Unique ID of each book |
| Title | Name of the book |
| Author | Author of the book |
| Genre | Genre/category of the book |
| Published_Year | Year the book was published |
| Price | Price of the book |
| Stock | Available stock |

### 👤 Customers Table

| Column | Description |
|---|---|
| Customer_ID | Unique ID of each customer |
| Name | Customer name |
| Email | Customer email |
| Phone | Customer phone number |
| City | Customer city |
| Country | Customer country |

### 🛒 Orders Table

| Column | Description |
|---|---|
| Order_ID | Unique ID of each order |
| Customer_ID | Reference to the customer |
| Book_ID | Reference to the book |
| Order_Date | Date of order |
| Quantity | Number of books ordered |
| Total_Amount | Total order amount |

---

## 🔗 Table Relationships

```text
Customers
    │
    │ Customer_ID
    ▼
  Orders
    │
    │ Book_ID
    ▼
  Books


🛠️ Technologies Used
PostgreSQL
SQL
CSV Data Import
Relational Database Management

📊 SQL Analysis Performed
🔹 Basic SQL Queries

The project includes queries to:

Retrieve all books from the Fiction genre.
Find books published after 1950.
List all customers from Canada.
Retrieve orders placed in November 2023.
Calculate the total stock of all books.
Find the most expensive book.
Find orders where the quantity is greater than 1.
Retrieve orders where the total amount exceeds $20.
List all unique genres available in the bookstore.
Find books with the lowest stock.
Calculate the total revenue generated from all orders.
🔹 Advanced SQL Queries

The project also includes advanced analysis such as:

Calculate the total number of books sold for each genre.
Find the average price of books in the Fantasy genre.
Identify customers who have placed at least 2 orders.
Find the most frequently ordered book.
Retrieve the top 3 most expensive Fantasy books.
Find the 7th most expensive book.
Calculate the total quantity of books sold by each author.
Find cities where customers have spent more than $30.
Identify the customer who spent the most money on orders.
Calculate the remaining stock after fulfilling all orders.

🧠 SQL Concepts Covered

This project demonstrates practical knowledge of:

CREATE TABLE
DROP TABLE
PRIMARY KEY
FOREIGN KEY
REFERENCES
COPY
SELECT
WHERE
DISTINCT
BETWEEN
ORDER BY
LIMIT
OFFSET
SUM()
AVG()
COUNT()
GROUP BY
HAVING
JOIN
LEFT JOIN
COALESCE()
Aggregate Functions
Filtering and Sorting
Relational Database Concepts

md
🚀 How to Run the Project
Step 1: Create the Database

Create a new PostgreSQL database using pgAdmin or the PostgreSQL command line.

Step 2: Run the SQL File

Open PROJECT.sql in PostgreSQL/pgAdmin and execute the script.

Step 3: Import the Data

Import the following CSV files into their respective tables:
Books.csv
Customers.csv
Orders.csv

🎓 Learning Outcomes

Through this project, I strengthened my understanding of:

Database design and table relationships.
Writing SQL queries for data analysis.
Using aggregate functions for business calculations.
Performing INNER JOIN and LEFT JOIN operations.
Filtering grouped data using HAVING.
Analyzing sales and customer behavior.
Solving real-world business problems using SQL.

👨‍💻 Author

Lokesh

This project was created as part of my SQL learning and data analytics portfolio to demonstrate practical knowledge of PostgreSQL and SQL Data Analysis.

⭐ If you find this project useful, feel free to give it a Star!
