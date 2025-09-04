-- Ce modèle joint les articles de commande avec les produits pour avoir
-- une vue complète de chaque ligne de vente. Le grain reste une ligne par article de commande.

with order_items as (
    select * from {{ ref('stg_order_items') }}
),

products as (
    select * from {{ ref('stg_products') }}
)

select
    -- Clés de l'article de commande
    oi.order_item_id,
    oi.order_id,
    oi.user_id,
    oi.product_id,

    -- Informations sur le produit
   p.product_name, 
    p.product_category,
    p.product_brand,
    p.product_department,
    p.product_retail_price,

    -- Informations sur la vente de l'article
    oi.item_status,
    oi.item_created_at,
    oi.item_sale_price

from order_items as oi
left join products as p on oi.product_id = p.product_id