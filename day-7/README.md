# Day 7 — State Fundamentals: Hands-on

No new resources today — this task is about UNDERSTANDING the state
file behind the Day 6 infrastructure, not building something new.

Files here are identical to Day 6 (provider.tf, variables.tf, locals.tf,
main.tf, outputs.tf, terraform.tfvars).

## Steps

1. terraform init
2. terraform apply
   -> creates terraform.tfstate in this folder

3. Open terraform.tfstate in any text editor.
   Look for:
   - "resources" array
   - each resource's real attributes (id, arn, public_ip, etc.)
   Compare it to what's written in main.tf — notice main.tf has NO
   real IDs or IPs. Those only exist in the state file.

4. terraform state list
   -> lists every resource Terraform is tracking

5. terraform state show aws_s3_bucket.demo_bucket
   -> full real-world attributes for that one resource

6. DRIFT EXPERIMENT (optional, only on throwaway resources):
   - Go into the AWS console
   - Manually change a tag on the EC2 instance or bucket
   - Run: terraform plan
   -> Terraform will show the drift it detected between state and reality

7. Clean up when done:
   terraform destroy
