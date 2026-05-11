Hermes Agent with Claude Code, OpenCode, and hindsight-client pre-installed.

Cron Python scripts run in a user-owned venv instead of the Hermes system venv.
The image patches Hermes cron script execution to call
`/usr/local/bin/hermes-cron-python`.

The wrapper creates `$HERMES_HOME/cron/venv` automatically and uses `uv` to
install requirements when any of these files exist or change:

- `$HERMES_HOME/cron/requirements.txt`
- `$HERMES_HOME/scripts/requirements.txt`
- `requirements.txt` next to the cron script being executed
