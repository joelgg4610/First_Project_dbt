select
    order_id,
    count(order_date) as total_amount
from {{ ref('stg_jaffle_shop__orders') }}

where order_date > current_date()
group by 1;