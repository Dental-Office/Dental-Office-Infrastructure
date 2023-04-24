# Security group to allow HTTP access to VPC, and allow all traffic from VPC
resource "aws_security_group" "allow_http" {
 name = "allow_http"
 description = "Allow HTTP traffic"
 vpc_id = aws_vpc.my_vpc.id
#   ingress {
#    description      = "allow SSH"
#    from_port        = 22
#    to_port          = 22
#    protocol         = "tcp"
#    cidr_blocks      = ["0.0.0.0/0"]
#   }
  ingress {
   description      = "allow web http"
   from_port        = 80
   to_port          = 80
   protocol         = "tcp"
   cidr_blocks      = ["0.0.0.0/0"]
  }
  ingress {
   description      = "allow mySQL"
   from_port        = 3306
   to_port          = 3306
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
  tags = {Name = "allow_http"}
}

resource "aws_security_group" "ssh_access" {
    name = "allow_ssh"
    description = "Allow ssh access"

    ingress {
        description = "ssh_access"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }  
}

# resource "aws_security_group" "rds_sg" {
#  name = "rds_sg"
#  vpc_id = aws_vpc.my_vpc.id
#  ingress {
#   from_port       = 3306
#   to_port         = 3306
#   protocol        = "tcp"
#   cidr_blocks = ["0.0.0.0/0"]
#  }
#  egress {
#   from_port   = 0
#   to_port     = 0
#   protocol    = "-1"
#   cidr_blocks = ["0.0.0.0/0"]
#  }
#  tags = {Name = "allow_3306_db"}
# }