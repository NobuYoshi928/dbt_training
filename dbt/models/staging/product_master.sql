SELECT
    product_id,
    product_name,
    category,
    amazon_sku,
    rakuten_item_code
FROM {{ source('raw', 'product_master') }}
