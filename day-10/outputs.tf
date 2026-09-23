# =============================================================
# outputs.tf (ROOT MODULE)
# Access a module's outputs via: module.<call_name>.<output_name>
# =============================================================

output "blue_web_url" {
  description = "URL for the blue instance"
  value       = module.webapp_blue.web_url
}

output "green_web_url" {
  description = "URL for the green instance"
  value       = module.webapp_green.web_url
}

output "blue_bucket" {
  value = module.webapp_blue.bucket_name
}

output "green_bucket" {
  value = module.webapp_green.bucket_name
}
