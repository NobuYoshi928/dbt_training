{#
  カラムの値が 0 以上であることを検証する generic test。
  負の値（< 0）が存在する行を失敗として返す。
#}
{% test not_negative(model, column_name) %}

select *
from {{ model }}
where {{ column_name }} < 0

{% endtest %}
