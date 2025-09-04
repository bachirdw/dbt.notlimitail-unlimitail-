connection: "dbt_notlimitail_tl"
include: "/views/*"

explore: int_dim_products {
  description: "Modèle intermédiaire qui nettoie les données des produits. Il sert de source fiable pour les modèles en aval."
}