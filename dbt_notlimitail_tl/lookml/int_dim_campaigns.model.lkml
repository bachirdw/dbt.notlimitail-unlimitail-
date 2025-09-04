connection: "dbt_notlimitail_tl"
include: "/views/*"

explore: int_dim_campaigns {
  description: "Modèle intermédiaire qui prépare les données des campagnes à partir du seed 'campaign_costs'. Le grain est la campagne (une ligne par traffic_source)."
}