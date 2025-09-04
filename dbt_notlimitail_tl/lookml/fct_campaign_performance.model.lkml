connection: "dbt_notlimitail_tl"
include: "/views/*"

explore: fct_campaign_performance {
  description: "TABLE DE FAITS : Modèle principal qui agrège les coûts marketing et les revenus des ventes par jour et par nom de campagne. C'est la source de vérité pour l'analyse de la performance."

  join: mt_dim_campaigns {
    type: left_outer
    relationship: many_to_one
    sql_on: ${fct_campaign_performance.campaign_name} = ${mt_dim_campaigns.campaign_name} ;;
  }
}