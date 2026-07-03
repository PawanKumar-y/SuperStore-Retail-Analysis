# Retail Sales Analytics Dashboard

Analyzed 10,000+ retail transactions from the Kaggle Sample Superstore dataset using MySQL (CTEs, window functions) and built an interactive Tableau dashboard to visualize revenue trends, regional profitability, and customer segmentation.

**Live Dashboard:** [Tableau Public](https://public.tableau.com/app/profile/pawan.kumar.y7651/viz/SuperStoreRetailAnalysis/SuperStoreRetailAnalysis)
**Dataset:** [Sample Superstore - Kaggle](https://www.kaggle.com/datasets/vivek468/superstore-dataset-final)

---

## Tech Stack
- **MySQL 8.0** / MySQL Workbench - data cleaning, validation, and analysis
- **SQL** - CTEs, window functions (`LAG`, `SUM() OVER`, `RANK()`), joins, aggregations
- **Tableau Public** - interactive dashboard and visualization

---

## Key Insights

1. **Central region underperforms on efficiency despite strong revenue.** Central generated the second-highest revenue (~$498K) but the lowest profit margin of any region (8.06%) - nearly half of West's margin (14.86%), despite West and Central having comparable order volumes. This points to excessive discounting or higher fulfillment costs specifically in Central.

2. **West is the strongest region on both dimensions.** Highest revenue (~$713K) *and* highest margin (14.86%) - the only region that leads on volume and efficiency simultaneously.

3. **Revenue shows strong Q4 seasonality.** Every year in the dataset shows a consistent spike in November/December revenue (peaking as high as $117K in a single month), suggesting holiday-driven demand that could inform inventory and staffing planning.

4. **Cumulative revenue grew from ~$14K (Jan 2014) to a running total of $2.27M by Dec 2017** - a clear multi-year upward trend beneath the month-to-month volatility, visible via a running-total window function.

5. **Revenue is concentrated in a small set of top products.** The single best-selling product (a Canon imageCLASS copier) outsold the next-highest product by roughly 1.6x, indicating a small number of SKUs disproportionately drive top-line revenue.

6. **Customer value is concentrated, not evenly distributed.** Segmenting customers by total spend (RFM-lite: High / Mid / Low value) shows a small group of high-value customers contributing a disproportionate share of total revenue relative to their count - a classic Pareto pattern worth targeting with retention-focused strategies.

---

## Project Structure
```
Retail Analysis Project/
├── README.md
├── dataset/
│   └── Sample - Superstore.xlsx        (raw source data from Kaggle)
├── sql/
│   ├── 01_setup.sql
│   ├── 02_data_cleaning.sql
│   ├── 03_data_validation.sql
│   ├── 04_monthlyRevenue.sql
│   ├── 05_Top10_MostSoldProducts.sql
│   ├── 06_ProfitPercentage_Region&City_wise.sql
│   ├── 07_MonthlySales&Running_total_after_each_month.sql
│   ├── 08_CustomerSegmentation_based_on_RecencyFrequencyMonetary(RFM).sql
│   ├── 09_Year_Over_Year_Growth.sql
│   ├── 10_Max_sold_product_in_each_Category&Sub-Category.sql
│   └── 11_Average_Time_to_Delivery&&Average_Max_TotalProfit_Calculation.sql
├── exports/
│   └── (CSV exports of each query result - one per .sql file above, used as Tableau data sources)
└── tableau/
    ├── Montly Revenue Trend line chart
    ├── Top 10 Most Sold Products in superstore
    ├── Regional Performance analysis of superstore
    ├── City wise Performance analysis of superstore
    └── Customer Segmentation based on RFM
```

## What the SQL demonstrates
- **Window functions:** running-total revenue (`SUM() OVER`), year-over-year growth (`LAG()`), top-selling sub-category per category (`RANK() OVER (PARTITION BY ...)`)
- **CTEs:** customer RFM-lite segmentation, yearly revenue aggregation
- **Original queries beyond the core analysis:** average delivery time by shipment mode, and profit behavior across discount levels
- **Data cleaning discipline:** documented date-type conversion, null/duplicate validation, and column renaming - including recovering from and correctly handling a mid-project `ALTER TABLE` mistake, run one block at a time with verification between steps

## Dashboard Features
- Monthly revenue trend (line chart)
- Top 10 products by revenue
- Regional performance, colored by profit margin
- Customer segmentation by value tier (count + total revenue per segment)