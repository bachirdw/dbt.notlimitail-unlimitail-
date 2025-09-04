view: int_dim_orders {
  sql_table_name: `bright-karma-470911-j4`.`notlimitail_thelook`.`int_dim_orders` ;;

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
    description: "Clé primaire de la commande."
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
    description: "Clé étrangère vers l'utilisateur. Chaque commande doit avoir un utilisateur."
  }

  dimension: order_status {
    type: string
    sql: ${TABLE}.order_status ;;
    description: "Statut de la commande."
  }

  dimension: num_items_in_order {
    type: number
    sql: ${TABLE}.num_items_in_order ;;
    description: "Nombre d'articles dans la commande. Doit être supérieur à zéro."
  }
}