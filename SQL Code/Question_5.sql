/* QUESTION 5 */
-- Create a query to get month to date of total revenue in each product categoris of past 3 monts
-- (current date 14 September 2023), breakdown by date.


WITH revenue_per_category AS
(
  SELECT
    DATE(oi.created_at) AS date,
    p.category AS category,
    SUM(oi.sale_price) AS revenue
  FROM `bigquery-public-data.thelook_ecommerce.order_items` oi
  LEFT JOIN `bigquery-public-data.thelook_ecommerce.products` p ON oi.product_id = p.id
  WHERE
    oi.status = 'Complete' AND
    DATE_DIFF('2023-09-14',DATE(oi.created_at),MONTH) < 3 AND
    EXTRACT(DAY FROM oi.created_at) <= EXTRACT(DAY FROM DATE('2023-09-14')) AND
    DATE(oi.created_at) <= '2023-09-14'
  GROUP BY 1,2
  ORDER BY 2,1
)
SELECT
  *,
  SUM(revenue) OVER(PARTITION BY EXTRACT(MONTH FROM date), category ORDER BY date) AS running_total
FROM revenue_per_category
ORDER BY 2,1