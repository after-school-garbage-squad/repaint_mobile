#!/usr/bin/env bash
set -ex
dart run build_runner build
dart run flutter_oss_licenses:generate