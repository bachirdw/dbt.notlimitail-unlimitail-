with source as (
    select * from {{ source('thelook_ecommerce', 'products') }}
),
renamed as (
    select
        -- Clé
        id as product_id,

        -- Informations sur le produit
        name as product_name,
        category as product_category,
        brand as product_brand,
        department as product_department,
        
        -- Mesures financières
        cost as product_cost,
        retail_price as product_retail_price

    from source
)
select * from renamed