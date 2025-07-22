-- ==========================================
-- Section 3: Regional/Geographical Analysis
-- ==========================================

-- Purpose: Compare sales and profit across regions, states, and cities
-- Stakeholder: Regional Managers / Sales Directors
-- Skills Demonstrated: GROUP BY, Joins, Aggregation




-- Sales and Profit by:
-- City
select 
	city,
	sum(sales) as Total_sales, 
	sum(profit) as Total_profit
from
	superstore_sales
group by
	city
order by
	Total_profit desc;

-- State
select 
	state,
	sum(sales) as Total_sales, 
	sum(profit) as Total_profit
from
	superstore_sales
group by
	state;

-- Country
select 
	country,
	sum(sales) as Total_sales, 
	sum(profit) as Total_profit
from
	superstore_sales
group by
	country
order by
	Total_profit desc;

-- Market
select 
	market,
	sum(sales) as Total_sales, 
	sum(profit) as Total_profit
from
	superstore_sales
group by
	market
order by
	Total_profit desc;

-- Region
select 
	region,
	sum(sales) as Total_sales, 
	sum(profit) as Total_profit
from
	superstore_sales
group by
	region
order by
	Total_profit desc;

-- Top 10 States by profit and there profit contribution
select 
	state, 
	sum(profit) as Total_profit,
    round(Sum(profit)*100/(select sum(profit)from superstore_sales),2) as Profit_Contribution
from 
	superstore_sales 
group by 
	state 
order by 
	Total_profit desc 
limit 
	10; 

-- Loss Making Cities
select 
	city,
	sum(profit) Total_profit 
from 
	superstore_sales 
group by 
	city 
having 
	sum(profit)<0
order by 
	Total_profit; 

-- Which country records highest sales 
select 
	country, 
	sum(sales) as Total_sales 
from 
	superstore_sales 
group by 
	country 
order by 
	Total_sales desc;

-- Profitability by Region & Category
select
	region,
	category,
	round(sum(profit), 2) as total_profit
from 
	superstore_sales
group by
	region,
	category 
order by 
	region,
	category;
