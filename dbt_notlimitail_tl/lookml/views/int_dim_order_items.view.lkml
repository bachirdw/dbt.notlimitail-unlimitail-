view: int_dim_order_items {
  sql_table_name: `bright-karma-470911-j4`.`notlimitail_thelook`.`int_dim_order_items` ;;

  dimension: order_item_id {
    type: number
    sql: ${TABLE}.order_item_id ;;
    description: "Clé primaire de l'article de commande."
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
    description: "Clé étrangère vers la commande."
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
    description: "Clé étrangère vers l'utilisateur qui a passé la commande."
  }

  dimension: product_id {
    type: number
    sql: ${TABLE}.product_id ;;
    description: "Clé étrangère vers le produit commandé."
  }

  dimension: item_sale_price {
    type: number
    sql: ${TABLE}.item_sale_price ;;
    description: "Prix de vente de l'article. Doit être positif."
  }
}