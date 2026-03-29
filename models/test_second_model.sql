select count(distinct order_id) as nb_orderid
from {{ref('test_model')}}