required_providers {
  aws = {
    source  = "hashicorp/aws"
    version = "~> 5.0"
  }
}

provider "aws" "source" {
  config {
    region = "us-west-2"
    assume_role_with_web_identity {
      role_arn           = var.aws_role_arn
      web_identity_token = var.identity_token
    }
  }
}

