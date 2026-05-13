# sample_data ディレクトリについて

このディレクトリには、EC注文データ統合トレーニング用のサンプルCSVを配置しています。

## ファイル一覧

- amazon_orders_details.csv
	- Amazonの注文明細データ（1行=注文明細）
- rakuten_orders_items.csv
	- 楽天の注文明細データ（1行=注文明細）
- product_master.csv
	- Amazon SKU と Rakuten item_code をつなぐ共通商品マスタ

## 各CSVのカラム

### amazon_orders_details.csv

- amazon_order_id: Amazon注文ID
- order_datetime_utc: 注文日時（UTC, ISO8601）
- buyer_email: 購入者メールアドレス
- sku: Amazon SKU
- product_name: 商品名
- qty: 数量
- item_price_jpy: 商品単価（円）
- payment_method: 支払い方法
- fulfillment_channel: 出荷チャネル（FBA/MFN）
- prefecture: 都道府県名
- ship_postal_code: 郵便番号
- order_status: 注文ステータス
- last_updated_at: 最終更新日時

### rakuten_orders_items.csv

- rakuten_order_no: 楽天注文番号
- order_date_jst: 注文日時（JST, YYYY/MM/DD HH:MM）
- member_id: 楽天会員ID
- item_code: 楽天商品コード
- item_title: 商品名
- unit_price: 商品単価（円）
- quantity_text: 数量
- shipping_cost: 送料（円）
- coupon_points_used: クーポン/ポイント使用額（円）
- payment_type: 支払い方法
- delivery_type: 配送方法
- prefecture: 都道府県名
- address_zip: 郵便番号
- order_state: 注文ステータス
- settlement_amount: 決済金額（円）
- updated_on: 最終更新日時
- email: 購入者メールアドレス

### product_master.csv

- product_id: 共通商品ID
- product_name: 商品名
- category: カテゴリ
- amazon_sku: Amazon側の商品コード
- rakuten_item_code: 楽天側の商品コード

## データ設計の意図

- Amazonと楽天で列名・フォーマットを一部変えてあります。
- 両チャネルで同一顧客（同じメール）が注文するケースを含めています。
- 同一注文内に複数商品を含むケースを含めています。

## ロード方法

プロジェクトルートで以下を実行してください。

```bash
bash setup/load_sample_data.sh
```

このスクリプトで raw スキーマのテーブル作成とCSVロードを行います。