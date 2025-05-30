{{ config(materialized='view') }}

WITH cleaned_data AS (
    SELECT
        email,
        DATE(data_Hora) as data,
        valor,
        quantidade,
        produto
    FROM
        {{ ref('bronze_vendas') }}
    WHERE
        valor > 0 AND valor < 8000 AND data_hora <= CURRENT_DATE
)

SELECT *
FROM cleaned_data