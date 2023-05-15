# Launch Template Resource
resource "aws_launch_template" "launchtemplate_back" {
  name     = "launchtemplate_back"
  image_id = "ami-009c5f630e96948cb"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow_http_ssh.id]
  # key_name               = "vockey"
  # update_default_version = ture
  user_data = base64encode(file("${path.module}/backend_app.sh"))                                                         
  monitoring {
    enabled = true
  }
  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "Backend_app"
    }
  }
}
                                                                                                      