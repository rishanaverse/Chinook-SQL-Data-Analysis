# 🎵 Chinook SQL Data Analysis

## 📌 Project Overview

This project uses **SQL** to analyze the Chinook music store database and answer important business questions related to **Sales, Marketing, and HR**.

The analysis focuses on customer spending, country revenue, sales trends, employee performance, popular tracks and artists, genres, customer activity, and employee reporting structure.

---

## 🎯 Project Objectives

The main objectives of this project are to:

* Identify countries generating the highest revenue
* Find the top-spending customers
* Analyze monthly sales trends
* Identify employees with the highest sales
* Find the best-selling tracks and artists
* Analyze genre performance across countries
* Identify customers who have not purchased recently
* Understand the employee reporting hierarchy
* Explore an additional business question using the dataset

---

## 🗂️ Dataset

The project uses the **Chinook Database**, a sample digital music store database.

### Main Tables

* `Artist`
* `Album`
* `Track`
* `Genre`
* `MediaType`
* `Playlist`
* `PlaylistTrack`
* `Employee`
* `Customer`
* `Invoice`
* `InvoiceLine`

The tables are connected through relationships such as:

```text
Artist
   ↓
Album
   ↓
Track
   ↓
InvoiceLine
   ↓
Invoice
   ↓
Customer
   ↓
Employee
```

---

## 🧹 Data Cleaning

The dataset was already clean, so no major data-cleaning transformations were required.

I performed basic data-quality checks for:

* Missing values
* Duplicate IDs
* Invalid numeric values
* Invalid dates
* Broken relationships between tables

After checking the data, it was ready for SQL analysis.

---

## 🛠️ Tools & Technologies

* **SQL**
* **MySQL**
* **GitHub**

### SQL Concepts Used

* `SELECT`
* `WHERE`
* `GROUP BY`
* `ORDER BY`
* `SUM()`
* `AVG()`
* `COUNT()`
* `MAX()`
* `JOIN`
* `LEFT JOIN`
* Self Join
* `CONCAT()`
* `DATE_FORMAT()`
* `DATEDIFF()`

---

# 📊 Business Questions & Analysis

## 💰 Sales Analysis

### 1. Which countries generate the most revenue?

Revenue was grouped by country to identify the strongest markets.

**Finding:** The **USA generates the highest revenue**, followed by Canada.

### 2. Who are the top-spending customers?

Customer purchases were aggregated to identify the customers contributing the most revenue.

**Finding:** **Helena Holý** is the highest-spending customer.

### 3. What is the monthly sales trend?

Invoice sales were grouped by year and month to understand sales patterns over time.

**Finding:** Monthly sales are generally stable, with some months showing higher revenue.

### 4. Which employees have the highest sales?

Employee, customer, and invoice tables were joined to measure sales generated through each sales representative.

**Finding:** **Jane Peacock** has the highest sales among the employees.

---

# 📢 Marketing Analysis

### 5. What are the best-selling tracks and artists?

Track sales were analyzed using invoice-line quantities and revenue.

**Finding:** **Iron Maiden** is one of the strongest-performing artists by revenue.

### 6. Which genres perform best?

Genre, track, invoice-line, invoice, and customer data were joined to compare genre performance across countries.

**Finding:** **Rock is the strongest-performing genre overall.**

### 7. Which customers haven't purchased recently?

The latest invoice date for each customer was compared with the current date.

**Finding:** Customers with no recent purchases can be identified for potential re-engagement campaigns.

---

# 👥 HR Analysis

### 8. Who reports to whom?

A self-join was performed on the Employee table using the `ReportsTo` field.

This helped map the organization's reporting structure.

**Finding:** Andrew Adams is the General Manager, with different managers and support staff reporting through the organizational hierarchy.

---

# 🔎 Additional Business Question

### Which countries have the highest average invoice value?

I analyzed the average invoice value for each country.

This provides a different perspective from total revenue by showing where customers tend to make larger purchases per transaction.

---

# 💡 Key Findings

* 🇺🇸 **USA is the highest-revenue country.**
* 👤 **Helena Holý is the highest-spending customer.**
* 📈 **Monthly sales remain relatively stable with occasional peaks.**
* 🏆 **Jane Peacock has the highest employee sales.**
* 🎸 **Rock is the strongest genre overall.**
* 🎵 **Iron Maiden is a major contributor to artist revenue.**

---

# 📁 Project Structure

```text
chinook-sql-analysis/
│
├── chinook_analysis.sql
│
└── README.md
```

### `chinook_analysis.sql`

Contains all SQL queries used for the Sales, Marketing, and HR analysis.

### `README.md`

Contains the project overview, objectives, methodology, and key findings.

---

# 🚀 How to Run the Project

### Step 1: Install MySQL

Install MySQL and open **MySQL Workbench**.

### Step 2: Load the Chinook Database

Import the Chinook database into MySQL.

### Step 3: Open the SQL File

Open:

```text
chinook_analysis.sql
```

### Step 4: Select the Database

```sql
USE Chinook;
```

### Step 5: Run the Queries

Execute each query individually to view the analysis results.

---

# 📊 Optional Visualization

The SQL query results can also be connected to **Tableau** or **Tableau Public** to create an interactive dashboard.

Possible visuals include:

* Revenue by Country
* Top Customers
* Monthly Sales Trend
* Top Artists
* Best-Selling Tracks
* Genre Performance
* Employee Sales

---

# 📚 What I Learned

Through this project, I practiced:

* Writing SQL queries
* Aggregating business data
* Joining multiple tables
* Working with dates
* Analyzing customer behavior
* Measuring sales performance
* Using self-joins
* Turning SQL results into business insights

---

# 👩‍💻 About Me

I am a **beginner Data Analyst** building my skills in SQL, Excel, Power BI, Python, Tableau, and data visualization.

This project is part of my journey to develop practical **data analysis and business intelligence** skills.

---

## ⭐ Project Highlights

**Domain:** Music Store / E-commerce
**Focus:** Sales, Marketing & HR Analytics
**Database:** Chinook
**Tool:** MySQL
**Level:** Beginner SQL Data Analysis

---

## 📌 Future Improvements

* Create an interactive Tableau dashboard
* Add more customer segmentation analysis
* Analyze sales by country and genre
* Identify customer purchase patterns
* Add visualizations for monthly revenue
* Explore more advanced SQL techniques
