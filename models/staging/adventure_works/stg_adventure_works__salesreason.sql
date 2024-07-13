with 

source as (

    select * from {{ source('adventure_works', 'salesreason') }}

),

renamed as (

    select
        salesreasonid as sales_reason_id
        , name as sales_reason_name
        , reasontype as sales_reason_type
        , modifieddate as modified_date

    from source

)

select * from renamed
