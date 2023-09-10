/* QUESTION 3 */
WITH
female_youngest_oldest AS
(
SELECT
  'Female' AS gender,
  CASE age
    WHEN (SELECT MIN(age) FROM `bigquery-public-data.thelook_ecommerce.users` WHERE gender = 'F') THEN age
    ELSE NULL
  END AS youngest_age,
  CASE age
    WHEN (SELECT MAX(age) FROM `bigquery-public-data.thelook_ecommerce.users` WHERE gender = 'F') THEN age
    ELSE NULL
  END AS oldest_age,
  first_name,
  last_name
FROM `bigquery-public-data.thelook_ecommerce.users`
WHERE
  gender = 'F' AND
  (age = (SELECT MIN(age) FROM `bigquery-public-data.thelook_ecommerce.users`) OR
  age = (SELECT MAX(age) FROM `bigquery-public-data.thelook_ecommerce.users`))
),
male_youngest_oldest AS
(
SELECT
  'Male' AS gender,
  CASE age
    WHEN (SELECT MIN(age) FROM `bigquery-public-data.thelook_ecommerce.users` WHERE gender = 'M') THEN age
    ELSE NULL
  END AS youngest_age,
  CASE age
    WHEN (SELECT MAX(age) FROM `bigquery-public-data.thelook_ecommerce.users` WHERE gender = 'M') THEN age
    ELSE NULL
  END AS oldest_age,
  first_name,
  last_name
FROM `bigquery-public-data.thelook_ecommerce.users`
WHERE
  gender = 'M' AND
  (age = (SELECT MIN(age) FROM `bigquery-public-data.thelook_ecommerce.users`) OR
  age = (SELECT MAX(age) FROM `bigquery-public-data.thelook_ecommerce.users`))
)

SELECT * FROM female_youngest_oldest
UNION DISTINCT
SELECT * FROM male_youngest_oldest