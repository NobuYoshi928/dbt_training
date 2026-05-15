{#
    2つのカラムの組み合わせが一意であることを検証する generic test。
    model 内で (column_1, column_2) ごとに件数を集計し、重複（count > 1）がある行を失敗として返す。
#}
{% test unique_composite_key_2(model, column_1, column_2) %}

with duplicated as (

    select
        {{ column_1 }},
        {{ column_2 }},
        count(*) as row_count
    from {{ model }}
    group by
        {{ column_1 }},
        {{ column_2 }}
    having count(*) > 1

)

select *
from duplicated

{% endtest %}
