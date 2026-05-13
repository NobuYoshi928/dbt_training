SELECT
    product_id,
    product_name,
    category,
    amazon_sku,
    rakuten_item_code
FROM {{ ref('test1') }}
