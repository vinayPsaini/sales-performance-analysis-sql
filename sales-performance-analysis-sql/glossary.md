# 📘 Glossary of Terms – Sales Performance SQL Project

This glossary defines business and technical terms used across the SQL queries, dashboards, and summaries in this project. It ensures consistency and clarity for both technical and non-technical stakeholders.

---

### 🔹 Business Metrics

- **Sales**  
  Total revenue generated from customer orders before any deductions.

- **Profit**  
  Net earnings after deducting costs (including shipping, discounts, etc.) from sales.

- **Profit Margin (%)**  
  `(Total Profit ÷ Total Sales) × 100` — indicates overall profitability.

- **Discount (%)**  
  Percentage reduction applied on product price at the time of sale.

- **Shipping Cost**  
  The logistical expense incurred to deliver products to customers.

- **Order**  
  A single purchase transaction, identified by a unique `Order_ID`.

- **Order Priority**  
  The urgency level of the order: Critical, High, Medium, or Low.

- **Average Delivery Time**  
  Days taken between `Order_Date` and `Ship_Date`.

---

### 🔹 Customer & Segment Terms

- **Customer_ID**  
  Unique identifier assigned to each customer.

- **Customer Segment**  
  Classification of customers into: `Consumer`, `Corporate`, `Home Office`.

- **Repeat Customer**  
  A customer with more than one order in the dataset.

- **Average Order Value (AOV)**  
  `Total Sales ÷ Total Orders` for a customer or segment.

---

### 🔹 Product & Category

- **Category**  
  Broad classification of products (e.g., Furniture, Technology, Office Supplies).

- **Sub-Category**  
  More specific grouping within a category (e.g., Chairs, Phones, Binders).

- **Top Products**  
  Products with highest total sales or profit.

- **Loss-Making Product**  
  Products where total profit is negative.

- **High-Discount Product**  
  Products sold at a discount > 30%, often correlated with reduced profit.

---

### 🔹 Regional/Market Dimensions

- **Region**  
  Geographic division like West, Central, East, South, etc.

- **State / City / Country / Market**  
  Various granular location fields to analyze performance geographically.

---

### 🔹 Analytical Techniques

- **CTE (Common Table Expression)**  
  A temporary result set defined with `WITH`, used for breaking down complex queries.

- **Self Join**  
  Joining a table to itself to compare rows within the same table (e.g., comparing earlier vs later orders).

- **CASE WHEN**  
  Conditional logic used to categorize rows or flag custom labels (e.g., High Priority, Discount Buckets).

- **Window Functions**  
  Advanced functions like `RANK()`, `ROW_NUMBER()` used to perform calculations across a partition of data.

- **Aggregate Filters**  
  Using `FILTER (WHERE...)` to calculate conditional counts or sums.

- **Profit Contribution (%)**  
  `(Profit from Entity ÷ Total Profit) × 100` — to measure entity-level impact.

- **Sales Contribution (%)**  
  `(Sales from Entity ÷ Total Sales) × 100` — similar to profit, but based on revenue.

---

### 🔹 Time Dimensions

- **Order_Date**  
  Date when the order was placed.

- **Ship_Date**  
  Date when the order was shipped.

- **Monthly / Quarterly / Yearly Trends**  
  Aggregated performance metrics grouped by time periods.

- **Delayed Orders**  
  Orders where `Ship_Date - Order_Date > N days` (e.g., >4 or >6.5 days).

---

> ✅ This glossary ensures that your project remains accessible to both business leaders and technical collaborators reviewing your work.
