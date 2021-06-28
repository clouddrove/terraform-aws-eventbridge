provider "aws" {
  region = "eu-west-1"
}

resource "aws_cloudwatch_event_bus" "existing_bus" {
  name = "${random_pet.this.id}-existing-bus"
}

resource "random_pet" "this" {
  length = 2
}

module "eventbridge_archive_only" {
  source = "../../"

  create_bus      = false
  create_archives = true

  archives = {
    "launch-archive-existing-bus" = {
      event_source_arn = aws_cloudwatch_event_bus.existing_bus.arn
      description      = "${random_pet.this.id}-launch-archive",
      retention_days   = 1
      event_pattern = jsonencode(
        {
          "source" : ["aws.autoscaling"],
          "detail-type" : ["EC2 Instance Launch Successful"]
        }
      )
    }
  }

  depends_on = [aws_cloudwatch_event_bus.existing_bus]
}

