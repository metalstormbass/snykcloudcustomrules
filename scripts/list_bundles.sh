#!/usr/bin/env bash

set -o errexit
set -o pipefail

scripts_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Set common variables and validate configuration
source ${scripts_dir}/common.sh

curl --silent -H "Authorization:${SNYK_TOKEN}" \
    "${custom_rules_endpoint}?version=${API_VERSION}" \
    | jq