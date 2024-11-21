select
    name,
    column_name_list
from {{ ref('stg_evaluator_rules') }} where valid_flag = true
