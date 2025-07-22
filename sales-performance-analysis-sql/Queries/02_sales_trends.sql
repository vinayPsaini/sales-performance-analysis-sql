-- ==========================================
-- Section 2: Time-Based Sales Trends Analysis
-- ==========================================

-- Purpose: Analyze sales and profit trends over years and quarters
-- Stakeholder: Finance & Strategy Team
-- Skills Demonstrated: GROUP BY, Date Functions


-- What is the Yearly trend of sales and profit?
select 
	extract (year from order_date) as year,
	sum(sales) Yearly_sales, 
	sum(profit) Yearly_profit 
from 
	superstore_sales 
group by
	year 
order by
	Yearly_sales;

-- What is the quarterly trend of sales and profit?
select
	'Q' || EXTRACT(QUARTER FROM order_date::DATE) || ' ' || 
    EXTRACT(YEAR FROM order_date::DATE) AS quarter_year,
	sum(sales) Monthly_sales , 
	sum(profit) Monthly_profit 
from
	superstore_sales
group by 
	extract (year from order_date),
	extract (quarter from order_date)
order by
	extract (year from order_date),
	extract (quarter from order_date);

-- What is the monthly trend of sales and profit?
select 
	extract (month from order_date) as month,
	sum(sales) Monthly_sales , 
	sum(profit) Monthly_profit 
from
	superstore_sales 
group by 
	month 
order by
	month; 

-- What is the average delivery time in days? 
select 
	round(avg(ship_date-order_date)) avg_delivery_days 
from 
	superstore_sales;

-- Which month has the highest average profit per order?
select 
	extract (month from order_date) as month,
	avg(profit) Avg_profit 
from 
	superstore_sales 
group by 
	month 
order by 
	Avg_profit desc; 


