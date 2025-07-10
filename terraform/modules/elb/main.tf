resource "aws_lb" "this" {
  name                       = var.alb_name
  load_balancer_type         = "application"
  subnets                    = var.public_subnet_ids
  security_groups            = var.alb_security_group_ids
  internal                   = var.alb_internal
  enable_deletion_protection = var.alb_deletion_protection
}


resource "aws_lb_target_group" "this" {
  name        = var.target_group_name
  port        = var.container_port
  protocol    = var.target_group_protocol
  vpc_id      = var.vpc_id
  target_type = "ip"

  health_check {
    path                = var.health_check_path
    interval            = var.health_check_interval
    timeout             = var.health_check_timeout
    healthy_threshold   = var.health_check_healthy_threshold
    unhealthy_threshold = var.health_check_unhealthy_threshold
    matcher             = var.health_check_matcher
  }
}

resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.this.arn
  port              = var.https_listener_port
  protocol          = var.https_listener_protocol

  ssl_policy      = var.ssl_policy
  certificate_arn = var.certificate_arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }
}

