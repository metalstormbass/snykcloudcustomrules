export SNYK_API="${SNYK_API:-https://api.snyk.io}"
export API_VERSION="${API_VERSION:-2022-12-21~beta}"
export custom_rules_endpoint="${SNYK_API}/hidden/orgs/${SNYK_ORG_ID}/cloud/custom_rules"

#############################################
# Validate pre-requisites and configuration #
#############################################

if ! command -v policy-engine &> /dev/null; then
    echo 'error: policy-engine must be in PATH to use this script'
    exit 1
fi

if ! command -v jq &> /dev/null; then
    echo 'error: jq must be in PATH to use this script'
    exit 1
fi

if [[ -z "${SNYK_ORG_ID}" ]]; then
    echo 'error: SNYK_ORG_ID environment variable must be set'
fi

if [[ -z "${SNYK_TOKEN}" ]]; then
    echo 'error: SNYK_TOKEN environment variable must be set'
fi