# Terraform in 20 Days

A structured learning roadmap to help you go from Terraform beginner to job-ready practitioner through daily concepts, practical examples, and hands-on projects.

This repository is built around a 20-day learning plan designed for real-world understanding, not just theory. Each day focuses on one core Terraform topic, followed by an ELI5 explanation, a real-world example, and a mini hands-on task.

---

## Why this roadmap?

Terraform is one of the most important tools in cloud automation and infrastructure engineering. It helps teams define infrastructure as code, manage cloud resources consistently, and reduce manual errors.

This roadmap is designed to:

- build a strong foundation in Terraform fundamentals
- introduce state, modules, variables, and outputs step by step
- include hands-on projects and real use cases
- prepare you for production-ready infrastructure workflows
- help you share your learning journey through LinkedIn posts

---

## Learning format

Each daily post follows this pattern:

1. Topic
2. ELI5 explanation
3. Real-world example
4. Hands-on mini task

This approach keeps the content simple, practical, and easy to understand while still covering the technical depth needed for real projects.

---

## Repository objective

The goal of this repository is to document a complete Terraform learning journey across 20 days, with:

- short, readable explanations
- practical cloud examples
- step-by-step tasks
- weekend projects
- a final capstone project

---

## Prerequisites

Before starting, it is helpful to have:

- basic understanding of cloud computing concepts
- familiarity with at least one major cloud provider (AWS, Azure, or GCP)
- access to a cloud account for hands-on labs
- Terraform installed locally
- a GitHub repository to track your progress

---

## Roadmap overview

### Week 1 — Foundations (Days 1–6)

#### Day 1 — What is IaC and Why Terraform?

- Understand Infrastructure as Code (IaC)
- Compare imperative vs declarative approaches
- Learn when Terraform fits compared to Ansible, CloudFormation, and Pulumi
- Understand the Terraform workflow: plan → apply → state
- Task: install Terraform, run `terraform -version`, and create a hello world local file resource

#### Day 2 — Providers and Basic Setup

- Learn what a provider is
- Understand provider blocks and registry usage
- Configure a provider for AWS, Azure, or GCP
- Explore authentication options such as CLI profiles, environment variables, and access keys
- Task: configure a provider, run `terraform init`, and inspect the `.terraform` folder

#### Day 3 — HCL Syntax Basics

- Learn blocks, arguments, and expressions
- Understand core data types: string, number, bool, list, map, and object
- Practice comments and formatting
- Use `terraform fmt` and `terraform validate`
- Task: create a config with multiple variable types and validate formatting

#### Day 4 — Resources Deep Dive

- Understand resource blocks and resource addressing
- Learn the Terraform lifecycle: plan, apply, and destroy
- Explore implicit and explicit dependencies
- Task: create an S3 bucket and EC2 instance with implicit dependency

#### Day 5 — Variables and tfvars

- Use input variables, validation, and default values
- Understand `.tfvars` files and variable precedence
- Learn when to use CLI variables, environment variables, and tfvars files
- Task: refactor a previous project using `variables.tf` and `terraform.tfvars`

#### Day 6 — Outputs and Locals

- Learn why outputs matter for chaining values across modules and pipelines
- Use locals to reduce repetition and improve readability
- Task: add useful outputs like public IP and bucket ARN, plus two locals for naming conventions

Weekend Project 1:

- Build a simple 2-tier setup using VPC, EC2, and Security Group
- Include variables, locals, and outputs

---

### Week 2 — State, Modules, and Logic (Days 7–13)

#### Day 7 — Terraform State Fundamentals

- Understand what the state file is and why Terraform depends on it
- Learn how resources are mapped to state entries
- Explore drift between real infrastructure and state
- Use `terraform state list`, `show`, and `rm`
- Task: inspect a state file and manually review resource mappings

#### Day 8 — Remote State and Backends

- Understand the risks of local state in team environments
- Learn how S3 and DynamoDB work together for remote state and locking
- Explore encryption and backend safety best practices
- Task: migrate local state to an S3 backend with DynamoDB locking

#### Day 9 — Provisioners and Data Sources

- Understand `remote-exec` and `local-exec`
- Learn when to avoid provisioners and prefer managed configuration methods
- Compare data sources with resources
- Task: use a data source to fetch the latest AMI and launch an EC2 instance with it

#### Day 10 — Modules Basics

- Learn why modules are important for reusability and consistency
- Understand root and child modules
- Learn how module inputs and outputs are passed
- Task: convert the weekend project into a reusable Terraform module

#### Day 11 — Modules Advanced and the Registry

- Explore public Terraform modules and versioning
- Learn module composition patterns and nested modules
- Task: use an official registry module such as `terraform-aws-modules/vpc`

#### Day 12 — Meta-Arguments: count and for_each

- Understand when to use `count` vs `for_each`
- Learn how to create multiple similar resources without duplication
- Task: create three EC2 instances using a `for_each` map of instance configs

#### Day 13 — Conditionals, Dynamic Blocks, and Functions

- Use conditional expressions
- Learn how dynamic blocks reduce repetitive configuration
- Explore built-in functions such as `lookup`, `merge`, `join`, and `cidrsubnet`
- Task: add dynamic security group rules using a dynamic block

Weekend Project 2:

- Build a modular 3-tier architecture with network, compute, and database components
- Use `for_each` and dynamic blocks for scalable resource creation

---

### Week 3 — Production Skills and Capstone (Days 14–20)

#### Day 14 — Workspaces and Environment Management

- Understand the difference between Terraform workspaces and separate state files
- Learn how to manage dev, staging, and prod environments
- Task: create two workspaces for a single configuration

#### Day 15 — Import and State Manipulation

- Learn how to bring existing infrastructure under Terraform control with `terraform import`
- Understand `terraform state mv` for safe refactoring
- Task: import a manually created S3 bucket into Terraform state

#### Day 16 — Terraform in CI/CD

- Learn how to integrate Terraform with GitHub Actions or GitLab CI
- Understand PR-based planning and approval-based apply workflows
- Task: build a pipeline that runs a plan on pull requests and apply on merge

#### Day 17 — Security and Policy as Code

- Learn how to manage secrets safely and never hardcode credentials
- Use tools like `tfsec` and `checkov` for security scanning
- Explore policy-as-code concepts with Sentinel and OPA
- Task: run `tfsec` against the project and fix flagged issues

#### Day 18 — Best Practices and Enterprise Patterns

- Learn standard project organization for large teams
- Understand Terraform Cloud and enterprise workflows
- Review versioning, module registries, and code review practices
- Task: restructure a project into a standard layout such as `main.tf`, `variables.tf`, `outputs.tf`, and `versions.tf`

#### Day 19–20 — Capstone Project

Build a production-ready multi-tier cloud infrastructure project that combines all of the concepts learned:

- reusable modules (network, compute, database, security)
- remote backend with state locking
- multi-environment setup using workspaces
- `for_each` and dynamic blocks for scalable design
- security scanning with passing checks
- CI/CD pipeline for plan and apply automation
- complete README and architecture documentation
- LinkedIn post summarizing lessons learned and the final result

---

## Quick reference table

| Day | Theme |
| --- | --- |
| 1 | IaC & Why Terraform |
| 2 | Providers & Setup |
| 3 | HCL Syntax Basics |
| 4 | Resources Deep Dive |
| 5 | Variables & tfvars |
| 6 | Outputs & Locals |
| Weekend Project 1 | 2-tier architecture |
| 7 | State Fundamentals |
| 8 | Remote State & Backends |
| 9 | Provisioners & Data Sources |
| 10 | Modules Basics |
| 11 | Modules Advanced + Registry |
| 12 | count & for_each |
| 13 | Conditionals, Dynamic Blocks, Functions |
| Weekend Project 2 | 3-tier architecture |
| 14 | Workspaces |
| 15 | Import & State Manipulation |
| 16 | CI/CD Integration |
| 17 | Security & Policy as Code |
| 18 | Best Practices & Enterprise Patterns |
| 19–20 | Capstone Project |

---

## Suggested learning flow

To get the most value from this roadmap:

- complete one day at a time
- practice the mini task before moving forward
- document your learning in your own notes or blog posts
- build a small project each weekend to reinforce concepts
- avoid skipping the state and module topics, as they are critical for real-world Terraform work

---

## Outcome

By the end of this 20-day journey, you should be able to:

- explain what Terraform is and how it works
- write real Terraform configurations using HCL
- manage variables, outputs, locals, and state
- use modules to structure reusable infrastructure code
- apply security and CI/CD practices for real projects
- confidently build and explain a production-style cloud architecture

---

## Next step

When you are ready, choose a day number and continue with a detailed LinkedIn post for that topic, including an ELI5 explanation, a real-world use case, and a hands-on task.

This repository is designed to be a practical, public learning log for your Terraform journey.
