# Customer Behavior Analysis using Google Bigquery
Understanding customer behavior will help me make predictions about what will happen next and adjust strategies - from products to sales and marketing - to reflect my customers' behavior patterns better. When I provide a customer experience that meets customer needs, I'll be more likely to drive sales.
> **Note:** If you want to see the original data set click [here](https://console.cloud.google.com/bigquery?ws=!1m4!1m3!3m2!1sbigquery-public-data!2sthelook_ecommerce)

## Table of Contents
* Overview Dataset
* Problem
* Insight
## Overview Dataset
The dataset contains information about customers, products, orders, logistics, web events, and digital marketing campaigns. The contents of this dataset are synthetic and are provided to industry practitioners for the purpose of product discovery, testing, and evaluation.
## Problem
1. How many users completed orders and what is the total number of orders per month.
2. What is the average order value and how many unique users placed orders each month.
3. Can you find the first and last names of the youngest and oldest users for each gender.
4. What are the top 5 most profitable products, and what is the profit breakdown for each product by month.
5. How much total revenue was generated in each product category in the past 3 months, up to September 14, 2023, broken down by date.
6. What is the monthly growth rate in the number of completed orders (TPO) and total revenue (TPV) for each product category, ordered by time in descending order.
## Insight
1. This graph shows the increasing trend of the total number of users and orders per month. From the data, we can see that:
    - The number of users and orders continues to increase every month.
    - There are some months with significant increases, such as from December 2022 to January 2023.
    - In the last month (September 2023), there was a decrease compared to the previous month.

<p align="center">
  <img width="738" src="https://github.com/user-attachments/assets/fd19a1b3-3d0e-4027-b9b8-3044e46ca0f1">
</p>

2. Average Order Value (AOV) for Each Month.

Here is the average order value for each month from 2019 to 2023:

| Year | Month | AOV |
| :-----------------: | :-----------------: | :-------------------: | 
|2019| 1  | 62.99 |
|2019| 2  | 106.61 |
|2019| 3  | 82.64 |
|2019| 4  | 77.76 |
|...| ...  | ... |

Here is the number of unique users who placed orders each month from 2019 to 2023:

| Year | Month | AOV |
| :-----------------: | :-----------------: | :-------------------: | 
|2019| 1  | 1 |
|2019| 2  | 8 |
|2019| 3  | 17 |
|2019| 4  | 14 |
|...| ... | ... |
