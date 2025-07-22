-- ==========================================
-- Section 4: Product and Category Performance
-- ==========================================

-- Purpose: Identify best-selling and least profitable products and sub-categories
-- Stakeholder: Product Category Lead / Merchandising
-- Skills Demonstrated: GROUP BY, CASE, HAVING, Joins


-- SubCategory wise Sales, Profit and number of orders, Which Sub-category is most profitable? 

select 
	sub_category, 
	sum(sales) as Total_sales, 
	sum(profit) Total_profit, 
	count(order_id) Total_orders 
from 
	superstore_sales 
group by 
	sub_category 
order by 
	total_profit desc;


-- Top 10 products with highest sales
select 
	distinct(product_name), 
	sum(sales) as Total_sales 
from 
	superstore_sales 
group by 
	product_name
order by 
	Total_sales desc
limit
	10;


-- Top 10 most profitable products
select 
	distinct(product_name), 
	sum(profit) as Total_profit 
from 
	superstore_sales 
group by 
	product_name
order by 
	Total_profit desc
limit
	10;


-- Top 10 products with highest sales but low profit
select 
	distinct(product_name), 
	sum(sales) as Total_sales, 
	sum(profit) as Total_profit 
from 
	superstore_sales 
group by 
	product_name
having 
	sum(profit)<0    
order by 
	Total_sales desc,
	Total_profit asc 
limit 
	10;


-- Which categories have the best average profit margin?
select 
	category, (
	sum(profit)/sum(sales))*100 as avg_profit 
from 
	superstore_sales 
group by
	category 
order by
	avg_profit desc;


-- High Revenue but Low Profit Products
select 
	product_name, 
	category, 
	sum(sales) AS total_sales,
	sum(profit) as total_profit 
from 
	superstore_sales
group by
	product_name,
	category 
having 
	sum(sales) > 5000 AND sum(profit) < 100
order by
	total_sales desc;	


-- Subcategory giving low profit despite high discount
select 
	sub_category, 
	round((avg(discount)*100),2) as avg_discount, 
	sum(profit) as total_profit 
from 
	superstore_sales
where 
	Discount > 0.3 and profit <0 
group by
	sub_category 
order by 
	avg_discount desc,
	total_profit asc;


-- Categories with highest profit margin
select
	sub_category,
	round((sum(profit)*100/sum(sales)),2) as Profit_Margin_Percent
from 
	superstore_sales
group by
	sub_category
order by
	Profit_Margin_Percent desc;

