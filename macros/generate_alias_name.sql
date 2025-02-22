
{% macro generate_alias_name(custom_alias_name=none, node=none) -%}

    {%- if env_var('DBT_CLOUD_ENVIRONMENT_TYPE') == 'dev' and not(node.resource_type == 'seed') -%}

        {%- if custom_alias_name -%}

            {{ node.schema }}__{{ custom_alias_name | trim }}

        {%- elif node.version -%}

            {{ node.schema }}__{{ node.name ~ "_v" ~ (node.version | replace(".", "_")) }}

        {%- else -%}

            {{ node.schema }}__{{ node.name }}

        {%- endif -%}
    
    {%- else -%}

        {%- if custom_alias_name -%}

            {{ custom_alias_name | trim }}

        {%- elif node.version -%}

            {{ return(node.name ~ "_v" ~ (node.version | replace(".", "_"))) }}

        {%- else -%}

            {{ node.name }}

        {%- endif -%}

    {%- endif -%}

    {% if node.resource_type == 'source' %}
        {{ "source is here" }}
    {%- endif -%}

{%- endmacro %}
