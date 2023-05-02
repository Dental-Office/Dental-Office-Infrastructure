resource "aws_db_subnet_group" "db_subnets" {
    name = "db_subnets"
    subnet_ids = [aws_subnet.private_subnet_1.id, aws_subnet.private_subnet_2.id]
  
}

# Create RDS database primary instance
resource "aws_db_instance" "dental_office_db" {
  identifier             = "dental-office-db"
  instance_class         = "db.t3.micro"
  allocated_storage      = 20
  engine                 = "postgres"
  engine_version         = "14.6"
  username               = "dental_office_db"
  password               = "password"
  db_subnet_group_name   = aws_db_subnet_group.db_subnets.name
#   subnet_id              = [aws_subnet.private_subnet_1.id, aws_subnet.private_subnet_2.id]
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
#   parameter_group_name   = aws_db_parameter_group.education.name
  # availability_zone = var.availability_zone_1
  multi_az = true 
  backup_retention_period = 7
  publicly_accessible    = false
  skip_final_snapshot    = true
}

# Create RDS ddatabase replica
# resource "aws_db_instance" "dental_office_db_replica" {
#   identifier             = "dental-office-db-replica"
#   instance_class         = "db.t3.micro"
#   allocated_storage      = 20
#   engine                 = "postgres"
#   engine_version         = "14.6"
#   db_subnet_group_name   = aws_db_subnet_group.db_subnets.name
# #   subnet_id              = [aws_subnet.private_subnet_1.id, aws_subnet.private_subnet_2.id]
#   vpc_security_group_ids = [aws_security_group.rds_sg.id]
# #   parameter_group_name   = aws_db_parameter_group.education.name
#   availability_zone = var.availability_zone_2
#   multi_az = true 
#   backup_retention_period = 7
#   publicly_accessible    = false
#   skip_final_snapshot    = true
#   replicate_source_db   = aws_db_instance.dental_office_db.arn
# }