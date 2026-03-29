{{
  config(
    alias = "order_daily_report",
    
  )
}}


SELECT 
    DATE_TRUNC(order_date, DAY) AS report_date,
    mapping.account_manager,
    mapping.state,
    COUNT(DISTINCT order_id) AS total_orders,
    AVG(total_distinct_items) AS average_total_distinct_items,
    SUM(sum_feedback_score) / SUM(total_feedbacks) AS average_feedback_score,
    AVG(total_order_amount) AS average_total_order_amount
FROM {{ ref('int_sales_database__order') }} as sl
LEFT JOIN {{ ref('stg_google_sheets___account_manager_region_mapping') }} as mapping ON sl.customer_state = mapping.state
GROUP BY report_date,
    account_manager,
    state