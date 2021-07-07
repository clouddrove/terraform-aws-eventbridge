# EventBridge Bus
# EventBridge Bus


output "eventbridge_bus_arn" {
  description = "The EventBridge Bus Arn"
  value       = element(concat(aws_cloudwatch_event_bus.this.*.arn, [""]), 0)
}

# EventBridge Archive
output "eventbridge_archive_arns" {
  description = "The EventBridge Archive Arns created"
  value       = { for v in aws_cloudwatch_event_archive.this : v.name => v.arn }
}

# EventBridge Rule
output "eventbridge_rule_ids" {
  description = "The EventBridge Rule IDs created"
  value = {
    for p in sort(keys(var.rules)) : p => aws_cloudwatch_event_rule.this[p].id
  }
}

output "eventbridge_rule_arns" {
  description = "The EventBridge Rule ARNs created"
  value = {
    for p in sort(keys(var.rules)) : p => aws_cloudwatch_event_rule.this[p].arn
  }
}

output "tags" {
  value       = module.labels.tags
  description = "A mapping of tags to assign to the resource."
}
