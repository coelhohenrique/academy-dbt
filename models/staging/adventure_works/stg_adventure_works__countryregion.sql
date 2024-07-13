with 

source as (

    select * from {{ source('adventure_works', 'countryregion') }}

),

renamed as (

    select
        countryregioncode as country_region_code
        , name
        , modifieddate as modified_date

    from source

)

select * from renamed
