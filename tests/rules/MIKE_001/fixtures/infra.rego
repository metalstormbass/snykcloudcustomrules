package rules.MIKE_001.fixtures.infra

mock_input = {
	"format": "",
	"format_version": "",
	"input_type": "tf_hcl",
	"environment_provider": "iac",
	"meta": {"filepath": "tests/rules/MIKE_001/fixtures/infra.tf"},
	"resources": {"aws_s3_bucket": {
		"aws_s3_bucket.invalid": {
			"id": "aws_s3_bucket.invalid",
			"resource_type": "aws_s3_bucket",
			"namespace": "tests/rules/MIKE_001/fixtures/infra.tf",
			"meta": {},
			"attributes": {"bucket": "invalid"},
		},
		"aws_s3_bucket.valid": {
			"id": "aws_s3_bucket.valid",
			"resource_type": "aws_s3_bucket",
			"namespace": "tests/rules/MIKE_001/fixtures/infra.tf",
			"meta": {},
			"attributes": {
				"bucket": "valid",
				"tags": {"Owner": "Mike"},
			},
		},
	}},
	"scope": {"filepath": "tests/rules/MIKE_001/fixtures/infra.tf"},
}
