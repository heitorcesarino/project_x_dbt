{{ config(materialized='view') }}

SELECT
    *
FROM
    {{ source('source_vendas', 'vendas') }}