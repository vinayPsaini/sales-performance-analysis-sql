-- File: 09_summary_all_metrics.sql
-- Purpose: Output a single summary view of key business metrics and rankings from the sales dataset
-- Stakeholder: Executive Team / Dashboard Report
-- Skills Demonstrated: Subqueries, Aggregations


-- Overall KPIs
SELECT 
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(AVG(discount) * 100, 2) AS avg_discount_percentage,
    ROUND(SUM(shipping_cost), 2) AS total_shipping_cost
FROM superstore_sales;

-- Best Region by Profit
SELECT 
    region,
    ROUND(SUM(profit), 2) AS region_profit
FROM superstore_sales
GROUP BY region
ORDER BY region_profit DESC
LIMIT 1;


-- Top Customer by Sales
SELECT 
    customer_name,
    ROUND(SUM(sales), 2) AS total_sales
FROM superstore_sales
GROUP BY customer_name
ORDER BY total_sales DESC
LIMIT 1;

-- Worst Sub-Category by Total Profit
SELECT 
    sub_category,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore_sales
GROUP BY sub_category
ORDER BY total_profit ASC
LIMIT 1;

-- Most Profitable Product
SELECT 
    product_name,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore_sales
GROUP BY product_name
ORDER BY total_profit DESC
LIMIT 1;

-- Average Discount for Loss-Making Orders
SELECT 
    ROUND(AVG(discount) * 100, 2) AS avg_discount_on_losses
FROM superstore_sales
WHERE profit < 0;

-- Top 3 Loss-Making Orders (for snapshot)
SELECT 
    order_id,
    product_name,
    ROUND(sales, 2) AS sales,
    ROUND(profit, 2) AS profit,
    ROUND(discount * 100, 2) AS discount_pct
FROM superstore_sales
WHERE profit < 0
ORDER BY profit ASC
LIMIT 3;
