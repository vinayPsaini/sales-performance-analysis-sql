-- ==========================================
-- Section 7: Shipping & Logistics Analysis
-- ==========================================

-- Purpose: Explore shipping cost, shipping delays and their effect on profitability
-- Stakeholder: Logistics / Operations Team
-- Skills Demonstrated: Date Differences, Aggregations, Joins



-- Shipping Cost by Region
select 
	region,
	sum(shipping_cost) as Total_Shipping_Cost
from 
	superstore_sales
group by
	region
order by
	Total_Shipping_Cost desc;
	

-- Most popular Ship Mode by order count
select 
	ship_mode,
	count(order_id) as No_of_orders 
from 
	superstore_sales 
group by 
	ship_mode
order by 
	No_of_orders desc limit 1;


-- Delivery Delay Analysis
select 
	region,
	ship_mode,
	round(avg(ship_date - order_date),2) as avg_days_to_ship 
from 
	superstore_sales
group by
	region,
	ship_mode
order by 
	ship_mode ;

-- % Most delayed orders
select 
	region,
    count(*)
filter
	(where Ship_Date - Order_Date >6.5 ) * 100.0 / count(*) as percent_delayed_orders
FROM 
	superstore_sales
group by
	region;
	

-- Orders with high shipping cost and low profit
select
	sub_category,
	order_id,
	product_name,
	shipping_cost,
	profit
from
	superstore_sales
where
	shipping_cost>500 and profit<0;


-- Sales and profit by Segment
select 
	segment,
	sum(sales) Total_sales,
	sum(profit) Total_profit
from 
	superstore_sales 
group by 
	segment
order by
	Total_profit desc;


