-- macro para validar si cada cliente tiene suficiente saldo en la cuenta para pagar los pedidos

{% macro validate_customer_balance(customer_key) %}
    select
        c.customer_key,
        c.customer_name,
        c.customer_acc_bal,
        sum(o.order_total_price) as total_order_price,
        case
            when c.customer_acc_bal >= sum(o.order_total_price) then 'Sufficient Balance'
            else 'Insufficient Balance'
        end as balance_status
    from {{ ref('stg_customers') }} as c
    left join {{ ref('stg_orders') }} as o on c.customer_key = o.customer_key
    group by c.customer_key, c.customer_name, c.customer_acc_bal
{% endmacro %}
