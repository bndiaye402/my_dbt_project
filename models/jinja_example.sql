{% set order_status_list = ["shipped", "approved", "canceled", "invoiced", "delivered", "processing", "unavailable"] %}

select
    {% for order_status in order_status_list %}
    sum(case when order_status = '{{order_status}}' then total_order_amount end) as total_{{order_status}}_order_amount,
    {% endfor %}
from {{ref('int_sales_database__order')}}