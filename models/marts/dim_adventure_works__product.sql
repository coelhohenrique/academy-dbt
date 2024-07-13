with
    product_info as (
        select
            {{ dbt_utils.generate_surrogate_key(['product_id']) }} as product_sk
            , product_id
            , product_name
            , product_number
            , make_flag
            , finished_goods_flag
            , product_color
            , product_list_price
            , product_size
            , product_weight
            , sell_start_date
            , sell_end_date
            , discontinued_date
        from {{ ref('stg_adventure_works__product') }}
    )

select * from product_info