SELECT
    {{ run_started_at.astimezone(modules.pytz.timezone('America/Los_Angeles'))  }} AS day_of_week