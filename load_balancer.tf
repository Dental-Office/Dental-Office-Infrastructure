resource "aws_lb" "backend" {
  name = "backend"
  internal = false 
  load_balancer_type = "application"
  subnets            = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id]
  security_groups    = [aws_security_group.allow_http_ssh.id]

  enable_deletion_protection = false 

  tags = {
    Environment = "front" 
  }
}