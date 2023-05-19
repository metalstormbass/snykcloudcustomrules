#!/usr/bin/env bash

set -o errexit
set -o pipefail

scripts_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Set common variables and validate configuration
source ${scripts_dir}/common.sh

bundle_ids=$(curl --silent -H "Authorization:${SNYK_TOKEN}" \
    "${custom_rules_endpoint}?version=${API_VERSION}" | jq -r '.data[].id')
for bundle_id in ${bundle_ids}; do
    curl --silent -X DELETE \
        -H "Authorization:${SNYK_TOKEN}" \
        "${custom_rules_endpoint}/${bundle_id}?version=${API_VERSION}"
done