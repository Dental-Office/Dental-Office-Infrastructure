resource "aws_db_subnet_group" "db_subnets" {
    name = "db_subnets"
    subnet_ids = [aws_subnet.private_subnet_1.id, aws_subnet.private_subnet_2.id]
  
}

# Create RDS database primary instance
resource "aws_db_instance" "dental_office_db" {
  identifier             = "dental-office"
  instance_class         = "db.t3.micro"
  db_name                = "patient"
  allocated_storage      = 20
  engine                 = "postgres"
  engine_version         = "14.6"
  username               = "postgres"
  password               = "password"
  db_subnet_group_name   = aws_db_subnet_group.db_subnets.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  availability_zone = var.availability_zone_1
  backup_retention_period = 7
  publicly_accessible    = true
  skip_final_snapshot    = true
}

Create RDS database replica
resource "aws_db_instance" "dental_office_db_replica" {
  identifier             = "dental-office-db-replica"
  instance_class         = "db.t3.micro"
  engine                 = "postgres"
  engine_version         = "14.6"
  db_subnet_group_name   = aws_db_subnet_group.db_subnets.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  availability_zone = var.availability_zone_2
  backup_retention_period = 7
  publicly_accessible    = true
  skip_final_snapshot    = true
  replicate_source_db   = aws_db_instance.dental_office_db.arn
}