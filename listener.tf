resource "aws_lb_listener" "backend" {
    load_balancer_arn = aws_lb.backend.arn 
    port = 8080
    protocol = "HTTP"

    default_action {
        type = "forward" 
        target_group_arn = aws_lb_target_group.backend.arn
    }
  
}