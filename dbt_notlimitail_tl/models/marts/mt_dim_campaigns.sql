
-- Quelle Campagne ?
-- Ce modèle crée la dimension finale des campagnes.
-- Il est principalement basé sur notre seed de coûts.

with campaign_costs as (
    select * from {{ ref('campaign_costs') }}
)

select
    -- On utilise traffic_source comme clé unique pour la campagne
    traffic_source as campaign_id,
    campaign_name,
    
    -- On peut ajouter une colonne de canal pour la segmentation
    case 
        when traffic_source in ('Adwords', 'Facebook', 'YouTube') then 'Paid'
        when traffic_source in ('Email') then 'Owned'
        when traffic_source in ('Organic') then 'Organic'
        else 'Other'
    end as channel,

    cost_per_click,
    monthly_budget
    
from campaign_costs