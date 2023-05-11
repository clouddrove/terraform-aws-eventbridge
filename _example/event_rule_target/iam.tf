module "iam-role" {
  source  = "clouddrove/iam-role/aws"
  version = "1.3.0"

  name               = "iam-role"
  environment        = "eventbridge"
  label_order        = ["environment", "name"]
  assume_role_policy = data.aws_iam_policy_document.default.json

  policy_enabled = true
  policy         = data.aws_iam_policy_document.iam-policy.json
}

data "aws_iam_policy_document" "default" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = distinct(concat(["events.amazonaws.com"], ["events.amazonaws.com"]))
    }
  }
}

data "aws_iam_policy_document" "iam-policy" {
  statement {
    sid     = "eventspolicy"
    actions = ["sqs:SendMessage"]

    resources = [
      aws_sqs_queue.queue.arn,
      aws_sqs_queue.dlq.arn
    ]
  }
}
