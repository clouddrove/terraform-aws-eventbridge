provider "aws" {
  region = "eu-west-1"
}

module "eventbridge_archive" {
  source = "../../"

  create_bus      = true
  create_archives = true

  bus_name = "clouddrove-bus"


  archives = {
    "launch-archive-existing-bus" = {
      description    = "launch-archive",
      retention_days = 1
      event_pattern = jsonencode(
        {
          "source" : ["aws.autoscaling"],
          "detail-type" : ["EC2 Instance Launch Successful"]
        }
      )
    }
  }

}
