#!/usr/bin/env bash
set -ex
(
  echo "AUTH0_DOMAIN=$AUTH0_DOMAIN"
  echo "AUTH0_SCHEME=$AUTH0_SCHEME"
) > ./android/env.properties