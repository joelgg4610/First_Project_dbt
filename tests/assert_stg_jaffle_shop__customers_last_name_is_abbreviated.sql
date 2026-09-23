select
    customer_id,
    count(customer_last_name) as not_abbreviated_total_amount
from  {{ ref('stg_jaffle_shop__customers') }}

where customer_last_name not regexp('^[A-Z]\.$')
group by 1;