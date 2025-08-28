-- Ce modèle joint les événements avec les coûts de campagne simulés.
-- Le grain reste une ligne par événement.

with events as (
    select * from {{ ref('stg_events') }}
),

campaign_costs as (
    select * from {{ ref('campaign_costs') }}
)

select
    -- Clés de l'événement
    e.event_id,
    e.user_id,
    e.session_id,

    -- Informations sur la campagne (depuis le seed)
    cc.campaign_name,
    e.traffic_source,

    -- Informations sur l'événement
    e.event_type,
    e.event_created_at,

    -- Calcul du coût au niveau de l'événement
    -- On considère qu'un événement de type 'product_click' est un clic payant.
    case
        when e.event_type = 'product_click' then cc.cost_per_click
        else 0
    end as event_cost

from events as e
left join campaign_costs as cc on e.traffic_source = cc.traffic_source