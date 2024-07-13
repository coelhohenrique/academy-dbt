with
    person_info as (
        select *
        from {{ ref('stg_adventure_works__person') }}
    )

    , customer_info as (
        select *
        from {{ ref('stg_adventure_works__customer') }}
    )

    , customer_person_info as (
        select
            {{ dbt_utils.generate_surrogate_key(['customer_id']) }} as customer_sk
            , person_info.business_entity_id
            , customer_info.customer_id
            , customer_info.store_id
            , person_type
            , name_style
            , title
            , first_name
            , middle_name
            , last_name
            , suffix
            , email_promotion
            , additional_contact_info
            , demographics
        from customer_info
        left join person_info
            on customer_info.person_id = person_info.business_entity_id
    )

select * from customer_person_info
