with
    credit_card_info as (
        select
            credit_card_id
            , card_type
            , card_number
            , exp_month
            , exp_year
        from {{ ref('stg_adventure_works__creditcard') }}
    )

select * from credit_card_info