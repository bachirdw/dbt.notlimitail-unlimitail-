with source as (

    select * from {{ source('thelook_ecommerce', 'order_items') }}

),

renamed as (

    select
        -- Clés
        id as order_item_id,
        order_id,
        user_id,
        product_id,
        inventory_item_id,

        -- Informations sur le statut
        status as item_status,

        -- Horodatages
        cast(created_at as timestamp) as item_created_at,
        cast(shipped_at as timestamp) as item_shipped_at,
        cast(delivered_at as timestamp) as item_delivered_at,
        cast(returned_at as timestamp) as item_returned_at,

        -- Mesures financières
        sale_price as item_sale_price

    from source

)

select * from renamed