with
    person_info as (
        select *
        from {{ ref('stg_adventure_works__person') }}
    )

    , customer_info as (
        select *
        from {{ ref('stg_adventure_works__customer') }}
    )

    , store_info as (
        select *
        from {{ ref('stg_adventure_works__store') }}
    )

    , customer_person_info as (
        select
            {{ dbt_utils.generate_surrogate_key(['customer_id']) }} as customer_sk
            , person_info.business_entity_id
            , customer_info.customer_id
            , customer_info.store_id
            , person_info.person_type
            , person_info.name_style
            , person_info.title
            , person_info.first_name
            , person_info.middle_name
            , person_info.last_name
            , person_info.suffix
            , person_info.email_promotion
            , person_info.additional_contact_info
            , person_info.demographics
            , store_info.store_name
        from customer_info
        left join person_info
            on customer_info.person_id = person_info.business_entity_id
        left join store_info
            on customer_info.store_id = store_info.store_id
    )

select * from customer_person_info
