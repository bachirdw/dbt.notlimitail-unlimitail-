view: fct_campaign_performance {
  sql_table_name: `bright-karma-470911-j4`.`notlimitail_thelook`.`fct_campaign_performance` ;;

  dimension_group: event_date {
    type: time
    sql: ${TABLE}.event_date ;;
    description: "AXE TEMPOREL : Le jour où les dépenses marketing ont eu lieu."
    datatype: date
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year,
    ]
  }

  dimension: campaign_name {
    type: string
    sql: ${TABLE}.campaign_name ;;
    description: "AXE CAMPAGNE : Le nom de la campagne publicitaire."
  }

  dimension: total_cost {
    type: number
    sql: ${TABLE}.total_cost ;;
    description: "MESURE MARKETING : Coût total des clics pour cette campagne ce jour-là."
  }

  dimension: total_clicks {
    type: number
    sql: ${TABLE}.total_clicks ;;
    description: "MESURE MARKETING : Nombre total de clics enregistrés pour cette campagne ce jour-là."
  }

  dimension: total_revenue {
    type: number
    sql: ${TABLE}.total_revenue ;;
    description: "MESURE DE VENTE : Revenu total généré par les ventes ce jour-là."
  }

  dimension: total_orders {
    type: number
    sql: ${TABLE}.total_orders ;;
    description: "MESURE DE VENTE : Nombre total de commandes uniques passées ce jour-là."
  }

  measure: daily_total_cost {
    type: sum
    sql: ${TABLE}.total_cost ;;
    description: "Coût total des clics pour cette campagne ce jour-là."
    value_format_name: usd
  }

  measure: daily_total_clicks {
    type: sum
    sql: ${TABLE}.total_clicks ;;
    description: "Nombre total de clics enregistrés pour cette campagne ce jour-là."
  }

  measure: daily_total_revenue {
    type: sum
    sql: ${TABLE}.total_revenue ;;
    description: "Revenu total généré par les ventes ce jour-là."
    value_format_name: usd
  }

  measure: daily_total_orders {
    type: sum
    sql: ${TABLE}.total_orders ;;
    description: "Nombre total de commandes uniques passées ce jour-là."
  }
}