# Global-Electronics-Retail

## Project Background

Global Electronics Retailer is a global company that sells electronic products
worldwide via its stores.

The company has significant amounts of data on its sales in stores and products.
This project analyzes and this data in order to uncover critical insights that will improve 
Gloval Electronics Retailer's commerical success.

Insights and recommendations are provided on the following key areas:

 - Sales Trend Analysis: Evaluation of historical sales patterns, both globally and by country, focusing on Revenur, Profit, Order Volume.
 - Product Level Performance: An analysis of Global Electronics Retailer's various product lines, understanding their impact on sales.
 - Customer Analysis : Understanding the target Customer group and some informations about the companies's customers
 - Store Performance Analysis: Understanding which regions's stores has higher sales.

An Interective Tableau Dashboard can be found [here.](https://public.tableau.com/app/profile/mustafa.zkul/viz/GlobalELectronics/SalesDashboard)

The SQL queries utilized to crate data model and solving business questions can be found [here.](https://github.com/mustafaozzkul/Global-Electronics-Retail/blob/main/SQL.sql)

The python utilized to clean, organize and prepare data for the dashboard can be found [here.](https://github.com/mustafaozzkul/Global-Electronics-Retail/blob/main/Global_electronics.ipynb)

# Data Structure & Initial Checks

Global Electronics Retailer's database structure as seen bellow cinsists of five table:
customers, exchange_rate, products,stores and sales with total row count of 91.949 records.
![image](https://github.com/mustafaozzkul/Global-Electronics-Retail/blob/main/Data%20Model.png?raw=true)


# Executive Summary
## Overview of Findings

Key performance indicators have all shown that total sales ,total orders and total profits after april stay lower over the last year. Total sales, total orders and total profit all have shown dramatically decrease over year over, total sales by 49.1 %, total order by 49.0 % and total profit by 49.1 %. These decreses have may happened because of the Covid-19 pandemic in 2020.

## Sales Trends:
 - USA is the country that makes the most of the profit and Canada is 2nd highest profit in the year of 2020.

 - In 2020, computers are the only category that exceed the avg profit by categories, cameras and cell phones has average profit than other categories except computers.

Bellow is the Sales page from the Tableau dashboard and more examples are included throughout the report.
![image](https://github.com/mustafaozzkul/Global-Electronics-Retail/blob/main/Sales%20Dashboard.png?raw=true)

## Customer Analysis :

- 44.7% of Global Electronics retail company's customers are from the USA, making up the majority of its customer base.
- The gender distribution is quite balanced, with 50.7% male and 49.3% female customers.
- Matthew Flemming is the customer who generates the most profit for the company.

![Customer](https://github.com/mustafaozzkul/Global-Electronics-Retail/blob/main/Customer%20Dashboard.png?raw=true)

## Product Level Performance : 

 - Northwind Traders is the most expensive brand with an average cost of $353, followed by Fabrikam at $248.
 - While their costs are quite high, these two brands have almost the lowest order numbers.
 - Contoso has the highest average order numbers, followed by Soutridge Video.
 - Home Appliances stands as the most profitable category.

![Product](https://github.com/mustafaozzkul/Global-Electronics-Retail/blob/main/Product%20Analysis.png?raw=true)

## Store Performance:

 - After peaking in 2012, store openings have been decreasing significantly and have remained low.
 - There have been no new stores for 3 years.
 - Nearly 94 percent of the stores had been opened before 2018.
 - Store size has no positive correlation with generating profit; small-sized stores had higher average profits.

 ![Stores](https://github.com/mustafaozzkul/Global-Electronics-Retail/blob/main/Store%20Analysis.png?raw=true)

 # Recommendations:

 Based on the uncovered insights, the following recommendations have been provided:

 - Contoso and Wide World Importers have relatively low average costs compared to other brands, and they also have higher sales order numbers. The Global Technology Retail may consider reshaping its inventory based on these low-cost, high-order brands.
 - Global Technology Retail could start a campaign targeting top profit-generating customers, which may help the company maintain their loyalty.
 - With the average customer age being relatively high, the company should consider designing its products for an older demographic.
 - With the pandemic, all KPIs show a decrease. The company may consider creating an IT team to start selling on websites, not just in stores.




