{% macro calculate_total_order_item_amount() %}
    (price * quantity) + shipping_cost
{% endmacro %}