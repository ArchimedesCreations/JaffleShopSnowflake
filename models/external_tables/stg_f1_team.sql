with source as (
    select * from {{ source('snowflake_aws_s3','ext_f1_team')}}
)
select * from source