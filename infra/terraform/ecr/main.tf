terraform {
  required_version = ">= 1.5.0"
  required_providers { aws = { source = "hashicorp/aws", version = ">= 5.0" } }
}
provider "aws" { region = var.region }

resource "aws_ecr_repository" "this" {
  name = var.name
  image_scanning_configuration { scan_on_push = true }
  image_tag_mutability = "IMMUTABLE"
}

variable "region" { type = string }
variable "name"   { type = string }
output "repository_url" { value = aws_ecr_repository.this.repository_url }
