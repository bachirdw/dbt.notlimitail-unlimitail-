-- Ce modèle nettoie et prépare la table des utilisateurs.
-- Il renomme les colonnes pour plus de clarté et s'assure que les types de données sont corrects.

with source as (

    -- On utilise la fonction source() pour référencer la table brute 'users'
    -- du jeu de données 'thelook_ecommerce' que nous définirons dans sources.yml
    select * from {{ source('thelook_ecommerce', 'users') }}

),

renamed as (

    select
        -- On renomme les colonnes pour suivre une convention claire et éviter les ambiguïtés.
        id as user_id,
        first_name,
        last_name,
        email,
        age,
        gender,
        state,
        city,
        country,

        -- Renommer 'created_at' en 'user_created_at' est une bonne pratique pour éviter
        -- les conflits lors des jointures avec d'autres tables qui ont aussi une colonne 'created_at'.
        created_at as user_created_at

    from source

)

select * from renamed