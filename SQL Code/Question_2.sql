/* QUESTION 2 */
SELECT
  EXTRACT(YEAR FROM created_at) AS year,
  EXTRACT(MONTH FROM created_at) AS month,
  FORMAT_DATE('%B, %Y', created_at) AS month_year,
  ROUND(SUM(sale_price)/COUNT(DISTINCT order_id),2) AS aov,
  COUNT(DISTINCT user_id) AS distinct_users
FROM `bigquery-public-data.thelook_ecommerce.order_items`
WHERE
  status = 'Complete' AND
  DATE(created_at) BETWEEN '2019-01-01' AND '2023-09-14'
GROUP BY 1,2,3
ORDER BY 1,2