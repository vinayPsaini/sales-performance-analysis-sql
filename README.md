# 📊 Global Sales Performance Analysis Using SQL

## 🗂️ Dataset  
This project uses the [Superstore Global Sales dataset], a popular retail dataset containing detailed records of customer orders, product categories, sales performance, and shipping operations across multiple countries and years.

---

## 🎯 Project Goal  
To deliver a complete, business-ready SQL analysis of global sales performance — solving over 40 real-world business questions related to revenue, profitability, customer behavior, product trends, regional analysis, shipping costs, and discount strategies.  
The project is designed to reflect how a data analyst contributes to real-world decision-making through clean SQL logic and stakeholder-focused insights.

---

## 🛠️ Tools & Skills
- **Database:** PostgreSQL  
- **Environment:** pgAdmin 
- **Skills Demonstrated:**
  - Joins (CROSS, SELF)
  - Aggregations and Filtering
  - Window Functions (RANK, ROW_NUMBER)
  - CTEs and Subqueries
  - Date Functions & CASE Statements
  - KPI Derivation and Business Logic Framing

---

## 🔍 Key Business Questions Answered
✅ What is the total sales, profit, and discount over time?  
✅ Which regions, states, and cities are most/least profitable?  
✅ Who are the top 10 customers by sales and profit?  
✅ Which product categories or sub-categories contribute to losses?  
✅ What’s the impact of discounts on profit margin?  
✅ Which customer segments and shipping modes are most cost-effective?  
✅ Are shipping costs and delays affecting profitability?  
✅ Which months and years show growth or decline in performance?

> _All questions were solved using SQL-only analysis over clean tabular data._

---

## ✨ Key Insights (Executive Summary)

- **Technology** is the most profitable category with high margin and repeat demand.  
- **Furniture (esp. Tables)** suffered frequent losses, mostly due to heavy discounting.  
- **Central region** consistently leads in profitability with operational efficiency.  
- **High discount (>30%) orders** often show negative profit — especially in the furniture category.  
- **Corporate segment** customers show strong repeat behavior and highest order values.  
- **Shipping cost** per unit is highest in **Southeast Asia**, impacting margins for low-value orders.
 

---

## 📁 Project Structure
```
sales-performance-analysis-sql/
│
├── queries/                  # SQL queries solving business problems
│   ├── 01_kpi_summary.sql
│   ├── 02_sales_by_region.sql
│   └── ... (40+ total queries)
│
├── outputs/                  # CSVs and visuals from queries
│   ├── summary_metrics.csv
│   ├── top_customers.csv
│   └── ...
│
├── documentation/            # Written summaries for both tech and non-tech users
│   ├── README.md              ← Project overview and insights
│   ├── business_summary.md    ← Executive summary of findings
│   ├── query_index.md         ← What each query does
│   └── glossary.md            ← Business terms explained
│
├── dataset/                  # Cleaned dataset
│   └── superstore_cleaned.csv
│
└── LICENSE                   # Licensing for public use
```

