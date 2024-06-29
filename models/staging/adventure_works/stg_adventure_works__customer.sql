with 

source as (

    select * from {{ source('adventure_works', 'customer') }}

),

renamed as (

    select
        customerid as customer_id
        , personid as person_id
        , storeid as store_id
        , territoryid as territory_id
        , rowguid as row_guid
        , modifieddate as modified_date

    from source

)

select * from renamed
