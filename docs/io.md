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

