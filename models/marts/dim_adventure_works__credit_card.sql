with
    credit_card_info as (
        select
            {{ dbt_utils.generate_surrogate_key(['credit_card_id']) }} as credit_card_sk
            , credit_card_id
            , card_type
            , card_number
            , exp_month
            , exp_year
        from {{ ref('stg_adventure_works__creditcard') }}
    )

select * from credit_card_info