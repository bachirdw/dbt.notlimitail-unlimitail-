connection: "dbt_notlimitail_tl"
include: "/views/*"

explore: int_dim_events {
  description: "Modèle intermédiaire qui enrichit chaque événement avec les coûts de campagne. Le grain est l'événement (une ligne par event_id)."
}