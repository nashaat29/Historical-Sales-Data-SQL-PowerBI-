# Sales Data Analysis Project: SQL Data Transformation and Power BI Visualization

![Cover](https://github.com/nashaat29/Historical-Sales-Data-SQL-PowerBI-/assets/138555343/510a6dde-2131-4d81-9abb-6a62d5d34c49)

Welcome to the Sales Data Analysis Project! This repository showcases a comprehensive data analysis endeavor utilizing SQL for data transformation and Power BI for visualization. The primary dataset used is sourced from Kaggle, containing three CSV files:

- [store_data.csv](https://www.kaggle.com/datasets/tforsyth/4-year-historical-sales-data?select=store_data.csv)
- [master_product.csv](https://www.kaggle.com/datasets/tforsyth/4-year-historical-sales-data?select=master_product.csv)
- [master_customer.csv](https://www.kaggle.com/datasets/tforsyth/4-year-historical-sales-data?select=master_customer.csv)

## Data Transformation using SQL

![SQL Query](https://github.com/nashaat29/Historical-Sales-Data-SQL-PowerBI-/assets/138555343/4b6155a3-455f-4be8-aa5c-3b061bcb9a44)

The SQL queries and transformations performed on the dataset can be summarized as follows:

### Master Product Transformation

1. Displayed a sample of master_product.
2. Checked for duplicates (no duplicates found).
3. Checked for NULL values in Product_ID and Product_Name columns.

### Master Customer Transformation

1. Displayed a sample of master_customer.
2. Checked for duplicates (no duplicates found).
3. Checked for NULL values in Customer_ID, Customer_Name, and Postal_Code columns.
4. Created an Age_segment column using the CASE statement.
5. Populated the Age_segment column based on Age ranges.

### Store Data Transformation

1. Displayed a sample of store_data.
2. Checked for duplicates (no duplicates found).
3. Checked for NULL values in crucial columns.
4. Calculated and updated NULL Sales values with the average Sales.
5. Calculated Sales after applying discounts.
6. Joined the store_data table with master_product and master_customer tables for final analysis.

### JOIN and Optimization

Joined the store_data table with master_product and master_customer tables to select relevant columns for analysis.

### Export Clean Data from SQL Server direct into PowerBI

![SQL Export](https://github.com/nashaat29/Historical-Sales-Data-SQL-PowerBI-/assets/138555343/33d6cca5-ffc5-4e21-b96c-0e343ce2a984)

## Power BI Visualizations

![Dashboard_SS](https://github.com/nashaat29/Historical-Sales-Data-SQL-PowerBI-/assets/138555343/8ec1fc70-1c7d-4395-bd47-39edfa168f04)

The Power BI visualization dashboards were designed to provide insights into the sales data transformation. The following key visualizations were created:

- Sales by Category
- Sales by Segment
- Sales by Quarter
- Days to Ship by Ship Mode
- Sales Distribution by State and City

## Findings and Insights

1. Segments Analysis: The consumer and corporate segments are prominent, while the home office segment lags behind. Special offers or discounts targeted at the home office segment could improve sales.
2. Customer Age: A substantial portion of customers fall into the middle-aged category, suggesting a key demographic for marketing and sales efforts.
3. Product Category Impact: Despite having the highest number of products, the office supplies category yields the lowest sales when compared to technology and furniture categories.
4. Seasonal Sales: The last quarter records the highest sales, indicating a seasonal trend. Strategies to boost sales in the initial quarters could help balance this trend.
5. Regional Insights: California and New York emerge as leading sales states. Further analysis can be done by diving into cities within these states.
6. Efficiency Enhancement: Approximately four days are spent on order-to-ship processing. Reducing this duration could improve customer satisfaction and overall efficiency.
7. Shipping Preference: Standard class is the preferred shipping method. This insight could inform logistics optimization efforts.

## Conclusion

This project exemplifies the use of SQL for ETL and data transformation, alongside Power BI for insightful visualizations. The sales analysis offers valuable business insights and strategies for improving sales, enhancing customer satisfaction, and optimizing operations. The primary motivation behind this project was to hone SQL skills and showcase its data transformation capabilities.

Future work could involve incorporating additional datasets for more comprehensive analysis. One possible addition could be demographic data, such as income levels and education, to better understand customer behavior. Additionally, machine learning models could be implemented to predict future sales trends and identify potential growth opportunities.
