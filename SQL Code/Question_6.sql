/* QUESTION 6 */
-- Find monthly growth of TPO (# of completed orders), and TPV (# of revenue) in percentage breakdown by product categories, ordered by tim desc.
--- Time Frime: January 2019 until September 2023


WITH revenue_per_category AS
(
  SELECT
    EXTRACT(YEAR FROM oi.created_at) AS year,
    EXTRACT(MONTH FROM oi.created_at) AS month,
    FORMAT_DATE('%B, %Y', oi.created_at) AS month_name,
    p.category AS category,
    COUNT(DISTINCT oi.order_id) AS total_orders,
    SUM(oi.sale_price) AS revenue
  FROM `bigquery-public-data.thelook_ecommerce.order_items` oi
  LEFT JOIN `bigquery-public-data.thelook_ecommerce.products` p ON oi.product_id = p.id
  WHERE
    oi.status = 'Complete' AND
    DATE(created_at) BETWEEN '2019-01-01' AND '2023-09-14'
  GROUP BY 1,2,3,4
  ORDER BY 4,1 DESC,2 DESC
)

SELECT
  *,
  ROUND((total_orders-LEAD(total_orders) OVER(PARTITION BY category ORDER BY year DESC, month DESC))
  /LEAD(total_orders) OVER(PARTITION BY category ORDER BY year DESC, month DESC)*100,2)||'%' AS order_growth,
  ROUND((revenue-LEAD(revenue) OVER(PARTITION BY category ORDER BY year DESC, month DESC))
  /LEAD(revenue) OVER(PARTITION BY category ORDER BY year DESC, month DESC)*100,2)||'%' AS revenue_growth
FROM revenue_per_category
ORDER BY 4,1 DESC,2 DESC