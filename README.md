# Pizza-Sales-Project 
The objective of this project is to derive meaningful insights from the sales data of a pizza selling joint by exploring and analyzing the data and presenting the data with the help of graphs and charts. The various KPIs and requirements of the project are provided by stakeholders.

# Dataset
The dataset stored in pizza_sales_excel_file contains information about the different types of pizzas sold, quantity of pizzas sold per order, cost per unit of pizza, date and time of sales, categories of pizzas and different sizes of pizzas sold. The shecma of the datset is structured as follows
pizza_id	        : Unique ids. for different rows. <br>
order_id	        : Unique ids. for different orders. <br>
pizza_name_id	    : Unique ids. for different pizza names.<br>
quantity	        : Quantity of pizzas of a particular type sold per order.<br>
order_date	      : Date of sales.<br>
order_time	      : Time of sales.<br>
unit_price	      : Cost per unit.<br>
total_price	      : Unit price multiplied by quantity.<br>
pizza_size	      : Different sizes of pizzas sold.<br>
pizza_category    : Different categories of pizza.<br>
pizza_ingredients	: Different ingredients used in the preparation of the pizza.<br>
pizza_name        : Different pizza names.<br>
The dataset offers a large amount of data for exploration and analysis to dig out valuable insights about the sales trend of the pizza joint.

# Project Steps
1. CSV file converted to excel file to load the same in the MySQL server.
2. The pizza_sales_excel file was loaded into the MySQL server.
3. SQL queries run for analyzing the various KPIs and requirements provided by stakeholders.
4. MySQL server linked to PowerBI.
5. Power-BI Dashboard prepared showcasing the various KPIs and trends.

# Data Analysis Using SQL

A. KPI’s
1. Total Revenue: <br>
SELECT SUM (total_price) AS Revenue 
From pizza_sales_csv;

Output:<br>
 ![image](https://github.com/user-attachments/assets/269cf025-10eb-4c3d-a4c3-0eea37e7a26a)


2. Average Order Value <br>
SELECT (sum(total_price)/count(distinct order_id)) As Avg_Ord_Val 
From pizza_sales_csv; 

Output: <br>
 ![image](https://github.com/user-attachments/assets/f6d57f71-49c3-420f-8d38-7f2b59c42418)


3. Total Pizzas Sold <br>
SELECT sum(quantity) As Total_Pizza_Sold 
From pizza_sales_csv; 

Output: <br>
 ![image](https://github.com/user-attachments/assets/68177bbd-0c5a-4c84-8cf6-1ef4ad3e9431)


4. Total Orders <br>
SELECT count(distinct order_id) as Total_Orders 
From pizza_sales_csv; 

Output: <br>
 ![image](https://github.com/user-attachments/assets/5b6f683e-d9d9-4f48-9625-d8c648e07a21)

5. Average Pizzas Per Order <br>
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Avg_Pizzas_per_order
FROM pizza_sales_csv; 

Output: <br>
 ![image](https://github.com/user-attachments/assets/c47342b6-32d4-4f0d-bd15-65cb810d1693)

B. Daily Trend for Total Orders <br>
SELECT dayofweek(order_date) As Day_Number, dayname(order_date) As Order_Day,                                      
count(distinct order_id) As Total_Orders
From pizza_sales_csv
Group by Day_Number, Order_Day; 

Output: <br>
![image](https://github.com/user-attachments/assets/0a188b4a-42d3-4e32-8af4-7d73edb76b50)

C. Monthly Trend for Orders <br>
SELECT monthname(order_date) as Month_Name, COUNT(DISTINCT order_id) As Total_Orders
From pizza_sales_csv
GROUP BY monthname(order_date);

Output: <br>
![image](https://github.com/user-attachments/assets/ee8a349b-1f93-4ead-87b2-d6aacadd8c67)

D. % of Sales by Pizza Category <br>
SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue, 
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales_csv) AS DECIMAL(10,2)) AS PCT                       FROM pizza_sales_csv                                                       
GROUP BY pizza_category; 

Output: <br>
![image](https://github.com/user-attachments/assets/252fe796-d8e5-40c2-809c-6f2e27843238)

E. % of Sales by Pizza Size <br>
SELECT pizza_size, CAST(sum(total_price) As DECIMAL(10,2)) As total_revenue,    
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales_csv) As DECIMAL(10,2)) As PST                       FROM pizza_sales_csv                                                       
GROUP By pizza_size                                                      
ORDER By pizza_size;

Output: <br>
![image](https://github.com/user-attachments/assets/d60a6b42-d95f-411b-a5ea-ca61b39f28ce)

F. Total Pizzas Sold by Pizza Category <br>
SELECT pizza_category, SUM(quantity) As Total_Pizzas_Sold
FROM pizza_sales_csv
GROUP By pizza_category
ORDER BY Total_Pizzas_Sold DESC;
 
Output: <br>
![image](https://github.com/user-attachments/assets/ba46f507-126f-4cb9-b251-f2b32dd42db3)

G. Top 5 Pizzas by Revenue <br>
SELECT pizza_name, CAST(SUM(total_price) As Decimal(10,2)) As Revenue
FROM pizza_sales_csv
GROUP BY pizza_name
ORDER BY Revenue DESC limit 5;

Output: <br>
![image](https://github.com/user-attachments/assets/501f2264-b883-4711-970d-b318e110f3e3)

H. Bottom 5 Pizzas by Revenue <br>
SELECT pizza_name, CAST(SUM(total_price) As Decimal(10,2)) As Revenue
FROM pizza_sales_csv
GROUP BY pizza_name
ORDER BY Revenue limit 5;

Output: <br>
![image](https://github.com/user-attachments/assets/4266af2b-4eba-4ccc-aa47-6ab85a986acf)

I. Top 5 Pizzas by Quantity <br>
SELECT pizza_name, CAST(SUM(quantity) As Decimal(10,2)) As Total_Quantity_Sold
FROM pizza_sales_csv
GROUP BY pizza_name
ORDER BY Total_Quantity_Sold DESC limit 5;

Output: <br>
![image](https://github.com/user-attachments/assets/46fee0b0-bd32-4773-845a-97d5922ec97d)

J. Bottom 5 Pizzas by Quantity <br>
SELECT pizza_name, CAST(SUM(quantity) As Decimal(10,2)) As Total_Quantity_Sold                                              FROM pizza_sales_csv                                                        
GROUP BY pizza_name                                                      
ORDER BY Total_Quantity_Sold limit 5;

Output: <br>
![image](https://github.com/user-attachments/assets/6203aa76-2670-40a0-ab45-9e403f5e8bd1)

K. Top 5 Pizzas by Total Orders <br>
SELECT pizza_name, COUNT(DISTINCT order_id) As Total_Orders
FROM pizza_sales_csv
GROUP BY pizza_name
ORDER BY Total_Orders DESC limit 5;

Output: <br>
![image](https://github.com/user-attachments/assets/cf0b7aee-7405-4a46-a232-f939d40e0e31)

 
L. Borrom 5 Pizzas by Total Orders <br>
SELECT pizza_name, COUNT(DISTINCT order_id) As Total_Orders
FROM pizza_sales_csv
GROUP BY pizza_name
ORDER BY Total_Orders limit 5;

Output: <br>
![image](https://github.com/user-attachments/assets/66f59e0d-7b6d-4bcd-8f08-11494f8b389f)

# Data Visualization Using Power BI
Data Visualization is done using Power BI and the .pbix report is attached in the repository.










  




 
