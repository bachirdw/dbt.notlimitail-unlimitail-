view: int_dim_products {
  sql_table_name: `bright-karma-470911-j4`.`notlimitail_thelook`.`int_dim_products` ;;

  dimension: product_id {
    type: number
    sql: ${TABLE}.product_id ;;
    description: "Clé primaire du produit."
  }

  dimension: product_name {
    type: string
    sql: ${TABLE}.product_name ;;
    description: "Nom du produit. Les valeurs nulles sont remplacées par 'Unknown Product'."
  }

  dimension: product_cost {
    type: number
    sql: ${TABLE}.product_cost ;;
    description: "Coût d'achat du produit. Doit être positif."
  }

  dimension: product_retail_price {
    type: number
    sql: ${TABLE}.product_retail_price ;;
    description: "Prix de vente conseillé du produit. Doit être positif."
  }
}