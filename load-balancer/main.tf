###
# Author: Justin Quijano
# Class: SYST35144 Cloud Systems
# Lab 3 - Terraform
###

# Create launching configuration
resource "aws_launch_configuration" "Cluster-Hydrohomie" {
  image_id        = var.ami
  instance_type   = var.instance_type
  security_groups = [var.security_group_id]
  user_data       = file("./user-data.sh")
  lifecycle {
    create_before_destroy = true
  }
}

# Create autoscaling group
resource "aws_autoscaling_group" "ASG-Hydrohomie" {
  launch_configuration = aws_launch_configuration.Cluster-Hydrohomie.name
  vpc_zone_identifier  = data.aws_subnet_ids.VPC-Hydrohomie.ids
  target_group_arns    = [aws_lb_target_group.TG-Hydrohomie.arn]
  health_check_type    = "ELB"
  min_size             = 2
  max_size             = 4
  tag {
    key                 = "Name"
    value               = "ASG-Hydrohomie"
    propagate_at_launch = true
  }
}

# Create load balancer
resource "aws_lb" "LB-Hydrohomie" {
  name               = "LB-Hydrohomie"
  load_balancer_type = "application"
  subnets            = var.subnet_ids
  security_groups    = [var.security_group_id]
}

# Create load balancer listener
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.LB-Hydrohomie.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type = "fixed-response"
    fixed_response {
      content_type = "text/plain"
      message_body = "404: page not found"
      status_code  = 404
    }
  }
}

# Create target group
resource "aws_lb_target_group" "TG-Hydrohomie" {
  name     = "TG-Hydrohomie"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 15
    timeout             = 3
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}

# Create load balancer listener rule
resource "aws_lb_listener_rule" "Listener-Hydrohomie" {
  listener_arn = aws_lb_listener.http.arn
  priority     = 100
  condition {
    path_pattern {
      values = ["*"]
    }
  }
  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.TG-Hydrohomie.arn
  }
}

