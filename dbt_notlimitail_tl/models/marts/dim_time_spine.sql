-- Fichier : models/marts/dim_time_spine.sql

{{
    config(
        materialized = 'table'
    )
}}

-- Cette macro de dbt_utils génère une table avec une colonne 'date_day'.
-- Elle va créer une ligne pour chaque jour entre la date de début et la date de fin.
{{ dbt_utils.date_spine(
    datepart="day",
    start_date="cast('2016-01-01' as date)",
    end_date="cast('2025-12-31' as date)"
) }}