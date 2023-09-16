/* QUESTION 4 */
-- Get the top 5 most profitable product and its profit detail breakdown by month.


WITH product_rank_permonth AS
(
  SELECT
    *,
    RANK() OVER(PARTITION BY month_year ORDER BY profit DESC) AS rank_permonth
  FROM
  (
    SELECT
      EXTRACT(YEAR FROM oi.created_at) AS year,
      EXTRACT(MONTH FROM oi.created_at) AS month,
      FORMAT_DATE('%B, %Y', oi.created_at) AS month_year,
      oi.product_id,
      p.name AS product_name,
      ROUND(SUM(oi.sale_price),2) AS sales,
      ROUND(SUM(p.cost),2) AS cost,
      ROUND(SUM(oi.sale_price-p.cost),2) AS profit
    FROM `bigquery-public-data.thelook_ecommerce.order_items` oi
    LEFT JOIN `bigquery-public-data.thelook_ecommerce.products` p ON oi.product_id = p.id
    WHERE
      oi.status = 'Complete'
    GROUP BY 1,2,3,4,5
  )
  ORDER BY 1,2
)
SELECT *
FROM product_rank_permonth
WHERE rank_permonth <= 5
