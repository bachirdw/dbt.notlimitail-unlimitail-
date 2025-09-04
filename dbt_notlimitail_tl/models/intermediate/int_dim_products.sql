-- Fichier : dbt_notlimitail_tl/models/intermediate/int_dim_products.sql

-- Ce modèle nettoie les données des produits.
-- Il servira de source fiable pour tous les modèles en aval.

with stg_products as (
    select * from {{ ref('stg_products') }}
)

select
    product_id,
    
    -- On applique la logique de nettoyage ici, dans la couche intermédiaire
    coalesce(product_name, 'Unknown Product') as product_name,
    
    product_category,
    product_brand,
    product_department,
    product_cost,
    product_retail_price

from stg_products