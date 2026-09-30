output "resolved_instance_type" {
  description = "Instance type chosen by the conditional expression"
  value       = aws_instance.demo_server.instance_type
}

output "ingress_ports_opened" {
  description = "Ports opened by the dynamic block — add/remove entries in ingress_rules to see this change"
  value       = [for rule in var.ingress_rules : rule.port]
}

output "merged_tags" {
  description = "Result of merge() combining common_tags with extra_tags"
  value       = local.common_tags
}
