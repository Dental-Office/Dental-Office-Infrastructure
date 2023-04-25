# Security group to allow SSH and HTTP access to VPC, and allow all traffic from VPC
resource "aws_security_group" "allow_http_ssh" {
 name = "allow_http_ssh"
 description = "Allow HTTP and SSH traffic"
 vpc_id = aws_vpc.my_vpc.id
  ingress {
   description      = "allow SSH"
   from_port        = 22
   to_port          = 22
   protocol         = "tcp"
   cidr_blocks      = ["0.0.0.0/0"]
  }
  ingress {
   description      = "allow web http"
   from_port        = 80
   to_port          = 80
   protocol         = "tcp"
   cidr_blocks      = ["0.0.0.0/0"]
  }
  ingress {
   description      = "allow postgreSQL"
   from_port        = 5432
   to_port          = 5432
   protocol         = "tcp"
   cidr_blocks      = ["0.0.0.0/0"]
  }
  egress {
   description      = "allow all traffic"
   from_port        = 0
   to_port          = 0
   protocol         = "-1"
   cidr_blocks      = ["0.0.0.0/0"]
  }
  tags = {Name = "allow_http_ssh"}
}

resource "aws_security_group" "rds_sg" {
 name = "rds_sg"
 vpc_id = aws_vpc.my_vpc.id
 ingress {
  from_port       = 5432
  to_port         = 5432
  protocol        = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
 }
 egress {
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
 }
 tags = {Name = "allow_5432_db"}
}