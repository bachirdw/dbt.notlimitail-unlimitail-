-- Ce modèle utilise le seed pour créer une dimension propre sur les campagnes.
-- On pourrait l'enrichir en joignant les données d'événements pour savoir
-- quand une campagne a été vue pour la première ou la dernière fois.

with campaign_costs as (
    -- On référence la table créée par 'dbt seed'
    select * from {{ ref('campaign_costs') }}
)

select
    -- On peut générer une clé unique si besoin, mais traffic_source est déjà unique ici.
    traffic_source as campaign_id,
    campaign_name,
    cost_per_click,
    monthly_budget
    
from campaign_costs