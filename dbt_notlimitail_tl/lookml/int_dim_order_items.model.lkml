connection: "dbt_notlimitail_tl"
include: "/views/*"

explore: int_dim_order_items {
  description: "Modèle intermédiaire qui joint chaque article de commande avec les informations du produit correspondant. Le grain est l'article de commande."
}