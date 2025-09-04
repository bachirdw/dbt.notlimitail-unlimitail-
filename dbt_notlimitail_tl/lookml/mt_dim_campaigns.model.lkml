connection: "dbt_notlimitail_tl"
include: "/views/*"

explore: mt_dim_campaigns {
  description: "DIMENSION : Décrit chaque campagne publicitaire, son canal, et ses paramètres de coût. C'est la source de vérité pour l'analyse des campagnes."
}