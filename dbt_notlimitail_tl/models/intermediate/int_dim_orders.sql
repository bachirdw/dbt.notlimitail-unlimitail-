-- Ce modèle joint les commandes avec les utilisateurs pour avoir une vue complète
-- de chaque commande. Le grain reste une ligne par commande.

with orders as (
    select * from {{ ref('stg_orders') }}
),

users as (
    select * from {{ ref('stg_users') }}
)

select
    -- Clés de la commande
    o.order_id,
    o.user_id,
    
    -- Informations sur l'utilisateur qui a passé la commande
    u.first_name,
    u.last_name,
    u.email,
    u.age,
    u.gender,
    u.city as user_city,
    u.state as user_state,
    u.country as user_country,

    -- Informations sur la commande
    o.order_status,
    o.order_created_at,
    o.order_returned_at,
    o.order_shipped_at,
    o.order_delivered_at,
    o.num_items_in_order

from orders as o
left join users as u on o.user_id = u.user_id