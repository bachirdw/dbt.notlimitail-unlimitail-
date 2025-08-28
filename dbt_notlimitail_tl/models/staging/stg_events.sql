with source as (
    select * from {{ source('thelook_ecommerce', 'events') }}
),
renamed as (
    select
        -- Clés
        id as event_id,
        user_id,
        sequence_number,

        -- Informations sur l'événement
        session_id,
        event_type,
        
        -- Horodatage
        created_at as event_created_at,
        
        -- Détails de l'événement
        uri as event_uri,
        ip_address,
        city,
        state,
        traffic_source

    from source
)
select * from renamed