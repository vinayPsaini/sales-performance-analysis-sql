-- ==========================================
-- Section 1: Executive KPIs
-- ==========================================


-- Purpose: Calculate total sales, total profit, total orders, and total discounts across dataset
-- Stakeholder: Executive Team / BI Manager
-- Skills Demonstrated: Aggregations (SUM, COUNT), Basic Metrics

-- Total sales, profit, Total orders, Average Discount, Overall profit margin, Average Shipping cost

select 
	sum(sales) Total_sales, 
	sum(profit) Total_profit, 
	count(order_id) Total_orders,
	round(100*avg(discount),2) as Average_discount_percent, 
	round((sum(profit)/sum(sales))*100,2) profit_margin_percent,
	round(avg(shipping_cost),2) average_shipping_cost 
from 
	superstore_sales;

-- Unique customers and products
select 
	count(distinct(product_name)) unique_products,
	count(distinct(customer_id)) unique_customers 
from 
	superstore_sales;


