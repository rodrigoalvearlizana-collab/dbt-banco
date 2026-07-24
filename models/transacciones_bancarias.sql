{{ config(
    materialized='table'
) }}

select
    *
from {{ source('google_drive_sources', 'ext_transacciones_bancarias') }}