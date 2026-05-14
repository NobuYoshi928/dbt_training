select
from {{ ref('test1') }}
where product_id is null
