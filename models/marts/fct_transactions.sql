SELECT
    transaction_id,
    store_id,
    product_id,
    customer_id,
    quantity,
    unit_price,
    total_amount,
    payment_method,
    transaction_timestamp
FROM {{ ref('stg_acme_data') }}