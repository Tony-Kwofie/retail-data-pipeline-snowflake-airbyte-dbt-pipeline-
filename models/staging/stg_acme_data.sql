SELECT
    TRANSACTION_ID AS transaction_id,
    STORE_ID AS store_id,
    PRODUCT_ID AS product_id,
    CUSTOMER_ID AS customer_id,
    PRODUCT_NAME AS product_name,
    CATEGORY AS category,
    QUANTITY AS quantity,
    UNIT_PRICE AS unit_price,
    TOTAL_AMOUNT AS total_amount,
    PAYMENT_METHOD AS payment_method,
    TRANSACTION_TIMESTAMP AS transaction_timestamp
FROM AIRBYTE_DATABASE.PUBLIC.ACME_DATA