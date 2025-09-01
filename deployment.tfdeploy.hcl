identity_token "aws" {
  audience = ["aws.workload.identity"]
}

deployment "dev" {
  inputs = {
    aws_role_arn     = "arn:aws:iam::697621333100:role/may-webinar-role"
    identity_token   = identity_token.aws.jwt
    environment      = "dev"
  }
}


publish_output "vpc_id" {
  description = "The networking Stack's VPC's ID."
  value       = deployment.dev.vpc_id
}