WITH customers AS (
  SELECT
    LIFETIME_SPEND,
    CUSTOMER_TYPE
  FROM {{ ref('customers') }}
), aggregation_1 AS (
  SELECT
    CUSTOMER_TYPE AS CUSTOMER_TYPE,
    SUM(LIFETIME_SPEND) AS sum_LIFETIME_SPEND
  FROM customers
  GROUP BY
    1
)
SELECT
  *
FROM aggregation_1