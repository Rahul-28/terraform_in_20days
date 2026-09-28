# Day 12 — count vs for_each: Hands-on

Two folders, same idea, different mechanics:
- count-version/   -> resources numbered by position
- foreach-version/ -> resources keyed by name

## Steps

### 1. count-version/
    terraform init
    terraform apply
    -> creates web-1, web-2, web-3 as aws_instance.server[0/1/2]

Now edit variables.tf (or override server_names) to remove "web-2"
from the middle of the list:
    default = ["web-1", "web-3"]

    terraform plan

Watch the output closely: it's not a clean "destroy index 1."
Because index 2 ("web-3") now shifts to index 1, Terraform sees
BOTH index 1 and index 2 as changed and plans to destroy/recreate
them — even though "web-3" itself didn't need to change at all.

### 2. foreach-version/
    terraform init
    terraform apply
    -> creates aws_instance.server["web-1"], ["web-2"], ["web-3"]

Now remove "web-2" from the servers map:
    default = {
      "web-1" = "t2.micro"
      "web-3" = "t2.small"
    }

    terraform plan

This time: ONLY aws_instance.server["web-2"] is planned for
destruction. "web-1" and "web-3" show zero changes.

## The takeaway
count = position-based identity -> fragile when the list changes shape
for_each = name-based identity -> stable when individual items change

## Cleanup
Run terraform destroy in both folders when done.
