## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| archives | A map of objects with the EventBridge Archive definitions. | `map(any)` | `{}` | no |
| bus\_dead\_letter\_arn | ARN of an SQS queue used as the event bus dead-letter queue. | `string` | `null` | no |
| bus\_description | Description for the event bus created by this module. | `string` | `null` | no |
| bus\_log\_config | Optional event bus logging configuration; requires AWS provider 6.6.0 or later. | `object(...)` | `null` | no |
| bus\_name | Optional event bus name; defaults to the generated label for a created bus and `default` otherwise. | `string` | `null` | no |
| create | Controls whether resources should be created | `bool` | `true` | no |
| create\_archives | Controls whether EventBridge Archive resources should be created | `bool` | `false` | no |
| create\_bus | Controls whether EventBridge Bus resource should be created | `bool` | `true` | no |
| create\_endpoints | Controls whether EventBridge Global Endpoint resources should be created | `bool` | `false` | no |
| create\_permissions | Controls whether EventBridge Permission resources should be created | `bool` | `true` | no |
| create\_role | Controls whether IAM role for Lambda Function should be created | `bool` | `true` | no |
| create\_rules | Controls whether EventBridge Rule resources should be created | `bool` | `true` | no |
| create\_targets | Controls whether EventBridge Target resources should be created | `bool` | `true` | no |
| environment | Environment (e.g. `prod`, `dev`, `staging`). | `string` | `""` | no |
| endpoints | Global endpoint definitions; each requires two event bus ARNs, a primary Route 53 health check ARN, and a secondary Region. | `map(object(...))` | `{}` | no |
| event\_source\_name | Partner event source name to associate with the event bus; it must match `bus_name`. | `string` | `null` | no |
| extra\_tags | Additional tags (e.g. map(`BusinessUnit`,`XYZ`). | `map(string)` | `{}` | no |
| label\_order | Label order, e.g. `name`,`application`. | `list(any)` | `[]` | no |
| kms\_key\_identifier | Customer managed KMS key identifier for encrypting events on the event bus. | `string` | `null` | no |
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
| eventbridge\_global\_endpoint\_arns | The EventBridge Global Endpoint ARNs created |
| eventbridge\_global\_endpoint\_urls | The EventBridge Global Endpoint URLs created |
| eventbridge\_rule\_arns | The EventBridge Rule ARNs created |
| eventbridge\_rule\_ids | The EventBridge Rule IDs created |
| tags | A mapping of tags to assign to the resource. |

