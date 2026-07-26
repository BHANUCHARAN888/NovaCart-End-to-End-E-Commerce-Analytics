# Business Requirements

## 1. Business Scenario

### <u>Company Information</u>

**Company Name:** NovaCart

**Industry:** E-Commerce

### <u>About the Company</u>

NovaCart is an online e-commerce platform that offers a wide range of products across multiple categories, including Electronics, Fashion, Home & Kitchen, Grocery, and Accessories. Customers can browse products, place orders, and complete purchases through the platform.

As the company continues to grow, management wants to better understand sales performance, customer purchasing behavior, product performance, and overall business trends. To support data-driven decision making, the Data Analytics team has been asked to analyze the company's transactional data and provide meaningful business insights.

---

## Version 1 Project Scope

### <u>Included Data</u>

- Customer Data
- Product Data (Category stored as a column)
- Orders
- Order Items
- Payments

### <u>Excluded Data</u>

- Shopping Cart
- Wishlist
- Product Reviews
- Shipping
- Returns

### <u>Scope Decision</u>

The selected datasets are sufficient to analyze sales performance, customer behavior, product performance, and payment trends while keeping the project focused and maintaining a well-structured relational database. Additional features such as returns, shipping, reviews, and cart analysis can be included in future project versions.

---

## 2. Business Goals & Objectives

### <u>Business Goal</u>

The primary goal of this project is to analyze NovaCart's sales data and generate actionable business insights that support data-driven decision making.

### <u>Business Objectives</u>

- Analyze monthly revenue trends to understand business growth over time.
- Identify the best-selling products based on sales quantity and revenue.
- Detect underperforming products that may require marketing or inventory improvements.
- Identify the most valuable customers based on purchasing behavior and total spending.
- Analyze product category performance to determine which categories contribute the most revenue.
- Measure key sales KPIs such as Total Revenue, Total Orders, and Average Order Value.
- Analyze payment methods and payment success rates.
- Provide business recommendations that help management improve sales performance and customer engagement.

---
## 3. Business Questions

### <u>Sales Performance</u>

- **Business Question 1**

How does monthly revenue change throughout the year?

**Business Value**

Analyze monthly revenue trends to identify high-performing and low-performing months. These insights help management understand sales patterns and make informed decisions for marketing campaigns, inventory planning, and future business strategies.

- **Business Question 2**

Which months generate the highest and lowest sales?

**Business Value**

Identify the best-performing and weakest-performing months to support seasonal planning, promotional activities, and resource allocation throughout the year.

- **Business Question 3**

Which product categories contribute the most to overall revenue?

**Business Value**

Evaluate category-wise revenue contribution to identify the company's strongest business segments and support strategic investment, inventory management, and marketing decisions.

- **Business Question 4**

What is the monthly sales trend for each product category?

**Business Value**

Analyze category performance over time to identify seasonal demand patterns and determine when specific categories require increased inventory, promotional campaigns, or targeted advertising.

- **Business Question 5**

What is the Average Order Value (AOV) across different months?

**Business Value**

Measure customer purchasing behavior over time to understand spending patterns and identify opportunities to increase average order value through product bundling, discounts, or cross-selling strategies.

- **Business Question 6**

Which months require additional marketing efforts to improve sales performance?

**Business Value**

Identify periods with relatively lower sales performance and recommend targeted marketing campaigns, promotional offers, or seasonal discounts to increase customer engagement and revenue.

- **Business Question 7**

Are there any seasonal sales patterns in customer purchasing behavior?

**Business Value**

Analyze seasonal demand across products and categories to support inventory forecasting, campaign planning, and timely promotional activities.

- **Business Question 8**

How has overall sales performance changed over time?

**Business Value**

Measure long-term business growth by analyzing sales trends over different time periods, helping management evaluate business performance and make strategic planning decisions.

---

### <u>Customer Analysis</u>

- **Business Question 1**

Which customer segments contribute the highest revenue across different product categories?

**Business Value**

Analyze customer purchasing behavior by category to support personalized marketing campaigns, targeted product recommendations, and improved customer engagement.

- **Business Question 2**

Which customers make repeat purchases within a 90-day period?

**Business Value**

Identify loyal customers and implement retention strategies such as loyalty programs, personalized discounts, and exclusive membership benefits.

- **Business Question 3**

Which regions generate the highest customer demand and revenue?

**Business Value**

Analyze regional sales performance to optimize inventory allocation, marketing campaigns, and future business expansion strategies.

- **Business Question 4**

Which customers consistently spend above the average order value?

**Business Value**

Identify premium customers for personalized recommendations, premium product offerings, VIP services, and customer loyalty initiatives.

- **Business Question 5**

Which product categories receive the least interest from different customer segments?

**Business Value**

Identify cross-selling opportunities and improve personalized recommendations by encouraging customers to explore product categories they have not previously purchased.

---

### <u>Product Analysis</u>

- **Business Question 1**

Which products contribute the highest percentage of the company's total revenue?

**Business Value**

Identify high-performing products that drive the majority of revenue. These insights help management prioritize inventory, strengthen supplier relationships, and allocate marketing budgets to maximize business growth.

- **Business Question 2**

Which products consistently have the lowest sales volume?

**Business Value**

Identify underperforming products that may require promotional campaigns, pricing adjustments, product bundling, or discontinuation to optimize the product portfolio.

- **Business Question 3**

Which products demonstrate consistent seasonal demand patterns?

**Business Value**

Analyze historical sales trends to forecast seasonal demand, improve inventory planning, and schedule promotional campaigns before peak selling periods.

- **Business Question 4**

Which products are most frequently purchased together?

**Business Value**

Identify cross-selling and bundle opportunities to increase Average Order Value (AOV), improve customer experience, and generate additional revenue through personalized product recommendations.

- **Business Question 5**

Which products generate high revenue despite having low sales volume, and which products generate high sales volume but low revenue?

**Business Value**

Differentiate between premium-value products and high-volume products to support pricing strategies, product positioning, and marketing investment decisions.

- **Business Question 6**

Which products show consistent growth or decline in sales over time?

**Business Value**

Monitor product performance trends to identify growing products that deserve additional investment and declining products that require strategic improvements or replacement.

- **Business Question 7**

Which products have the highest average order quantity per purchase?

**Business Value**

Identify products that customers frequently purchase in larger quantities to support inventory planning, bulk purchase promotions, and demand forecasting.

---

### <u>Payment Analysis</u>

- **Business Question 1**

Which payment methods are most preferred by customers?

**Business Value**

Analyze customer payment preferences to optimize payment gateway support, improve the checkout experience, and prioritize the most frequently used payment methods.

- **Business Question 2**

What is the payment success rate across different payment methods?

**Business Value**

Identify payment methods with higher failure rates to improve transaction reliability, reduce abandoned purchases, and enhance customer satisfaction.

- **Business Question 3**

Which payment methods contribute the highest revenue?

**Business Value**

Evaluate revenue generated through each payment method to understand customer payment behavior and support strategic partnerships with payment providers.

- **Business Question 4**

How do customer payment preferences vary across different regions?

**Business Value**

Analyze regional payment trends to support localized payment options, improve customer convenience, and increase successful transactions in different markets.

- **Business Question 5**

How have payment method usage patterns changed over time?

**Business Value**

Monitor changes in customer payment behavior over different time periods to support the adoption of emerging payment methods and improve future payment strategies.

---

## 4. Key Performance Indicators (KPIs)

### <u>Sales KPIs</u>

- Total Revenue
- Total Orders
- Total Units Sold
- Average Order Value (AOV)
- Monthly Revenue Growth

### <u>Customer KPIs</u>

- Total Customers
- New Customers
- Repeat Customers
- Customer Retention Rate
- Average Customer Spending

### <u>Product KPIs</u>

- Best-Selling Products
- Top Revenue-Generating Products
- Product Category Revenue
- Product Sales Volume
- Seasonal Product Demand

### <u>Payment KPIs</u>

- Payment Success Rate
- Revenue by Payment Method
- Most Preferred Payment Method

---

## 5. Business Assumptions

The following assumptions are made for the NovaCart E-Commerce Sales Analytics project to ensure consistent and accurate analysis.

### <u>Data Assumptions</u>

- Every customer has a unique Customer ID.
- Every product has a unique Product ID.
- Every order has a unique Order ID.
- Each order belongs to exactly one customer.
- One order can contain multiple products.
- Every product belongs to only one product category.
- All product prices are recorded accurately at the time of purchase.

### <u>Sales Assumptions</u>

- Revenue is calculated as **Quantity × Unit Price**.
- Only completed and successfully paid orders are included in revenue analysis.
- Cancelled, returned, and refunded orders are excluded from all sales KPIs.
- All transactions are recorded in the same currency.

### <u>Customer Assumptions</u>

- Customers are uniquely identified using their Customer ID.
- Repeat customers are identified based on multiple completed purchases.
- Customer spending is calculated using completed orders only.

### <u>Product Assumptions</u>

- Product categories remain consistent throughout the analysis period.
- Product performance is evaluated using sales quantity and revenue.
- Frequently purchased together analysis is based on products appearing within the same completed order.

### <u>Payment Assumptions</u>

- Every completed order has one successful payment record.
- Payment methods are correctly recorded for every transaction.
- Failed payment transactions are excluded from revenue calculations but may be included when analyzing payment success rates.

### <u>Time Assumptions</u>

- Order Date is considered the official transaction date.
- Monthly, quarterly, and yearly analyses are based on the Order Date.
- Seasonal trends are identified using historical sales data available in the dataset.

---

## 6. Expected Deliverables

At the end of this project, the Data Analytics team is expected to deliver the following outputs:

### <u>Business Reports</u>

- Monthly sales performance report.
- Customer behavior analysis report.
- Product performance analysis report.
- Payment method analysis report.
- Key Performance Indicator (KPI) summary report.

### <u>SQL Analysis</u>

- Well-structured SQL queries addressing all defined business questions.
- Advanced SQL analysis using Joins, Common Table Expressions (CTEs), Window Functions, Aggregate Functions, and Ranking Functions.
- Reusable SQL scripts for business reporting and future analysis.

### <u>Business Insights</u>

- Identification of high-performing and underperforming products.
- Identification of high-value and repeat customers.
- Revenue trends and seasonal sales patterns.
- Product category performance analysis.
- Customer purchasing behavior insights.
- Payment behavior and payment method preferences.

### <u>Business Recommendations</u>

- Recommendations to improve revenue growth.
- Inventory optimization strategies.
- Customer retention and loyalty recommendations.
- Cross-selling and product bundling opportunities.
- Marketing campaign recommendations based on seasonal demand.
- Product portfolio optimization recommendations.

### <u>Dashboard & Visualization</u>

- Interactive Power BI dashboard.
- KPI monitoring dashboard.
- Sales trend visualizations.
- Customer and product performance dashboards.
- Executive summary dashboard for stakeholders.

### <u>Project Documentation</u>

- Business Requirements Document (BRD).
- Database Schema Documentation.
- Entity Relationship Diagram (ERD).
- Data Dictionary.
- SQL Query Documentation.
- Project README with setup instructions and project overview.

---