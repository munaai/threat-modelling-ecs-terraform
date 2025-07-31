terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

resource "aws_security_group" "alb" {
  name        = var.alb_sg_name
  description = var.alb_sg_description
  vpc_id      = var.vpc_id

  ingress {
    from_port   = var.alb_ingress_http_from_port
    to_port     = var.alb_ingress_http_to_port
    protocol    = var.ingress_protocol
    cidr_blocks = var.alb_ingress_cidr_blocks
    description = "Allow HTTP ingress to ALB"
  }

  ingress {
    from_port   = var.alb_ingress_https_from_port
    to_port     = var.alb_ingress_https_to_port
    protocol    = var.ingress_protocol
    cidr_blocks = var.alb_ingress_cidr_blocks
    description = "Allow HTTPS ingress to ALB"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = var.egress_protocol
    cidr_blocks = var.alb_ingress_cidr_blocks
    description = "Allow all outbound traffic from ALB"
  }
}

resource "aws_security_group" "ecs" {
  name        = var.ecs_sg_name
  description = var.ecs_sg_description
  vpc_id      = var.vpc_id

  ingress {
    from_port       = var.ecs_ingress_from_port
    to_port         = var.ecs_ingress_to_port
    protocol        = var.ingress_protocol
    security_groups = [aws_security_group.alb.id]
    description     = "Allow traffic from ALB to ECS tasks"
  }

  egress {
    from_port   = var.ecs_egress_from_port
    to_port     = var.ecs_egress_to_port
    protocol    = var.egress_protocol
    cidr_blocks = var.ecs_egress_cidr_blocks
    description = "Allow ECS tasks to make outbound requests"
  }
}
