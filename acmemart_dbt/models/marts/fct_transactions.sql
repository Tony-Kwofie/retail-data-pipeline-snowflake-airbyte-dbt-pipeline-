{{ config(schema='GOLD', materialized='table') }}

SELECT
    TRANSACTION_ID,
    CUSTOMER_ID,
    PRODUCT_ID,
    STORE_ID,
    QUANTITY,
    UNIT_PRICE,
    TOTAL_AMOUNT,
    TRANSACTION_TIMESTAMP
FROM {{ ref('stg_acme') }}