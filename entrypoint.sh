#!/bin/bash
set -e

# Remove server.pid for Rails.
rm -f tmp/pids/server.pid

# Execute the container's main process.
exec "$@"
