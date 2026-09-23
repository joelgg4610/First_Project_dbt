select
    payment_id,
    count(payment_created) as created_total_amount,
    count(_batched_at) as _batched_at_total_amount
from {{ ref('stg_stripe__payment') }}

where payment_created > current_date() or _batched_at > current_date()
group by 1;