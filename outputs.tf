output "network_rule_id" {
  description = "The ID of the network rule."
  value       = snowflake_network_rule.this.id
}

output "network_rule_name" {
  description = "The name of the network rule."
  value       = snowflake_network_rule.this.name
}

output "network_rule_type" {
  description = "The type of the network rule."
  value       = snowflake_network_rule.this.type
}
