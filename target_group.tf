resource "aws_lb_target_group" "backend" {
  name     = "application-backend"
  port     = 8080
  protocol = "HTTP"
  vpc_id   = aws_vpc.my_vpc.id
  target_type = "instance"

  depends_on = [
    aws_lb.backend
  ]

  health_check {
    enabled = true
    healthy_threshold = 2
    interval = 30
    matcher = "302"
    path = "/"
    port = "traffic-port"
    protocol = "HTTP"
    timeout = 29
    unhealthy_threshold = 2
  }
}