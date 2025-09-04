view: int_dim_campaigns {
  sql_table_name: `bright-karma-470911-j4`.`notlimitail_thelook`.`int_dim_campaigns` ;;

  dimension: campaign_id {
    type: string
    sql: ${TABLE}.campaign_id ;;
    description: "Clé primaire de la campagne (basée sur traffic_source)."
  }

  dimension: campaign_name {
    type: string
    sql: ${TABLE}.campaign_name ;;
    description: "Nom de la campagne."
  }

  dimension: cost_per_click {
    type: number
    sql: ${TABLE}.cost_per_click ;;
    description: "Coût par clic défini pour cette campagne."
  }

  dimension: monthly_budget {
    type: number
    sql: ${TABLE}.monthly_budget ;;
    description: "Budget mensuel alloué à cette campagne."
  }
}