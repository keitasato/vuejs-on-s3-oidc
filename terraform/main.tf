# Config
terraform {
  required_version = ">=1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>4.0.0"
    }
  }
}

# Provider
provider "aws" {
  profile = "terraform"
  region  = "ap-northeast-1"
}

variable "project" {
  type = string
}

variable "environment" {
  type = string
}