with
    order_info as (
        select *
        from {{ ref('int_adventure_works__order') }}
    )

    , sales_reason_info as (
        select *
        from {{ ref('int_adventure_works__sales_reason') }}
    )

    , address_info as (
        select
            address_sk
            , address_id
        from {{ ref('dim_adventure_works__address') }}
    )

    , credit_card_info as (
        select
            credit_card_sk
            , credit_card_id
        from {{ ref('dim_adventure_works__credit_card') }}
    )

    , customer_info as (
        select
            customer_sk
            , customer_id
        from {{ ref('dim_adventure_works__customer') }}
    )

    , product_info as (
        select
            product_sk
            , product_id
        from {{ ref('dim_adventure_works__product') }}
    )

    , reporting_table as (
        select
            order_info.sales_order_id
            , customer_info.customer_sk as customer_fk -- Join key to customer_info
            , address_info.address_sk as address_fk -- Join key to address_info
            , credit_card_info.credit_card_sk as credit_card_fk -- Join key to credit_card_info
            , product_info.product_sk as product_fk-- Join key to product_info
            , order_info.order_date
            , order_info.due_date
            , order_info.ship_date
            , order_info.order_status
            , order_info.credit_card_approval_code 
            , order_info.carrier_tracking_number
            , order_info.order_qty
            , order_info.unit_price
            , order_info.unit_price_discount
            , order_info.product_gross_sales
            , order_info.product_net_sales
            , coalesce(sales_reason_info.is_marketing_reason_type, false)
            , coalesce(sales_reason_info.is_promotion_reason_type, false)
            , coalesce(sales_reason_info.is_other_reason_type, false)
        from order_info
        left join sales_reason_info
            on order_info.sales_order_id = sales_reason_info.sales_order_id
        left join address_info
            on order_info.bill_to_address_id = address_info.address_id
        left join credit_card_info
            on order_info.credit_card_id = credit_card_info.credit_card_id
        left join customer_info
            on order_info.customer_id = customer_info.customer_id
        left join product_info
            on order_info.product_id = product_info.product_id
    )

select * from reporting_table