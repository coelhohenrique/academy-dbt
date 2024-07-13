with 

source as (

    select * from {{ source('adventure_works', 'salesorderheader') }}

),

renamed as (

    select
        salesorderid as sales_order_id 
        , revisionnumber as revision_number 
        , cast(orderdate as date) as order_date
        , cast(duedate as date) as due_date
        , cast(shipdate as date) as ship_date
        , status
        , onlineorderflag as online_order_flag
        , purchaseordernumber as purchase_order_number 
        , accountnumber as account_number
        , customerid as customer_id
        , salespersonid as sales_person_id
        , territoryid as territory_id
        , billtoaddressid as bill_to_address_id
        , shiptoaddressid as ship_to_address_id
        , shipmethodid as ship_method_id
        , creditcardid as credit_card_id
        , creditcardapprovalcode as credit_card_approval_code 
        , currencyrateid as currency_rate_id
        , subtotal
        , taxamt
        , freight
        , totaldue as total_due
        , comment
        , rowguid
        , modifieddate as modified_date

    from source

)

select * from renamed
