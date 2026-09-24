output "vpc_id" {
  description = "ID of the VPC created by the registry module"
  value       = module.vpc.vpc_id
}

output "public_subnets" {
  description = "Public subnet IDs from the registry module"
  value       = module.vpc.public_subnets
}

output "webapp_blue_url" {
  description = "URL for the webapp instance placed inside the VPC"
  value       = module.webapp_blue.web_url
}
