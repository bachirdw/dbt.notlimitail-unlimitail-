-- QUOI ?
-- Ce modèle crée la dimension finale des produits.
-- Il agrège les informations de vente pour calculer des KPIs par produit.

with products as (
    select * from {{ ref('int_dim_products') }}
),

order_items as (
    -- On utilise le modèle intermédiaire qui a déjà les infos produits jointes
    select * from {{ ref('int_dim_order_items') }}
),

-- On agrège les faits au niveau du produit
product_facts as (
    select
        product_id,
        count(distinct order_id) as number_of_orders,
        sum(item_sale_price) as total_revenue,
        avg(item_sale_price) as average_price
    from order_items
    group by 1
)

select
    p.product_id,
    p.product_name,
    p.product_category,
    p.product_brand,
    p.product_department,
    p.product_retail_price,
    
    -- On joint les KPIs agrégés
    coalesce(f.number_of_orders, 0) as number_of_orders,
    coalesce(f.total_revenue, 0) as total_revenue,
    f.average_price

from products as p
left join product_facts as f on p.product_id = f.product_id