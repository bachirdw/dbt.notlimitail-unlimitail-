connection: "dbt_notlimitail_tl"
include: "/views/*"

explore: dim_time_spine {
  description: "DIMENSION TEMPORELLE : Table de calendrier contenant une ligne pour chaque jour. Elle sert de référence pour toutes les analyses temporelles."
}