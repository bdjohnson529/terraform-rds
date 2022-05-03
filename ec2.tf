module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "single-instance"

  ami                    = "ami-0cb4e786f15603b0d"
  instance_type          = "t3.micro"
  key_name               = "retool-key"
  monitoring             = true
  vpc_security_group_ids = [module.vpc.default_security_group_id]
  subnet_id              = data.aws_subnet.a.id

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

