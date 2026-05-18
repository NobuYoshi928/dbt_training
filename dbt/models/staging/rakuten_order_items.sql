SELECT
    rakuten_order_no,
    -- YYYY/MM/DD HH:MM 形式を TIMESTAMP に変換（既に JST）
    TO_TIMESTAMP(order_date_jst, 'YYYY/MM/DD HH24:MI')::date AS ordered_at,
    member_id,
    item_code,
    item_title,
    -- 数値カラムの変換: カンマ区切り文字列 → NUMERIC
    CAST(REPLACE(unit_price, ',', '') AS NUMERIC(10, 0)) AS unit_price,
    CAST(NULLIF(REGEXP_REPLACE(quantity_text, '[^0-9]', '', 'g'), '') AS INTEGER) AS quantity,
    CAST(REPLACE(shipping_cost, ',', '') AS NUMERIC(10, 0)) AS shipping_cost,
    CAST(REPLACE(coupon_points_used, ',', '') AS NUMERIC(10, 0)) AS coupon_points_used,
    payment_type,
    delivery_type,
    prefecture,
    address_zip,
    order_state,
    -- settlement_amount: "JPY 5,390" 形式から数値抽出
    CAST(REPLACE(REPLACE(settlement_amount, 'JPY ', ''), ',', '') AS NUMERIC(10, 0)) AS settlement_amount,
    -- updated_on: TIMESTAMP 文字列パース（JST）
    TO_TIMESTAMP(updated_on, 'YYYY/MM/DD HH24:MI')::timestamp AS updated_at,
    -- PII対応: メールアドレスをハッシュ化
    md5(email) AS email_hash
FROM {{ source('raw', 'rakuten_orders_items') }}