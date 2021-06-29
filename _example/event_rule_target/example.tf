provider "aws" {
  region = "eu-west-1"
}


resource "random_pet" "this" {
  length = 2
}


resource "aws_sqs_queue" "queue" {
  name = "${random_pet.this.id}-queue"
}
resource "aws_sqs_queue" "dlq" {
  name = "${random_pet.this.id}-dlq"
}

module "eventbridge" {
  source = "../../"

  name        = "subnets"
  environment = "test"
  label_order = ["name", "environment"]

  bus_name = "test"
  rules = {
    orders = {
      description   = "Capture all order data"
      event_pattern = jsonencode({ "source" : ["myapp.orders"] })
      enabled       = true
      role_arn      = module.iam-role.arn
    }
    emails = {
      description   = "Capture all emails data"
      event_pattern = jsonencode({ "source" : ["myapp.emails"] })
      enabled       = true
    }
  }
  targets = {
    orders = [
      {
        name            = "send-orders-to-sqs-wth-dead-letter"
        arn             = aws_sqs_queue.queue.arn
        dead_letter_arn = aws_sqs_queue.dlq.arn
      },
      {
        name = "send-orders-to-sqs"
        arn  = aws_sqs_queue.queue.arn
      }
    ]
    emails = [
      {
        name            = "send-orders-to-kinesis"
        dead_letter_arn = aws_sqs_queue.dlq.arn
        arn             = aws_sqs_queue.dlq.arn

      }
    ]
  }
}
