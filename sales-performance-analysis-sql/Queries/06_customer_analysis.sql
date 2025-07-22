-- ==========================================
-- Section 6: Customer Profitability Analysis
-- ==========================================

-- Purpose: Assess how discounts affect profit and identify unprofitable discounts
-- Stakeholder: Sales Strategy / Marketing
-- Skills Demonstrated: CASE, Aggregations, Filtering


-- Use RANK() to find top 5 products per category by sales
select category,product_name, total_sales from
	(select category, product_name,sum(sales) as total_sales,
	rank() over(partition by category order by sum(sales) desc ) 
	from superstore_sales group by category, product_name)
	where rank <=5;

-- Use a CASE WHEN to label orders: “High Priority” = if Order_Priority = 'High' or 'Critical' “Low Priority” = otherwise |
select *,
	case 
		when order_priority = 'Critical' or order_priority ='High' then 'Immediate'
		when order_priority = 'Medium' then 'Intermediate'
		else 'Low Priority'
	end as order_labels from superstore_sales;

-- Write a CTE to find the first and last order date for each customer |

with order_details as(
	select
		customer_name,
		order_date 
		from superstore_sales)
select 
	customer_name,
	min(order_date) as first_order_date,
	max(order_date) as last_order_date
from
	order_details
group by 
	customer_name 
order by 
	customer_name;

-- Percent of Unprofitable Orders
select 
	round(100.0 * COUNT(order_id) FILTER (WHERE Profit < 0) / COUNT(*), 2) AS percent_unprofitable_orders
FROM
	superstore_sales;

-- Sales Contribution % by Segment
select 
	segment, 
	round(sum(sales), 2) as total_sales,
	round(100.0 * sum(sales) / (select sum(sales) from superstore_sales), 2) AS percent_of_total
FROM
	superstore_sales
group by
	segment
order by
	percent_of_total desc;

-- profit contribution by top 10 customers
with total_profit as(
	select sum(profit) as total_profit 
	from 
	superstore_sales),
	
top_10_customers as(
	select 
	customer_id, 
	customer_name,
	sum(profit) as cust_profit from superstore_sales 
	group by
		customer_id, customer_name
	order by 
		cust_profit desc limit 10)
	
SELECT 
    ROUND(SUM(t.cust_profit), 2) AS top_10_profit,
    ROUND(max(tp.total_profit), 2) AS overall_profit,
    ROUND(100.0 * SUM(t.cust_profit) / max(tp.total_profit), 2) AS percent_contribution
FROM 
	top_10_customers t
CROSS JOIN
	total_profit tp;	

-- sales contribution by top 10 customers
with total_sales as(
	select sum(sales) as total_sales 
	from 
	superstore_sales),
	
top_10_customers as(
	select 
	customer_id, 
	customer_name,
	sum(sales) as cust_sales from superstore_sales 
	group by
		customer_id, customer_name
	order by 
		cust_sales desc limit 10)
	
SELECT 
    ROUND(SUM(t.cust_sales), 2) AS top_10_profit,
    ROUND(max(tp.total_sales), 2) AS overall_sales,
    ROUND(100.0 * SUM(t.cust_sales) / max(tp.total_sales), 2) AS percent_contribution
FROM 
	top_10_customers t
CROSS JOIN
	total_sales tp;

-- Which customers placed multiple orders where the second order had a higher profit than the previous one?

SELECT 
    o1.Customer_ID,
	o1.customer_name,
    o1.Order_ID AS Previous_Order,
    o2.Order_ID AS Later_Order,
    o1.Profit AS Previous_Profit,
    o2.Profit AS Later_Profit
FROM superstore_sales o1
JOIN superstore_sales o2
  ON o1.Customer_ID = o2.Customer_ID
  AND o2.Order_Date > o1.Order_Date
WHERE o2.Profit > o1.Profit
ORDER BY o1.Customer_ID, o1.Order_Date;

-- Customers(repeated) with highest average value
WITH customer_orders AS (
    SELECT Customer_ID, Segment, COUNT(Order_ID) AS total_orders,
           SUM(Sales) AS total_sales
    FROM superstore_sales
    GROUP BY Customer_ID, Segment
    HAVING COUNT(Order_ID) > 1  -- repeat customers only
)

SELECT Segment,
       COUNT(Customer_ID) AS repeat_customers,
       ROUND(AVG(total_sales / total_orders), 2) AS avg_order_value
FROM customer_orders
GROUP BY Segment
ORDER BY avg_order_value DESC;

