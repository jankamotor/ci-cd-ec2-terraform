terraform {
  required_version = ">= 1.1.3"
}
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.33.0"
    }
  }
}