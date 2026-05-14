SELECT
    *
FROM "raw"."amazon_orders_details"
WHERE payment_method = '{{ var("payment_method", "CreditCard") }}'
