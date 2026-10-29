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

output "eventbridge_global_endpoint_arns" {
  description = "The EventBridge Global Endpoint ARNs created"
  value       = { for name, endpoint in aws_cloudwatch_event_endpoint.this : name => endpoint.arn }
}

output "eventbridge_global_endpoint_urls" {
  description = "The EventBridge Global Endpoint URLs created"
  value       = { for name, endpoint in aws_cloudwatch_event_endpoint.this : name => endpoint.endpoint_url }
}

# EventBridge Rule
output "eventbridge_rule_ids" {
  description = "The EventBridge Rule IDs created"
  value       = { for name, rule in aws_cloudwatch_event_rule.this : name => rule.id }
}

output "eventbridge_rule_arns" {
  description = "The EventBridge Rule ARNs created"
  value       = { for name, rule in aws_cloudwatch_event_rule.this : name => rule.arn }
}

output "tags" {
  value       = local.tags
  description = "A mapping of tags to assign to the resource."
}
