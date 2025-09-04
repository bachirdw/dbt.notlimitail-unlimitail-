view: mt_dim_users {
  sql_table_name: `bright-karma-470911-j4`.`notlimitail_thelook`.`mt_dim_users` ;;

  dimension_group: user_created_at {
    type: time
    sql: ${TABLE}.user_created_at ;;
    description: "Date de création du compte de l'utilisateur."
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

  dimension_group: first_order_date {
    type: time
    sql: ${TABLE}.first_order_date ;;
    description: "Date de la toute première commande de l'utilisateur."
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

  dimension_group: last_order_date {
    type: time
    sql: ${TABLE}.last_order_date ;;
    description: "Date de la commande la plus récente de l'utilisateur."
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

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
    description: "Clé primaire unique de l'utilisateur."
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
    description: "Prénom de l'utilisateur."
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
    description: "Nom de famille de l'utilisateur."
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
    description: "Adresse email de l'utilisateur."
  }

  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
    description: "Âge de l'utilisateur."
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
    description: "Genre de l'utilisateur."
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
    description: "Ville de l'utilisateur."
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
    description: "État de l'utilisateur."
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
    description: "Pays de l'utilisateur."
  }

  dimension: number_of_orders {
    type: number
    sql: ${TABLE}.number_of_orders ;;
    description: "MESURE : Nombre total de commandes passées par cet utilisateur."
  }

  measure: total_orders_by_user {
    type: sum
    sql: ${TABLE}.number_of_orders ;;
    description: "Somme du nombre de commandes pour un groupe d'utilisateurs."
  }
}