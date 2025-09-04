view: int_dim_events {
  sql_table_name: `bright-karma-470911-j4`.`notlimitail_thelook`.`int_dim_events` ;;

  dimension_group: event_created_at {
    type: time
    sql: ${TABLE}.event_created_at ;;
    description: "Timestamp de l'événement."
    datatype: timestamp
    timeframes: [
      raw,
      time,
      hour,
      date,
      week,
      month,
      quarter,
      year,
    ]
  }

  dimension: event_id {
    type: number
    sql: ${TABLE}.event_id ;;
    description: "Clé primaire de l'événement."
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
    description: "Clé étrangère vers la dimension des utilisateurs."
  }

  dimension: traffic_source {
    type: string
    sql: ${TABLE}.traffic_source ;;
    description: "La source du trafic, utilisée pour joindre les informations de campagne. Doit exister dans la table des campagnes."
  }

  dimension: event_type {
    type: string
    sql: ${TABLE}.event_type ;;
    description: "Type de l'événement (ex: page_view, product_click)."
  }

  dimension: event_cost {
    type: number
    sql: ${TABLE}.event_cost ;;
    description: "Coût simulé de l'événement (basé sur le CPC si c'est un clic). Doit être positif ou nul."
  }
}