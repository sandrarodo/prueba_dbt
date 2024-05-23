--macro para calcular la media de las ventas

{% macro calculate_average(sum_value, count_value) %}
    {{ sum_value }} / {{ count_value }}
{% endmacro %}