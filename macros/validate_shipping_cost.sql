-- macro para validar que el coste total del envío no sea negativo

{% macro validate_shipping_cost(total_shipping_cost) %}
    case
        when {{ total_shipping_cost }} < 0 then 'ERROR: Negative total shipping cost detected'
        else 'SUCCESS'
    end
{% endmacro %}
