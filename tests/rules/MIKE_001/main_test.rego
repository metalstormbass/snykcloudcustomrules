

package rules.MIKE_001

import data.lib.rule_tests
import data.rules.MIKE_001.fixtures

test_MIKE_001 {
	snapshot_testing.match(
		rule_tests.snapshot_deny_resources(deny, resources),
		"snapshots/infra.json",
	) with input as fixtures.infra.mock_input
}