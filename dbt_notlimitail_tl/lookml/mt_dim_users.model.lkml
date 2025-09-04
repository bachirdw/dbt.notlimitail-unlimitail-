connection: "dbt_notlimitail_tl"
include: "/views/*"

explore: mt_dim_users {
  description: "DIMENSION : Décrit chaque utilisateur et ses attributs. Elle est enrichie avec des métriques clés sur son historique d'achat (RFM). C'est la source de vérité pour répondre à la question 'Qui ?'."
}