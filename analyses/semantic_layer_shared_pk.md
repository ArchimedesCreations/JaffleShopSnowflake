# Semantic Layer: Handling Multiple Tables with the Same Primary Key

## Problem

The dbt Semantic Layer requires every primary entity to have a unique name across all semantic models. When two tables both use `order_id` as their grain, you cannot declare both as `type: primary` with `name: order_id` — that would be a naming collision.

## Solution: Alias the Primary Entity, Add a Foreign Key

For any table that shares its physical PK column with another semantic model, give the primary entity a **distinct logical name** and point its `expr` at the shared column. Then add a **separate foreign entity** using the shared name so MetricFlow knows how to join it to the canonical model.

### Example: `orders` (the canonical model)

```yaml
semantic_models:
  - name: orders
    model: ref('orders')
    entities:
      - name: order_id   # name matches the column — no expr needed
        type: primary
```

`orders` owns the `order_id` entity. Its name and the underlying column are identical, so `expr` is omitted.

### Example: `order_fulfillment` (a second table at the same grain)

```yaml
semantic_models:
  - name: order_fulfillment
    model: ref('order_fulfillment')
    entities:
      - name: fulfillment   # unique logical name — avoids collision
        type: primary
        expr: order_id      # points at the same physical column

      - name: order_id      # foreign entity shares the canonical name
        type: foreign
        expr: order_id      # also points at order_id
```

Two things are happening here:

1. **`fulfillment` (primary)** — gives this model its own unique grain name. MetricFlow uses this to identify the model without conflicting with `orders`.
2. **`order_id` (foreign)** — declares that this model can join to the `orders` semantic model via `order_id`. When you query a dimension that lives on `orders` (e.g., `order_id__is_food_order`), MetricFlow knows to bring in that table.

## How MetricFlow Resolves Joins

MetricFlow is smart about which tables it actually includes in generated SQL. It only joins in a table when the query requires something from it.

| Query | Tables used |
|---|---|
| `late_delivery_count` grouped by `metric_time__month` | `order_fulfillment` only |
| `late_delivery_count` + `revenue` grouped by `metric_time__month` | `order_fulfillment` + `order_items` (no `orders` needed) |
| `late_delivery_count` grouped by `order_id__is_food_order` | `order_fulfillment` + `orders` (dimension lives on `orders`) |
| `orders` + `order_total` grouped by `metric_time__month` | `orders` only |
| `revenue` grouped by `order_id__is_food_order` | `order_items` + `orders` |

Querying metrics on `order_fulfillment` does **not** automatically pull in `orders`. The join only happens when you explicitly request a dimension or metric that requires it.

## Key Rules

- Every semantic model must have exactly one `primary` entity with a unique `name` across the project.
- If two models share a physical PK column, alias one of the primary entities to a distinct name and use `expr` to point it at the column.
- Add a `foreign` entity using the canonical shared name so MetricFlow can trace the join path.
- Foreign entity names are matched by name — `name: order_id` on a foreign entity resolves to whichever semantic model declares `name: order_id` as its primary.

## Files in This Project

| File | Role |
|---|---|
| `models/marts/orders.yml` | Canonical `order_id` primary entity |
| `models/marts/order_fulfillment.yml` | `fulfillment` primary + `order_id` foreign |
| `models/marts/order_items.yml` | `order_item` primary + `order_id` foreign |
| `analyses/order_fulfillment_queries.sh` | Five example queries demonstrating the join behavior above |
