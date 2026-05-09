# 📊 SuperMart Inc. Sales Performance Dashboard
### An End-to-End Data Analytics Portfolio Project | Python • SQL • Power BI

---

## 👨‍💻 About This Project

This project simulates a **real-world corporate data analytics workflow** for SuperMart Inc., a retail company operating across 4 regions in the United States from 2014 to 2018.

As a Data Analyst, I was responsible for:
- Cleaning and transforming raw sales data using **Python & Pandas**
- Analyzing business performance using **SQL queries**
- Building an interactive **Power BI dashboard** to answer 5 key business questions

---

## 🎯 Business Problem

SuperMart Inc. lacked centralized visibility into sales performance across regions and product categories. The goal was to build a dashboard that answers these 5 business questions:

| # | Business Question |
|---|------------------|
| 1 | Which region generates the highest revenue and profit? |
| 2 | Which product category/sub-category has the lowest profit margin? |
| 3 | Is revenue growing month over month and year over year? |
| 4 | Which customer segment is most valuable? |
| 5 | Are there products being sold at a loss? |

---

## 📁 Project Structure

```
supermart-sales-dashboard/
│
├── 📂 data/
│   ├── superstore.csv              # Raw dataset
│   └── superstore_cleaned.csv      # Cleaned dataset
│
├── 📂 python/
│   └── data_cleaning.ipynb         # Data cleaning notebook
│
├── 📂 sql/
│   └── supermart_analysis.sql      # SQL analysis queries
│
├── 📂 dashboard/
│   └── supermart_dashboard.pbix    # Power BI dashboard file
│
├── 📂 images/
│   ├── page1_executive_overview.png
│   ├── page2_product_analysis.png
│   └── page3_customer_segment.png
│
└── README.md
```

---

## 🛠️ Tools & Technologies

| Tool | Purpose |
|------|---------|
| **Python** | Data cleaning & EDA |
| **Pandas** | Data manipulation |
| **MySQL** | Data analysis & querying |
| **Power BI** | Dashboard & visualization |
| **GitHub** | Version control & portfolio |

---

## 📊 Dataset Details

| Property | Value |
|----------|-------|
| Source | Superstore Sales Dataset |
| Rows | 9,994 |
| Columns | 21 (original) → 23 (after cleaning) |
| Date Range | 2014 – 2018 |
| Regions | East, West, Central, South |
| Categories | Furniture, Office Supplies, Technology |
| Segments | Consumer, Corporate, Home Office |

---

## 🔧 Phase 1: Data Cleaning (Python)

### Key Steps:
- Loaded dataset with `encoding='latin-1'`
- Fixed column names (lowercase, underscores)
- Converted date columns to datetime format
- Handled missing values and duplicates
- Removed outliers (negative shipping days, zero sales)
- Added 7 new calculated columns:

| New Column | Description |
|------------|-------------|
| `profit_margin_pct` | Profit / Sales × 100 |
| `shipping_days` | Ship Date - Order Date |
| `order_year` | Year extracted from Order Date |
| `order_month` | Month extracted from Order Date |
| `order_month_name` | Month name (Jan, Feb...) |
| `order_quarter` | Quarter (Q1, Q2, Q3, Q4) |
| `month_year` | MMM-YYYY format |

---

## 🔍 Phase 2: SQL Analysis

### 8 Key Queries Written:

```sql
-- 1. Overall KPIs
SELECT 
    SUM(sales) as total_revenue,
    SUM(profit) as total_profit,
    ROUND(SUM(profit)/SUM(sales)*100, 2) as profit_margin
FROM sales;

-- 2. Revenue by Region
SELECT region,
    SUM(sales) as revenue,
    SUM(profit) as profit
FROM sales
GROUP BY region
ORDER BY revenue DESC;

-- 3. Products Sold at a Loss
SELECT product_name, category, SUM(profit) as total_profit
FROM sales
GROUP BY product_name, category
HAVING SUM(profit) < 0
ORDER BY total_profit ASC;
```

---

## 📈 Phase 3: Power BI Dashboard

### 3-Page Dashboard Structure:

#### Page 1: Executive Overview
- 4 KPI Cards (Revenue, Profit, Margin %, Orders)
- Monthly Revenue Trend (Line Chart)
- Year over Year Revenue (Column Chart)
- Revenue by Region (Bar Chart)
- 4 Interactive Slicers

#### Page 2: Product Analysis
- Profit Margin by Category (Bar Chart)
- Sales by Sub-Category (Bar Chart)
- Top 10 Most Profitable Products (Bar Chart)
- Products Sold at a Loss (Table with conditional formatting)

#### Page 3: Customer Segment Analysis
- Revenue by Segment (Donut Chart)
- Profit by Segment (Bar Chart)
- Revenue Trend by Segment (Line Chart)
- Segment Summary Table

### DAX Measures Created:
```
Total Revenue    = SUM('superstore'[Sales])
Total Profit     = SUM('superstore'[Profit])
Profit Margin %  = DIVIDE(SUM('superstore'[Profit]), SUM('superstore'[Sales]))
Total Orders     = DISTINCTCOUNT('superstore'[Order ID])
```

---

## 💡 Key Business Insights

| # | Insight | Impact |
|---|---------|--------|
| 1 | **West region** leads with $725K revenue (31.5% of total) | Focus marketing in West |
| 2 | **Furniture** has lowest profit margin at only 2.49% | Review pricing strategy |
| 3 | Revenue grew **51% from 2014 to 2017** ($484K → $733K) | Strong business growth |
| 4 | **Consumer segment** drives 50.56% of total revenue | Prioritize consumer offers |
| 5 | Loss-making products total **-$1,17,770** | Discontinue or reprice |

---

## 📸 Dashboard Screenshots

### Page 1: Executive Overview
<img width="1266" height="728" alt="Screenshot 2026-03-15 235203" src="https://github.com/user-attachments/assets/829c9cd1-933c-4b4e-8aa9-76ba27fefc36" />


### Page 2: Product Analysis
<img width="1224" height="684" alt="Screenshot 2026-03-15 235211" src="https://github.com/user-attachments/assets/4c307da2-ca1b-45f2-a2f1-2d8369209901" />

### Page 3: Customer Segment Analysis
<img width="1177" height="659" alt="Screenshot 2026-03-15 235220" src="https://github.com/user-attachments/assets/e69f8a3e-a1c5-43ee-aebc-cbe29fe82e04" />


---

## 🚀 How to Run This Project

### Step 1 — Clone Repository
```bash
git clone https://github.com/yourusername/supermart-sales-dashboard.git
cd supermart-sales-dashboard
```

### Step 2 — Run Python Cleaning
```bash
pip install pandas numpy
jupyter notebook python/data_cleaning.ipynb
```

### Step 3 — Run SQL Queries
```bash
# Import superstore_cleaned.csv into MySQL
# Open sql/supermart_analysis.sql
# Run queries in MySQL Workbench
```

### Step 4 — Open Power BI Dashboard
```
Open dashboard/supermart_dashboard.pbix in Power BI Desktop
```

---

## 📚 Skills Demonstrated

```
✅ Data Cleaning & Transformation (Python/Pandas)
✅ Exploratory Data Analysis (EDA)
✅ SQL Query Writing & Analysis
✅ DAX Measures & Calculated Columns
✅ Interactive Dashboard Design
✅ Business Insight Generation
✅ Data Storytelling
```

---

## 📬 Connect With Me

| Platform | Link |
|----------|------|
| 💼 LinkedIn | [Your LinkedIn] |
| 🐙 GitHub | [Your GitHub] |
| 📧 Email | [Your Email] |

---

## 📜 License
MIT — Feel free to fork and use in your own portfolio!

---<br>
Author --> Rutvik Patil

⭐ If you found this project helpful, please give it a star!
