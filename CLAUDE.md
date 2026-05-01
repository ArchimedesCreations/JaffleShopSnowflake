# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project overview

Jaffle Shop is a demo dbt project from dbt Labs for a fictional restaurant, used to showcase dbt Cloud features. It targets Snowflake but is CI-tested against BigQuery and Postgres as well. The project uses dbt Cloud CLI for local development and deploys via dbt Cloud Jobs.

## Common commands

```bash
# Install packages (always run after cloning or adding packages)
dbt deps

# Build and test the entire project
dbt build

# Run or test a single model
dbt run --select customers
dbt test --select customers

# Run models and their upsteam dependencies
dbt build --select +order_items

# Compile SQL without running
dbt compile --select customers

# Validate semantic layer configs
mf validate-configs

# Query a metric
mf query --metrics revenue --group-by metric_time__month
```

## Initial data load (one-time setup)

Raw data must be seeded before the project can build. The `task` runner wraps this:

```bash
# Full setup: creates venv, installs dbt-core + adapter, generates data, seeds it
task load YEARS=6 DB=snowflake

# Or step by step:
task venv
task install DB=snowflake
task gen YEARS=6        # generates jaffle-data/ CSVs via jafgen
task seed               # runs dbt seed
task clean              # removes jaffle-data/ and uninstalls dbt-core
```

After loading, remove `jaffle-data` from `seed-paths` in `dbt_project.yml` (or delete the folder).

## Architecture

### Two-layer model structure

- **`models/staging/`** — thin views over raw sources (`{{ source('ecom', 'raw_*') }}`). Minimal transformation: rename columns, cast types, no business logic. All in the `staging` schema. Group: `eds`.
- **`models/marts/`** — business-logic tables. Join and aggregate staging models using `{{ ref() }}`. Split into groups: `sales` (customers, orders) and `procurement` (products, supplies, locations).

### Semantic layer

Mart models that expose metrics have their semantic model, metrics, and saved queries defined in the same `.yml` file as the model (e.g., `customers.yml`, `orders.yml`). The `time_spine_day.sql` model is required by MetricFlow for time-series metrics. The `dbt_date:time_zone` var is set to `America/Los_Angeles`.

### Environment-aware schema/alias macros

Two custom macros in `macros/` control where models are built:

- **`generate_schema_name`**: In `dev` environments (target name `dev` or `DBT_CLOUD_ENVIRONMENT_TYPE=dev`), everything builds into the default schema (no sub-schema). In CI/prod, models use their configured `+schema` (`staging`, `marts`).
- **`generate_alias_name`**: In `dev`, model names are prefixed with their schema (e.g., `staging_stg_customers`, `marts_customers`) so all models land in a single schema without collisions. In CI/prod, models use their plain names.

This means running `dbt build` locally will build all models into your personal schema with prefixed names — you won't see separate `staging` and `marts` schemas in dev.

### Git / deployment workflow (WAP)

- **`main`** → production (protected branch, deploys via dbt Cloud Job)
- **`staging`** → staging environment (used for pre-production validation)
- Feature branches off `staging`, merge back to `staging` to audit, then `staging` → `main` to publish

CI runs on PRs to `main` and `staging`, testing against Snowflake, BigQuery, and Postgres simultaneously.

## Key packages

| Package | Purpose |
|---|---|
| `dbt_utils` | Expression tests, surrogate keys, etc. |
| `dbt_date` | Date utilities (timezone: `America/Los_Angeles`) |
| `audit_helper` | Comparing model outputs before/after changes |
| `dbt_project_evaluator` | Project structure quality checks (reports in `models/marts/admin/`) |

## Pre-commit hooks

Enabled via `pre-commit install`. Runs on commit: `check-yaml`, `end-of-file-fixer`, `trailing-whitespace`, `ruff` (Python linter/formatter). Run manually with `pre-commit run --all-files`.
