component "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.8.1"

  providers = {
    aws = provider.aws.source
  }

  inputs = {
    name = "main-vpc"
    cidr = "10.0.0.0/18"

    azs             = ["us-west-2a", "us-west-2b"]
    private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
    public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

    enable_nat_gateway = true
    enable_vpn_gateway = false

    tags = {
      Environment = var.environment
    }
  }
}

output "vpc_id"{
  type = string
  value = component.vpc.vpc_id
}