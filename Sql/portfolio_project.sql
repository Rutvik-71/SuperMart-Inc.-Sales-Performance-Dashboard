create database supermart ;
use supermart;

select * from superstore limit 5;
describe superstore;

-- 1) total revenue,profit,margin(overall KPI's)
select
	round(sum(sales),2)as total_revenue,
	round(sum(profit),2) as total_profit,
    round(sum(profit)/sum(sales) * 100,2) as profit_margin_percentage
from superstore ;

-- 2) Revenue & Profit By Region 
select region ,
	round(sum(sales),2)as total_revenue,
	round(sum(profit),2) as total_profit,
    round(sum(profit)/sum(sales) * 100,2) as profit_margin_percentage
from superstore
group by  region 
order by total_revenue desc ;

-- to check how many regions are there 
select distinct region
from superstore;

-- 3) Sales by Category & sub-category 
select 
Category,
'Sub-Category',
	round(sum(sales), 2) as total_sales,
    round(sum(profit),2) as total_profit
from superstore
group by Category ,'Sub-Category'
order by total_profit desc ;

-- 4) Monthly Revenue Trend 
SELECT 
    DATE_FORMAT(STR_TO_DATE(`Order Date`, '%m/%d/%Y'), '%Y-%m') AS month_year,
    ROUND(SUM(Sales), 2) AS monthly_revenue
FROM superstore
GROUP BY month_year
ORDER BY month_year;

-- 5) Year over Year Growth 
SELECT 
    YEAR(STR_TO_DATE(`Order Date`, '%m/%d/%Y')) AS year,
    ROUND(SUM(Sales), 2) AS yearly_revenue,
    ROUND(SUM(Profit), 2) AS yearly_profit
FROM superstore
GROUP BY year
ORDER BY year;

-- Customer Segment Performance 
SELECT 
    Segment,
    COUNT(DISTINCT `Customer Name`) AS total_customers,
    ROUND(SUM(Sales), 2) AS total_revenue,
    ROUND(SUM(Profit), 2) AS total_profit
FROM superstore
GROUP BY Segment
ORDER BY total_revenue DESC;

-- Product sold at a loss(negative profit)
SELECT 
    `Product name`,
    `Sub-Category`,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit
FROM superstore
GROUP BY `Product name`, `Sub-Category`
HAVING total_profit < 0
ORDER BY total_profit ASC
LIMIT 10;

-- Top 10 most profitable products 
SELECT 
    `Product name`,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY `Product name`
ORDER BY total_profit DESC
LIMIT 10;
