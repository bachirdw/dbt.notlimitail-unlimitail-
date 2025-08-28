
-- QUI ?
-- Ce modèle crée la dimension finale des utilisateurs.
-- Il agrège les informations de commande pour calculer des KPIs clés par utilisateur (RFM).

with users as (
    select * from {{ ref('stg_users') }}
),

orders as (
    -- On utilise le modèle intermédiaire qui a déjà les infos clients jointes
    select * from {{ ref('int_dim_orders') }}
),

-- On agrège les faits au niveau de l'utilisateur
user_facts as (
    select
        user_id,
        min(order_created_at) as first_order_date,
        max(order_created_at) as last_order_date,
        count(distinct order_id) as number_of_orders
    from orders
    group by 1
)

select
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    u.age,
    u.gender,
    u.city,
    u.state,
    u.country,
    u.user_created_at,
    
    -- On joint les KPIs agrégés
    f.first_order_date,
    f.last_order_date,
    coalesce(f.number_of_orders, 0) as number_of_orders

from users as u
left join user_facts as f on u.user_id = f.user_id
