
with 

payments as (

    select * from {{ ref('stg_stripe__payments') }}

),

orders as (

    select * from {{ ref('stg_jaffle_shop__orders') }}

),

final as (

    select 
        orders.order_id,
        orders.customer_id,
        payments.payment_amount as amount
    
    from payments

    join orders using (order_id)

)

select * from final;