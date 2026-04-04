#!/bin/sh
set -e

# If SEARXNG_SECRET is set, patch the secret_key in settings.yml
if [ -n "$SEARXNG_SECRET" ]; then
  sed -i "s/secret_key: \"changeme\"/secret_key: \"$SEARXNG_SECRET\"/" /etc/searxng/settings.yml
fi

# Hand off to the real SearXNG entrypoint
exec /usr/local/searxng/dockerfiles/docker-entrypoint.sh