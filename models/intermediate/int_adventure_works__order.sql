with
    order_info as (
        select *
        from {{ ref('stg_adventure_works__salesorderheader') }}
    )

    , order_detail_info as (
        select 
            *
            , order_qty * unit_price as product_gross_sales
            , order_qty * unit_price - (1 - unit_price_discount) as product_net_sales
        from {{ ref('stg_adventure_works__salesorderdetail') }}
    )

    , joining as (
        select
            order_info.sales_order_id
            , order_detail_info.sales_order_detail_id 
            , order_info.customer_id
            , order_info.sales_person_id
            , order_info.territory_id
            , order_info.bill_to_address_id
            , order_info.ship_to_address_id
            , order_info.ship_method_id
            , order_info.credit_card_id
            , order_info.currency_rate_id
            , order_info.order_date
            , order_info.due_date
            , order_info.ship_date
            , case 
                when order_info.status = 1 then 'In process'
                when order_info.status = 2 then 'Approved'
                when order_info.status = 3 then 'Backordered'
                when order_info.status = 4 then 'Rejected'
                when order_info.status = 5 then 'Shipped'
                when order_info.status = 6 then 'Canceled'
            end as order_status
            , order_info.credit_card_approval_code 
            , order_info.subtotal
            , order_info.taxamt
            , order_info.freight
            , order_info.total_due
            , order_info.comment
            , order_detail_info.carrier_tracking_number
            , order_detail_info.order_qty
            , order_detail_info.product_id
            , order_detail_info.special_offer_id
            , order_detail_info.unit_price
            , order_detail_info.unit_price_discount
            , order_detail_info.product_gross_sales
            , order_detail_info.product_net_sales
        from order_info
        left join order_detail_info
            on order_detail_info.sales_order_id = order_info.sales_order_id
    )

select * from joining