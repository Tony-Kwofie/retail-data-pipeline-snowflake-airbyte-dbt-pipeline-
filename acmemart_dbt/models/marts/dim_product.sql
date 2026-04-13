{{ config(schema='GOLD', materialized='table') }}

SELECT DISTINCT
    PRODUCT_ID,
    PRODUCT_NAME,
    CATEGORY
FROM {{ ref('stg_acme') }}