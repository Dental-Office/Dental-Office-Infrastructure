resource "aws_lb_listener" "backend" {
    load_balancer_arn = aws_lb.backend.arn 
    port = 80
    protocol = "HTTP"

    depends_on = [
      aws_lb.backend
    ]

    default_action {
        type = "forward" 
        target_group_arn = aws_lb_target_group.backend.arn
    }
  
}