#!/usr/bin/env bash
set -ex
touch .env
(
  echo "API_BASE_URL=$API_BASE_URL"
  echo "SENTRY_DSN=$SENTRY_DSN"
  echo "SENTRY_ENVIRONMENT=$SENTRY_ENVIRONMENT"
) >> .env