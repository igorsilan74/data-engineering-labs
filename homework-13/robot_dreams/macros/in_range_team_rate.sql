{% test in_range_team_rate(model, column_name, min_value, max_value) %}

select * from {{ model }} where {{ column_name }} not between {{ min_value }} and {{ max_value }}

{% endtest %}

