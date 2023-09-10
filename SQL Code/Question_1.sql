/* QUESTION 1 */
SELECT
  EXTRACT(YEAR FROM created_at) AS year,
  EXTRACT(MONTH FROM created_at) AS month,
  FORMAT_DATE('%B, %Y', created_at) AS month_year,
  COUNT(DISTINCT user_id) AS total_users,
  COUNT(DISTINCT order_id) AS total_orders
FROM `bigquery-public-data.thelook_ecommerce.orders`
WHERE
  status = 'Complete' AND
  DATE(created_at) BETWEEN '2019-01-01' AND '2023-09-14'
GROUP BY 1,2,3
ORDER BY 1,2