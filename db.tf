module "db" {
  source  = "terraform-aws-modules/rds/aws"

  identifier = "demodb"

  engine            = "postgres"
  engine_version    = "12"
  instance_class    = "db.t3.medium"
  allocated_storage = 5

  db_name  = "demodb"
  username = "retool"
  port     = "3306"

  iam_database_authentication_enabled = true

  vpc_security_group_ids = [module.vpc.default_security_group_id]

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"

  tags = {
    Owner       = "user"
    Environment = "dev"
  }

  # DB subnet group
  create_db_subnet_group = true
  subnet_ids             = [data.aws_subnet.a.id, data.aws_subnet.b.id, data.aws_subnet.c.id]

  # Database Deletion Protection
  deletion_protection = true

  family = "postgres12"

}