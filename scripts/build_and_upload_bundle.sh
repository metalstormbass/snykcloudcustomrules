#!/usr/bin/env bash

set -o errexit
set -o pipefail

scripts_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
bundle_id="$1"

# Set common variables and validate configuration
source ${scripts_dir}/common.sh

# Make sure we're in the project directory
cd ${scripts_dir}/..

####################
# Build the bundle #
####################

policy-engine bundle create .

#####################
# Upload the bundle #
#####################

http_method='POST'
url="${custom_rules_endpoint}?version=${API_VERSION}"

if [[ -n "${bundle_id}" ]]; then
    http_method='PATCH'
    url="${custom_rules_endpoint}/${bundle_id}?version=${API_VERSION}"
elif [[ ${SKIP_DELETE} -lt 1 ]]; then
    ./scripts/remove_all.sh
fi

curl --silent -X "${http_method}" \
    -H "Authorization:${SNYK_TOKEN}" \
    -H 'Content-Type:application/octet-stream' \
    --data-binary '@./dist.tar.gz' \
    "${url}" \
    | jq