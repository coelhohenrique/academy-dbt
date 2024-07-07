with
    order_info as (
        select *
        from {{ ref('int_adventure_works__order') }}
    )

    , address_info as (
        select *
        from {{ ref('dim_adventure_works__address') }}
    )

    , credit_card_info as (
        select *
        from {{ ref('dim_adventure_works__credit_card') }}
    )

    , customer_info as (
        select *
        from {{ ref('dim_adventure_works__customer') }}
    )

    , product_info as (
        select *
        from {{ ref('dim_adventure_works__product') }}
    )

    , sales_reason_info as (
        select *
        from {{ ref('dim_adventure_works__sales_reason') }}
    )

    , reporting_table as (
        select
            sales_reason_info.sales_order_id -- Join key to sales_reason_info
            , customer_info.customer_id -- Join key to customer_info
            , address_info.address_id -- Join key to address_info
            , credit_card_info.credit_card_id -- Join key to credit_card_info
            , product_info.product_id -- Join key to product_info
            , order_info.order_date
            , order_info.due_date
            , order_info.ship_date
            , order_info.status
            , order_info.credit_card_approval_code 
            , order_info.carrier_tracking_number
            , order_info.order_qty
            , order_info.unit_price
            , order_info.unit_price_discount
            , order_info.product_gross_sales
            , order_info.product_net_sales
        from order_info
        left join address_info
            on order_info.bill_to_address_id = address_info.address_id
        left join credit_card_info
            on order_info.credit_card_id = credit_card_info.credit_card_id
        left join customer_info
            on order_info.customer_id = customer_info.customer_id
        left join product_info
            on order_info.product_id = product_info.product_id
        left join sales_reason_info
            on order_info.sales_order_id = sales_reason_info.sales_order_id
    )

select * from reporting_table