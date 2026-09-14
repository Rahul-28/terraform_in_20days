# Day 8 — Remote State & Backends: Hands-on

## Part 1 — Create the backend infrastructure (one-time, uses LOCAL state)

1. In a separate folder (e.g. backend-setup/), place backend-setup.tf
   plus a basic provider.tf (region ap-south-1, no backend block).
2. terraform init
3. terraform apply
   -> creates the S3 bucket + DynamoDB lock table
4. Leave this state local — this small piece manages the backend
   itself, so it doesn't need to live IN the backend it creates.

## Part 2 — Migrate your Day 6/7 project to use the new backend

1. Copy your Day 6/7 files (provider.tf, variables.tf, locals.tf,
   main.tf, outputs.tf, terraform.tfvars) into a fresh folder.
2. Add backend.tf (this folder) to that same project.
3. Run: terraform init
   -> Terraform detects existing local state and asks to migrate it
   -> Type: yes
4. Check your local terraform.tfstate — it should now be a small
   pointer file, not the full state.
5. Open the S3 bucket in the AWS console — your real state file is
   there now, under the "day8/terraform.tfstate" key.

## Part 3 — See locking in action

1. Open two terminals, both in the same project folder.
2. In terminal 1: run terraform apply and pause it at the
   confirmation prompt (don't type yes yet).
3. In terminal 2: run terraform apply.
   -> You should see an error: state is locked, showing WHO holds
      the lock and WHEN it was acquired — instead of silently
      racing terminal 1.
4. Confirm terminal 1's apply, then try terminal 2 again — it
   should proceed normally now that the lock is released.

## Cleanup

terraform destroy   (on the Day 6/7 project, using the remote backend)
Then separately destroy the backend-setup resources last.
