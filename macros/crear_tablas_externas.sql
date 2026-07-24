{% macro crear_tablas_externas() %}

  {# 1. Crear tabla externa para el archivo .CSV #}
  {% set query_csv %}
    CREATE OR REPLACE EXTERNAL TABLE `mi-proyecto-dbt-nube.ds_dbt_banco.ext_transacciones_bancarias`
    OPTIONS (
      format = 'CSV',
      uris = ['https://drive.google.com/open?id=1GU_kw0ION44mQDMK333biiOGvbOegAw_'],
      skip_leading_rows = 1,
      field_delimiter = ','
    );
  {% endset %}

  {# 2. Crear tabla externa para el archivo .TXT (separado por punto y coma) #}
  {% set query_txt %}
    CREATE OR REPLACE EXTERNAL TABLE `mi-proyecto-dbt-nube.ds_dbt_banco.ext_clientes_banco`
    OPTIONS (
      format = 'CSV',
      uris = ['https://drive.google.com/open?id=1rODwyfD7Mov9VxNRvg03y_pq8hP-pgUl'],
      skip_leading_rows = 1,
      field_delimiter = ';'
    );
  {% endset %}

  {# Ejecucción de las consultas en BigQuery #}
  {% do run_query(query_csv) %}
  {% do log("Tabla externa transacciones_bancarias creada exitosamente.", info=True) %}

  {% do run_query(query_txt) %}
  {% do log("Tabla externa clientes_banco creada exitosamente.", info=True) %}

{% endmacro %}