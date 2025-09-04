connection: "dbt_notlimitail_tl"
include: "/views/*"

explore: int_dim_orders {
  description: "Modèle intermédiaire qui joint chaque commande avec les informations de l'utilisateur. Le grain est la commande."
}