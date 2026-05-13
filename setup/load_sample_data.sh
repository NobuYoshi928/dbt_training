#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "Recreating raw tables..."
docker-compose exec -T postgres psql -U dbt_user -d dbt_training < "$SCRIPT_DIR/setup_raw_tables.sql"

echo "Loading amazon_orders_details..."
cat "$SCRIPT_DIR/sample_data/amazon_orders_details.csv" | docker-compose exec -T postgres psql -U dbt_user -d dbt_training -c "COPY raw.amazon_orders_details FROM STDIN WITH (FORMAT csv, HEADER true)"

echo "Loading rakuten_orders_items..."
cat "$SCRIPT_DIR/sample_data/rakuten_orders_items.csv" | docker-compose exec -T postgres psql -U dbt_user -d dbt_training -c "COPY raw.rakuten_orders_items FROM STDIN WITH (FORMAT csv, HEADER true)"

echo "Loading product_master..."
cat "$SCRIPT_DIR/sample_data/product_master.csv" | docker-compose exec -T postgres psql -U dbt_user -d dbt_training -c "COPY raw.product_master FROM STDIN WITH (FORMAT csv, HEADER true)"

echo "Done: sample data loaded."
