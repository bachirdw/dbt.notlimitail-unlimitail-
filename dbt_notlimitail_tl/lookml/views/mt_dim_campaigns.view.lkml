view: mt_dim_campaigns {
  sql_table_name: `bright-karma-470911-j4`.`notlimitail_thelook`.`mt_dim_campaigns` ;;

  dimension: campaign_id {
    type: string
    sql: ${TABLE}.campaign_id ;;
    description: "Clé primaire unique de la campagne (basée sur traffic_source)."
  }

  dimension: campaign_name {
    type: string
    sql: ${TABLE}.campaign_name ;;
    description: "Nom de la campagne."
  }

  dimension: channel {
    type: string
    sql: ${TABLE}.channel ;;
    description: "Canal marketing de la campagne (Paid, Owned, Organic)."
  }

  dimension: cost_per_click {
    type: number
    sql: ${TABLE}.cost_per_click ;;
    description: "MESURE : Coût unitaire pour chaque clic de cette campagne."
  }

  dimension: monthly_budget {
    type: number
    sql: ${TABLE}.monthly_budget ;;
    description: "MESURE : Budget mensuel alloué à cette campagne."
  }

  measure: average_cost_per_click {
    type: average
    sql: ${TABLE}.cost_per_click ;;
    description: "Coût par clic moyen pour la campagne ou le groupe de campagnes."
    value_format_name: usd
  }

  measure: total_monthly_budget {
    type: sum
    sql: ${TABLE}.monthly_budget ;;
    description: "Somme des budgets mensuels pour un groupe de campagnes."
    value_format_name: usd_0
  }
}