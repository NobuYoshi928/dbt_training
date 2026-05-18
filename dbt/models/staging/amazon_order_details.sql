SELECT
    amazon_order_id,
    -- UTC を JST に変換 (+09:00)
    (order_datetime_utc AT TIME ZONE 'UTC' AT TIME ZONE 'Asia/Tokyo')::timestamp AS ordered_at,
    -- PII対応: メールアドレスをハッシュ化
    md5(buyer_email) AS buyer_email_hash,
    sku,
    product_name,
    qty,
    item_price_jpy,
    payment_method,
    fulfillment_channel,
    prefecture,
    ship_postal_code,
    order_status,
    last_updated_at
FROM {{ source('raw', 'amazon_orders_details') }}
