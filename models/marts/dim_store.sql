SELECT DISTINCT
    store_id
FROM {{ ref('stg_acme_data') }}