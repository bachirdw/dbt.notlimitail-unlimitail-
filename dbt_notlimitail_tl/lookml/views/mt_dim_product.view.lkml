view: mt_dim_product {
  sql_table_name: `bright-karma-470911-j4`.`notlimitail_thelook`.`mt_dim_product` ;;

  dimension: product_id {
    type: number
    sql: ${TABLE}.product_id ;;
    description: "Clé primaire unique du produit."
  }

  dimension: product_name {
    type: string
    sql: ${TABLE}.product_name ;;
    description: "Nom commercial du produit."
  }

  dimension: product_category {
    type: string
    sql: ${TABLE}.product_category ;;
    description: "Catégorie du produit."
  }

  dimension: product_brand {
    type: string
    sql: ${TABLE}.product_brand ;;
    description: "Marque du produit."
  }

  dimension: product_department {
    type: string
    sql: ${TABLE}.product_department ;;
    description: "Département ou rayon du produit."
  }

  dimension: product_retail_price {
    type: number
    sql: ${TABLE}.product_retail_price ;;
    description: "Prix de vente conseillé du produit. C'est un attribut du produit lui-même."
    value_format_name: usd
  }

  dimension: number_of_orders {
    type: number
    sql: ${TABLE}.number_of_orders ;;
    description: "MESURE : Nombre total de commandes distinctes contenant ce produit."
  }

  dimension: total_revenue {
    type: number
    sql: ${TABLE}.total_revenue ;;
    description: "MESURE : Revenu total généré par ce produit sur sa durée de vie."
  }

  dimension: average_price {
    type: number
    sql: ${TABLE}.average_price ;;
    description: "MESURE : Prix de vente moyen de cet article dans les commandes."
  }

  measure: total_orders_for_product {
    type: sum
    sql: ${TABLE}.number_of_orders ;;
    description: "Nombre total de commandes distinctes contenant ce produit."
  }

  measure: total_revenue_from_product {
    type: sum
    sql: ${TABLE}.total_revenue ;;
    description: "Revenu total généré par ce produit sur sa durée de vie."
    value_format_name: usd
  }

  measure: average_sale_price_for_product {
    type: average
    sql: ${TABLE}.average_price ;;
    description: "Prix de vente moyen de cet article dans les commandes."
    value_format_name: usd
  }
}