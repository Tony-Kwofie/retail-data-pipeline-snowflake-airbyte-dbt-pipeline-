{{ config(schema='GOLD', materialized='table') }}

SELECT DISTINCT
    STORE_ID
FROM {{ ref('stg_acme') }}