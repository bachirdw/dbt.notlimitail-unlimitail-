connection: "dbt_notlimitail_tl"
include: "/views/*"

explore: mt_dim_product {
  description: "DIMENSION : Décrit chaque produit et ses attributs (marque, catégorie) ainsi que des KPIs agrégés sur sa durée de vie. C'est la source de vérité pour répondre à la question 'Quoi ?'."
}