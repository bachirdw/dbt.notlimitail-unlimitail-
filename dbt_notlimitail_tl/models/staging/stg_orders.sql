with source as (

    select * from {{ source('thelook_ecommerce', 'orders') }}

),

renamed as (

    select
        -- Clés
        order_id,
        user_id,

        -- Informations sur la commande
        status as order_status,
        
        -- Horodatages (on s'assure qu'ils sont bien de type TIMESTAMP)
        cast(created_at as timestamp) as order_created_at,
        cast(returned_at as timestamp) as order_returned_at,
        cast(shipped_at as timestamp) as order_shipped_at,
        cast(delivered_at as timestamp) as order_delivered_at,
        
        -- Mesure
        num_of_item as num_items_in_order

    from source

)

select * from renamed