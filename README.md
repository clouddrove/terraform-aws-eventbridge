<!-- This file was automatically generated by the `geine`. Make all changes to `README.yaml` and run `make readme` to rebuild this file. -->


<h1 align="center">
    Terraform AWS eventbridge
</h1>

<p align="center" style="font-size: 1.2rem;"> 
    Terraform module is used to create eventbridge resource on AWS for network connectivity..
     </p>

<p align="center">

<a href="https://www.terraform.io">
  <img src="https://img.shields.io/badge/Terraform-v0.15-green" alt="Terraform">
</a>
<a href="LICENSE.md">
  <img src="https://img.shields.io/badge/License-MIT-blue.svg" alt="Licence">
</a>


</p>
<p align="center">

<a href='https://facebook.com/sharer/sharer.php?u=https://github.com/clouddrove/terraform-aws-eventbridge'>
  <img title="Share on Facebook" src="https://user-images.githubusercontent.com/50652676/62817743-4f64cb80-bb59-11e9-90c7-b057252ded50.png" />
</a>
<a href='https://www.linkedin.com/shareArticle?mini=true&title=Terraform+AWS+eventbridge&url=https://github.com/clouddrove/terraform-aws-eventbridge'>
  <img title="Share on LinkedIn" src="https://user-images.githubusercontent.com/50652676/62817742-4e339e80-bb59-11e9-87b9-a1f68cae1049.png" />
</a>
<a href='https://twitter.com/intent/tweet/?text=Terraform+AWS+eventbridge&url=https://github.com/clouddrove/terraform-aws-eventbridge'>
  <img title="Share on Twitter" src="https://user-images.githubusercontent.com/50652676/62817740-4c69db00-bb59-11e9-8a79-3580fbbf6d5c.png" />
</a>

</p>
<hr>





## Prerequisites

This module has a few dependencies: 








**IMPORTANT:** Since the `master` branch used in `source` varies based on new modifications, we suggest that you use the release versions [here](https://github.com/clouddrove/terraform-aws-eventbridge/releases).


### event_bus_archive
Here is an example of how you can use this module in your inventory structure:
  ```hcl
    module "eventbridge_archive" {

      create_bus      = true
      create_archives = true

      name        = "bus"
      environment = "test"
      label_order = ["name", "environment"]


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
  ```

### event_rule_target
```hcl
   module "eventbridge" {

      name        = "subnets"
      environment = "test"
      label_order = ["name", "environment"]

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
```






## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| archives | A map of objects with the EventBridge Archive definitions. | `map(any)` | `{}` | no |
| create | Controls whether resources should be created | `bool` | `true` | no |
| create\_archives | Controls whether EventBridge Archive resources should be created | `bool` | `false` | no |
| create\_bus | Controls whether EventBridge Bus resource should be created | `bool` | `true` | no |
| create\_permissions | Controls whether EventBridge Permission resources should be created | `bool` | `true` | no |
| create\_role | Controls whether IAM role for Lambda Function should be created | `bool` | `true` | no |
| create\_rules | Controls whether EventBridge Rule resources should be created | `bool` | `true` | no |
| create\_targets | Controls whether EventBridge Target resources should be created | `bool` | `true` | no |
| environment | Environment (e.g. `prod`, `dev`, `staging`). | `string` | `""` | no |
| label\_order | Label order, e.g. `name`,`application`. | `list(any)` | `[]` | no |
| name | Name  (e.g. `app` or `cluster`). | `string` | `""` | no |
| permissions | A map of objects with EventBridge Permission definitions. | `map(any)` | `{}` | no |
| repository | Terraform current module repo | `string` | `"https://github.com/clouddrove/terraform-aws-eventbridge"` | no |
| rules | A map of objects with EventBridge Rule definitions. | `map(any)` | `{}` | no |
| tags | A map of tags to assign to resources. | `map(string)` | `{}` | no |
| targets | A map of objects with EventBridge Target definitions. | `any` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| eventbridge\_archive\_arns | The EventBridge Archive Arns created |
| eventbridge\_bus\_arn | The EventBridge Bus Arn |
| eventbridge\_rule\_arns | The EventBridge Rule ARNs created |
| eventbridge\_rule\_ids | The EventBridge Rule IDs created |
| tags | A mapping of tags to assign to the resource. |






## Feedback 
If you come accross a bug or have any feedback, please log it in our [issue tracker](https://github.com/clouddrove/terraform-aws-eventbridge/issues), or feel free to drop us an email at [hello@clouddrove.com](mailto:hello@clouddrove.com).

If you have found it worth your time, go ahead and give us a ★ on [our GitHub](https://github.com/clouddrove/terraform-aws-eventbridge)!

## About us

At [CloudDrove][website], we offer expert guidance, implementation support and services to help organisations accelerate their journey to the cloud. Our services include docker and container orchestration, cloud migration and adoption, infrastructure automation, application modernisation and remediation, and performance engineering.

<p align="center">We are <b> The Cloud Experts!</b></p>
<hr />
<p align="center">We ❤️  <a href="https://github.com/clouddrove">Open Source</a> and you can check out <a href="https://github.com/clouddrove">our other modules</a> to get help with your new Cloud ideas.</p>

  [website]: https://clouddrove.com
  [github]: https://github.com/clouddrove
  [linkedin]: https://cpco.io/linkedin
  [twitter]: https://twitter.com/clouddrove/
  [email]: https://clouddrove.com/contact-us.html
  [terraform_modules]: https://github.com/clouddrove?utf8=%E2%9C%93&q=terraform-&type=&language=
