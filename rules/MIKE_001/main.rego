package rules.MIKE_001

import data.snyk

resource_type := "MULTIPLE"

input_type := "tf"

metadata := {
	"id": "MIKE-001",
	"title": "All S3 Buckets must have an Owner",
	"severity": "critical",
	"description": "It is company policy to tag all S3 buckets with an owner",
	"product": ["iac"],
}

buckets := snyk.resources("aws_s3_bucket")

deny[info] {
    bucket := buckets[_]
    not bucket.tags.Owner
    info := {"resource": bucket}
}

resources[info] {
    bucket := buckets[_]
    info := {"resource": bucket}
}