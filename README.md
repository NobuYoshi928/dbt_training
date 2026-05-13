# dbt Training Project

Docker Compose で Postgres と dbt を動かす学習用プロジェクトです。

## プロジェクト構成

```text
dbt_training/
├── docker-compose.yml
├── bin/
├── postgres/
├── setup/
│   ├── load_sample_data.sh
│   ├── setup_raw_tables.sql
│   └── sample_data/
└── dbt/
    ├── Dockerfile
    ├── requirements.txt
    ├── dbt_project.yml
    ├── profiles.yml
    ├── models/
    ├── seeds/
    ├── macros/
    ├── tests/
    ├── analysis/
    ├── target/
    ├── logs/
    └── dbt_cache/
```

## 起動

```bash
docker-compose up -d
```

## データロード
postgresqlにサンプルテーブルが作成されます。
データの詳細: https://github.com/NobuYoshi928/dbt_training/blob/main/setup/sample_data/README.md

```bash
bash setup/load_sample_data.sh
```

## dbt 実行

dbt コンテナの `working_dir` は `/workspace/dbt` なので、以下でそのまま実行できます。

```bash
docker-compose exec dbt dbt parse
docker-compose exec dbt dbt run
docker-compose exec dbt dbt test
docker-compose exec dbt dbt docs generate
docker-compose exec dbt dbt docs serve --host 0.0.0.0 --port 8080
```

ブラウザ表示:

```text
http://localhost:8080
```

## Postgres 接続

```bash
docker-compose exec postgres psql -U dbt_user -d dbt_training
```

## 便利コマンド

```bash
bash bin/execute_query "\dt raw.*"
bash bin/execute_query "SELECT COUNT(*) FROM raw.amazon_orders_details;"
```

## 停止

```bash
docker-compose down
```

データも消す場合:

```bash
docker-compose down -v
```
