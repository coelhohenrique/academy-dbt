with 

source as (

    select * from {{ source('adventure_works', 'product') }}

),

renamed as (

    select
        productid as product_id
        , name as product_name
        , productnumber as product_number
        , makeflag as make_flag
        , finishedgoodsflag as finished_goods_flag
        , color as product_color
        , safetystocklevel as safety_stock_level
        , reorderpoint as reorder_point
        , standardcost as standart_cost
        , listprice as product_list_price
        , size as product_size
        , sizeunitmeasurecode as size_unit_measure_code
        , weightunitmeasurecode as weight_unit_measure_code
        , weight as product_weight
        , daystomanufacture as days_to_manufacture
        , productline as product_line
        , class
        , style
        , productsubcategoryid as product_subcategory_id
        , productmodelid as product_model_id
        , sellstartdate as sell_start_date
        , sellenddate as sell_end_date
        , discontinueddate as discontinued_date
        , rowguid as row_guid
        , modifieddate as modified_date

    from source

)

select * from renamed
