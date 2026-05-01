#!/bin/bash

# Order Fulfillment Semantic Layer Queries
# Usage: bash order_fulfillment_queries.sh [1-5]
# Pass a query number to run a single query, or omit to run all.

RED='\033[0;31m'
BLUE='\033[0;34m'
RESET='\033[0m'

# Highlights fully-qualified table names (DATABASE.schema.table) in SQL output
highlight_tables() {
  sed "s/[A-Z_][A-Z0-9_]*\.[a-z_][a-z0-9_]*\.[a-z_][a-z0-9_]*/$(printf '\033[1;33m')&$(printf '\033[0m')/g"
}

query_1() {
  printf "${RED}=== 1. Late deliveries by month (order_fulfillment only) ===${RESET}\n"
  echo "dbt sl query --metrics late_delivery_count --group-by metric_time__month --limit 10"
  dbt sl query --metrics late_delivery_count --group-by metric_time__month --limit 10
  printf "${BLUE}--- SQL ---${RESET}\n"
  dbt sl query --metrics late_delivery_count --group-by metric_time__month --limit 10 --compile | highlight_tables
}

query_2() {
  printf "${RED}=== 2. Late delivery count alongside revenue (order_fulfillment + order_items, no orders model) ===${RESET}\n"
  echo "dbt sl query --metrics late_delivery_count,revenue --group-by metric_time__month --limit 10"
  dbt sl query --metrics late_delivery_count,revenue --group-by metric_time__month --limit 10
  printf "${BLUE}--- SQL ---${RESET}\n"
  dbt sl query --metrics late_delivery_count,revenue --group-by metric_time__month --limit 10 --compile | highlight_tables
}

query_3() {
  printf "${RED}=== 3. Late deliveries by month, broken down by food vs. drink orders (order_fulfillment joining orders) ===${RESET}\n"
  echo "dbt sl query --metrics late_delivery_count --group-by metric_time__month --group-by order_id__is_food_order --limit 10"
  dbt sl query --metrics late_delivery_count --group-by metric_time__month --group-by order_id__is_food_order --limit 10
  printf "${BLUE}--- SQL ---${RESET}\n"
  dbt sl query --metrics late_delivery_count --group-by metric_time__month --group-by order_id__is_food_order --limit 10 --compile | highlight_tables
}

query_4() {
  printf "${RED}=== 4. Orders and order total by month (orders model only) ===${RESET}\n"
  echo "dbt sl query --metrics orders,order_total --group-by metric_time__month --limit 10"
  dbt sl query --metrics orders,order_total --group-by metric_time__month --limit 10
  printf "${BLUE}--- SQL ---${RESET}\n"
  dbt sl query --metrics orders,order_total --group-by metric_time__month --limit 10 --compile | highlight_tables
}

query_5() {
  printf "${RED}=== 5. Revenue by food vs. drink orders (order_items joining orders) ===${RESET}\n"
  echo "dbt sl query --metrics revenue --group-by metric_time__month --group-by order_id__is_food_order --limit 10"
  dbt sl query --metrics revenue --group-by metric_time__month --group-by order_id__is_food_order --limit 10
  printf "${BLUE}--- SQL ---${RESET}\n"
  dbt sl query --metrics revenue --group-by metric_time__month --group-by order_id__is_food_order --limit 10 --compile | highlight_tables
}

case "${1}" in
  1) query_1 ;;
  2) query_2 ;;
  3) query_3 ;;
  4) query_4 ;;
  5) query_5 ;;
  "")
    query_1; echo ""
    query_2; echo ""
    query_3; echo ""
    query_4; echo ""
    query_5
    ;;
  *)
    echo "Usage: $0 [1-5]"
    exit 1
    ;;
esac
