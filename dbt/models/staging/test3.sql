{{ config(materialized='incremental') }}


SELECT
    product_id,
    product_name,
    category,
    amazon_sku,
    rakuten_item_code
FROM "raw"."product_master"


{% if is_incremental() %}

	where "product_id" not in (select "product_id" from {{ this }})

{% endif %}
