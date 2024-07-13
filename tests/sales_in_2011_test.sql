with
    sales_in_2011 as (
        select
            cast(sum(product_gross_sales) as numeric(18,2)) as total_gross_sales
        from {{ ref('fct_adventure_works__order') }}
        where order_date between '2011-01-01' and '2011-12-31'
    )

select *
from sales_in_2011
where total_gross_sales <> 12646112.16