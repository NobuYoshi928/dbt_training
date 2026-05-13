-- スキーマを作成
CREATE SCHEMA IF NOT EXISTS raw;

-- Amazon Orders テーブル作成とINSERT
DROP TABLE IF EXISTS raw.amazon_orders_details CASCADE;
CREATE TABLE raw.amazon_orders_details (
    amazon_order_id VARCHAR(20),
    order_datetime_utc TIMESTAMP,
    buyer_email VARCHAR(256),
    sku VARCHAR(50),
    product_name VARCHAR(256),
    qty INTEGER,
    item_price_jpy NUMERIC(10,0),
    payment_method VARCHAR(50),
    fulfillment_channel VARCHAR(10),
    prefecture VARCHAR(20),
    ship_postal_code VARCHAR(20),
    order_status VARCHAR(50),
    last_updated_at TIMESTAMP
);

-- Rakuten Orders テーブル作成とINSERT
DROP TABLE IF EXISTS raw.rakuten_orders_items CASCADE;
CREATE TABLE raw.rakuten_orders_items (
    rakuten_order_no VARCHAR(20),
    order_date_jst VARCHAR(30),
    member_id VARCHAR(20),
    item_code VARCHAR(50),
    item_title VARCHAR(256),
    unit_price VARCHAR(20),
    quantity_text VARCHAR(10),
    shipping_cost VARCHAR(20),
    coupon_points_used VARCHAR(20),
    payment_type VARCHAR(50),
    delivery_type VARCHAR(50),
    prefecture VARCHAR(20),
    address_zip VARCHAR(20),
    order_state VARCHAR(50),
    settlement_amount VARCHAR(50),
    updated_on VARCHAR(30),
    email VARCHAR(256)
);


-- Product Master テーブル作成とINSERT
DROP TABLE IF EXISTS raw.product_master CASCADE;
CREATE TABLE raw.product_master (
    product_id VARCHAR(20),
    product_name VARCHAR(256),
    category VARCHAR(50),
    amazon_sku VARCHAR(50),
    rakuten_item_code VARCHAR(50)
);


