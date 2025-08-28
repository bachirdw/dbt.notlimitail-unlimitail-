
-- Fichier : models/marts/fct_campaign_performance.sql

{{
    config(
        materialized='table',
        partition_by={
            "field": "event_date",
            "data_type": "date",
            "granularity": "day"
        },
        cluster_by = ["campaign_name"]
    )
}}

-- On importe nos modèles intermédiaires préparés
with events as (
    select * from {{ ref('int_dim_events') }}
),

order_items as (
    select * from {{ ref('int_dim_order_items') }}
),

-- Étape 1 : Agréger les coûts marketing par jour et par campagne
daily_costs as (
    select
        -- On extrait la date de l'événement
        cast(event_created_at as date) as event_date,
        campaign_name,
        
        -- On somme les coûts des clics
        sum(event_cost) as total_cost,
        -- On compte le nombre de clics (en supposant que seuls les clics ont un coût)
        count(case when event_cost > 0 then event_id end) as total_clicks

    from events
    group by 1, 2
),

-- Étape 2 : Agréger les revenus des ventes par jour
daily_revenue as (
    select
        -- On extrait la date de la vente
        cast(item_created_at as date) as order_date,
        
        -- On somme les revenus
        sum(item_sale_price) as total_revenue,
        -- On compte le nombre de commandes uniques
        count(distinct order_id) as total_orders

    from order_items
    group by 1
),

-- Étape 3 : Joindre les coûts et les revenus
final as (
    select
        -- Axes d'analyse
        c.event_date,
        c.campaign_name,

        -- Métriques marketing
        coalesce(c.total_cost, 0) as total_cost,
        coalesce(c.total_clicks, 0) as total_clicks,

        -- Métriques de vente
        coalesce(r.total_revenue, 0) as total_revenue,
        coalesce(r.total_orders, 0) as total_orders

    from daily_costs as c
    -- On fait une jointure gauche pour garder toutes nos dépenses marketing,
    -- même les jours où il n'y a pas eu de vente.
    left join daily_revenue as r on c.event_date = r.order_date
)

select * from final
