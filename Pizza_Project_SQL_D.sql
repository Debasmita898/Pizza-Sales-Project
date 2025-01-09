use project_pizza;
select * from pizza_sales_csv limit 5;
# A. KPIs
# TOTAL REVENUE
SELECT sum(total_price) from pizza_sales_csv;

# Average Order Value
SELECT (sum(total_price)/count(distinct order_id)) As Avg_Ord_Val from pizza_sales_csv;

# TOTAL PIZZAS SOLD
SELECT sum(quantity) As Tot_Pizz_Sld from pizza_sales_csv;

# Total Orders
SELECT count(distinct order_id) as Total_Orders from pizza_sales_csv;

# Average Pizzas per order
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Avg_Pizzas_per_order
FROM pizza_sales_csv;

# B. DAILY TREND FOR TOTAL ORDERS
SELECT dayofweek(order_date) As Day1, dayname(order_date) As Order_Day, count(distinct order_id) As Total_Orders
from pizza_sales_csv
group by Day1, Order_Day;            # check table

# C. Monthly Trend for Orders
SELECT monthname(order_date) as Month_Name, COUNT(DISTINCT order_id) as Total_Orders
from pizza_sales_csv
GROUP BY monthname(order_date)
order by Total_Orders desc;

# D. Percentage of Sales by Pizza Category
SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales_csv) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales_csv
GROUP BY pizza_category;

# E. Percentage of Sales by Pizza Size
SELECT pizza_size, CAST(sum(total_price) As DECIMAL(10,2)) As total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales_csv) As DECIMAL(10,2)) As PST
FROM pizza_sales_csv
GROUP By pizza_size
ORDER By pizza_size;

# F. Total Pizzas sold by Pizza Category.
SELECT pizza_category, SUM(quantity) As Total_Pizzas_Sold
FROM pizza_sales_csv
GROUP By pizza_category
ORDER BY Total_Pizzas_Sold DESC;

# G. Top 5 Pizzas by Revenue
SELECT pizza_name, CAST(SUM(total_price) As Decimal(10,2)) As Revenue
FROM pizza_sales_csv
GROUP BY pizza_name
ORDER BY Revenue DESC limit 5;

# H. Bottom 5 Pizzas by Revenue
SELECT pizza_name, CAST(SUM(total_price) As Decimal(10,2)) As Revenue
FROM pizza_sales_csv
GROUP BY pizza_name
ORDER BY Revenue limit 5;

# I. Top 5 Pizzas by Quantity
SELECT pizza_name, CAST(SUM(quantity) As Decimal(10,2)) As Total_Quantity_Sold
FROM pizza_sales_csv
GROUP BY pizza_name
ORDER BY Total_Quantity_Sold DESC limit 5;

# J. Bottom 5 Pizzas by Quantity.
SELECT pizza_name, CAST(SUM(quantity) As Decimal(10,2)) As Total_Quantity_Sold
FROM pizza_sales_csv
GROUP BY pizza_name
ORDER BY Total_Quantity_Sold limit 5;

# K. Top 5 Pizzas by Total Orders.
SELECT pizza_name, COUNT(DISTINCT order_id) As Total_Orders
FROM pizza_sales_csv
GROUP BY pizza_name
ORDER BY Total_Orders DESC limit 5;

# L. Bottom 5 Pizzas by Total Orders.
SELECT pizza_name, COUNT(DISTINCT order_id) As Total_Orders
FROM pizza_sales_csv
GROUP BY pizza_name
ORDER BY Total_Orders limit 5;

