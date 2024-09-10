terraform {
  required_version = "~> 1.5.7"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.49.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.31.0"
    }
  }
  backend "s3" {
    bucket         = "tcp-devops-1x19x"
    region         = "us-east-1"
    key            = "vpc/terraform.tfstate"
    dynamodb_table = "tcp-devops-state-lock-table"
    encrypt        = true
  }
}

provider "aws" {
  region = var.aws-region
}