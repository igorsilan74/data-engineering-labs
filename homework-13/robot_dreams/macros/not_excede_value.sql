{% test not_excede_value(model, column_name) %}

with validation as (
  select {{ column_name }} as wage_eur, value_eur
  from {{ model }}
),
validation_error as (
  select * from validation where wage_eur > value_eur
)

select * from validation_error

{% endtest %}

