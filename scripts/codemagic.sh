#!/usr/bin/env bash
set -ex
./scripts/dotenv.sh
./scripts/env_properties.sh
./scripts/build_runner.sh