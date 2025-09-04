view: dim_time_spine {
  sql_table_name: `bright-karma-470911-j4`.`notlimitail_thelook`.`dim_time_spine` ;;

  dimension_group: date_day {
    type: time
    sql: ${TABLE}.date_day ;;
    description: "Date unique pour chaque ligne de la table. C'est la clé primaire."
    datatype: datetime
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
}