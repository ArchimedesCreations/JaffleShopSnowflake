# Order Fulfillment Semantic Layer Queries

Example `dbt sl` queries for the `late_delivery_count` metric, showing it can run standalone or joined to the orders semantic model via the `order_id` entity.

---

## Standalone (no join to orders)

**Late deliveries by month**
```bash
dbt sl query --metrics late_delivery_count --group-by metric_time__month --limit 10
dbt sl query --metrics late_delivery_count --group-by metric_time__month --limit 10 --compile
```

**Late deliveries by days to fulfill**
```bash
dbt sl query --metrics late_delivery_count --group-by order_fulfillment__days_to_fulfill --limit 10
dbt sl query --metrics late_delivery_count --group-by order_fulfillment__days_to_fulfill --limit 10 --compile
```

---

## With orders (joins via order_id entity)

**Late deliveries by month, broken down by food vs. drink orders**
```bash
dbt sl query --metrics late_delivery_count --group-by metric_time__month --group-by order_id__is_food_order --limit 10
dbt sl query --metrics late_delivery_count --group-by metric_time__month --group-by order_id__is_food_order --limit 10 --compile
```

**Late delivery count alongside order total**
```bash
dbt sl query --metrics late_delivery_count,order_total --group-by metric_time__month --limit 10
dbt sl query --metrics late_delivery_count,order_total --group-by metric_time__month --limit 10 --compile
```
