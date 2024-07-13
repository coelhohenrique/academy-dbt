with
    order_header_sales_reason_info as (
        select *
        from {{ ref('stg_adventure_works__salesorderheadersalesreason') }}
    )

    , sales_reason_info as (
        select *
        from {{ ref('stg_adventure_works__salesreason') }}
    )

    , sales_reason_model as (
        select
            order_header_sales_reason_info.sales_order_id
            , sales_reason_info.sales_reason_id
            , sales_reason_info.sales_reason_type
        from order_header_sales_reason_info
        left join sales_reason_info
            on order_header_sales_reason_info.sales_reason_id = sales_reason_info.sales_reason_id 
    )

    , dedup_sales_reason_model as (
        select
            sales_order_id
            , max(case
                when sales_reason_type ilike '%Marketing%' then true
                else false
            end) as is_marketing_reason_type
            , max(case
                when sales_reason_type ilike '%Promotion%' then true
                else false
            end) as is_promotion_reason_type
            , max(case
                when sales_reason_type ilike '%Other%' then true
                else false
            end) as is_other_reason_type
        from sales_reason_model
        group by sales_order_id
    )

    , generating_surrogate_key as (
        select
            {{ dbt_utils.generate_surrogate_key(['sales_order_id']) }} as sales_order_sk
            , *
        from dedup_sales_reason_model
    )

select * from generating_surrogate_key
