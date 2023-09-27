#!/usr/bin/env bash
set -ex
./scripts/dotenv.sh
./scripts/local_properties.sh
./scripts/build_runner.sh