#!/usr/bin/env bash
set -ex
(
  # shellcheck disable=SC2028
  echo "\n"
  echo "AUTH0_DOMAIN=$AUTH0_DOMAIN"
  echo "AUTH0_SCHEME=$AUTH0_SCHEME"
) >> ./android/local.properties