with 

source as (

    select * from {{ source('adventure_works', 'store') }}

),

renamed as (

    select
        businessentityid as store_id
        , name as store_name
        , salespersonid as salesperson_id
        , demographics
        , rowguid as row_guid
        , modifieddate as modified_date

    from source

)

select * from renamed
