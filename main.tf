resource "aws_iam_policy" "this" {
  name = "SymKinesisFirehose${title(var.environment)}"
  path = "/sym/"

  description = "AWS IAM Policy granting permissions to publish to Kinesis Firehose"
  policy      = <<EOT
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "firehose:PutRecord",
        "firehose:PutRecordBatch"
      ],
      "Resource": "*",
      "Condition": { "StringEquals": { "firehose:ResourceTag/${var.tag_name}": "${var.environment}" } }
    },
    {
      "Effect": "Allow",
      "Action": [
        "firehose:ListDeliveryStreams"
      ],
      "Resource": "*"
    }
  ]
}
EOT
}

resource "aws_iam_role_policy_attachment" "attach_firehose_access" {
  # If an IAM Role is specified, then attach the policy to that IAM Role.
  count = var.iam_role_name != "" ? 1 : 0

  policy_arn = aws_iam_policy.this.arn
  role       = var.iam_role_name
}
