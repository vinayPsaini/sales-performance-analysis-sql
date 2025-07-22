-- ==========================================
-- Section 5: Discount Impact Analysis
-- ==========================================

-- Purpose: Find top customers by revenue and profit; analyze repeat behavior
-- Stakeholder: CRM / Customer Success Team
-- Skills Demonstrated: GROUP BY, Subqueries, Ranking


-- Analyze discount impact: Is high discount lowering profit?

select 
	case
		when discount = 0 then '0% discount'
		when discount <= 0.25 then '1-25% discount'
		when discount <= 0.5 then '25-50% discount'
		when discount <= 0.75 then '50-75% discount'
	else
	'75% and above discount'
	end as
	discount_range,
count(order_id) as order_quantity,
sum(sales) as total_sales, 
sum(profit) as total_profit
from
	superstore_sales
group by
	discount_range
order by
	discount_range;

-- Loss making products
select 
	sub_category,
	product_name,
	discount,
	profit  
from 
	superstore_sales
where 
	Discount > 0.3 and profit < 0
order by 
	Discount desc,
	Profit asc;

-- Discount Distribution among subcategories
select
	sub_category,
	round(100*sum(discount)/(select sum(discount) from superstore_sales),2) as Discount_Distribution
from 
	superstore_sales
group by
	sub_category
order by
	Discount_distribution desc;


-- Outlier Detection: Orders with High Discount but High Profit
select 
	order_id,
	discount,
	profit, 
	sales 
from 
	superstore_sales
where 
	Discount > 0.3 and profit > 1000;

SELECT region, 
       ROUND(AVG(Shipping_Cost), 2) AS Avg_Shipping_Cost,
       ROUND(AVG(Profit), 2) AS Avg_Profit
FROM superstore_sales
GROUP BY region
ORDER BY Avg_Shipping_Cost DESC;

