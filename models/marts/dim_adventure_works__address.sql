with
    address_info as (
        select * 
        from {{ ref('stg_adventure_works__address') }}
    )

    , state_info as (
        select * 
        from {{ ref('stg_adventure_works__stateprovince') }}
    )

    , country_info as (
        select * 
        from {{ ref('stg_adventure_works__countryregion') }}
    )

    , unioned_address as (
        select
            {{ dbt_utils.generate_surrogate_key(['address_info.address_id']) }} as address_sk
            , address_info.address_id
            , address_info.address_line_1
            , address_info.address_line_2
            , address_info.city as city_name
            , address_info.state_province_id
            , address_info.postal_code
            , address_info.spatial_location
            , state_info.state_province_code
            , state_info.country_region_code
            , state_info.is_only_state_province_flag
            , state_info.name as state_name
            , state_info.territory_id
            , country_info.name as country_name
        from address_info
        left join state_info
            on address_info.state_province_id = state_info.state_province_id
        left join country_info 
            on state_info.country_region_code = country_info.country_region_code
    )

select * from unioned_address
