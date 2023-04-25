resource "aws_db_subnet_group" "db_subnets" {
    name = "db_subnets"
    subnet_ids = [aws_subnet.private_subnet_1.id, aws_subnet.private_subnet_2.id]
  
}

resource "aws_db_instance" "dental_office_db" {
  identifier             = "dental-office-db"
  instance_class         = "db.t3.micro"
  allocated_storage      = 5
  engine                 = "postgres"
  engine_version         = "14.1"
  username               = "dental_office_db"
  password               = "password"
  db_subnet_group_name   = aws_db_subnet_group.db_subnets.name
#   subnet_id              = [aws_subnet.private_subnet_1.id, aws_subnet.private_subnet_2.id]
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
#   parameter_group_name   = aws_db_parameter_group.education.name
  publicly_accessible    = false
  skip_final_snapshot    = true
}