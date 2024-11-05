{% macro get_freshness_config() %}
  {% set day_of_week = run_started_at.strftime('%A') %}

  {% if day_of_week in ['Saturday', 'Sunday'] %}
    {{ return(false) }}
  {% else %}
    {{ return(true) }}
  {% endif %}
{% endmacro %}