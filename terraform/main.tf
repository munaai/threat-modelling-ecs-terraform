module "iam" {
  source = "./modules/iam"

  role_name      = var.role_name
  assume_service = var.assume_service
  policy_name    = var.policy_name
}
module "security_groups" {
  source = "./modules/security_groups"

  alb_sg_name                 = var.alb_sg_name
  alb_sg_description          = var.alb_sg_description
  vpc_id                      = module.vpc.vpc_id
  alb_ingress_http_from_port  = var.alb_ingress_http_from_port
  alb_ingress_http_to_port    = var.alb_ingress_http_to_port
  alb_ingress_cidr_blocks     = var.alb_ingress_cidr_blocks
  alb_ingress_https_from_port = var.alb_ingress_https_from_port
  alb_ingress_https_to_port   = var.alb_ingress_https_to_port
  ecs_egress_cidr_blocks      = var.ecs_egress_cidr_blocks
  ecs_sg_name                 = var.ecs_sg_name
  ecs_sg_description          = var.ecs_sg_description
  ecs_ingress_from_port       = var.ecs_ingress_from_port
  ecs_ingress_to_port         = var.ecs_ingress_to_port
  ecs_egress_from_port        = var.ecs_egress_from_port
  ecs_egress_to_port          = var.ecs_egress_to_port
  ingress_protocol            = var.ingress_protocol
  egress_protocol             = var.egress_protocol
}
module "ecs" {
  source = "./modules/ecs_fargate"

  cluster_name          = var.cluster_name
  service_name          = var.service_name
  cluster_insight_name  = var.cluster_insight_name
  cluster_insight_value = var.cluster_insight_value
  desired_count         = var.desired_count
  container_name        = var.container_name
  container_port        = var.container_port
  task_family           = var.task_family
  task_cpu              = var.task_cpu
  task_memory           = var.task_memory
  image_url             = var.image_url
  execution_role_arn    = module.iam.execution_role_arn
  target_group_arn      = module.elb.target_group_arn
  subnet_ids            = module.vpc.public_subnet_ids
  security_group_ids    = [module.security_groups.ecs_sg_id]
}

module "elb" {
  source = "./modules/elb"

  alb_name                = var.alb_name
  alb_internal            = var.alb_internal
  alb_deletion_protection = var.alb_deletion_protection
  alb_security_group_ids  = [module.security_groups.alb_sg_id]
  public_subnet_ids       = module.vpc.public_subnet_ids
  vpc_id                  = module.vpc.vpc_id

  target_group_name     = var.target_group_name
  target_group_protocol = var.target_group_protocol
  container_port        = var.container_port

  health_check_path                = var.health_check_path
  health_check_interval            = var.health_check_interval
  health_check_timeout             = var.health_check_timeout
  health_check_healthy_threshold   = var.health_check_healthy_threshold
  health_check_unhealthy_threshold = var.health_check_unhealthy_threshold
  health_check_matcher             = var.health_check_matcher

  listener_port     = var.listener_port
  listener_protocol = var.listener_protocol

  certificate_arn         = module.acm.certificate_arn
  https_listener_port     = var.https_listener_port
  https_listener_protocol = var.https_listener_protocol
  ssl_policy              = var.ssl_policy
}

module "route53" {
  source         = "./modules/route53"
  hosted_zone_id = var.hosted_zone_id
  record_name    = var.record_name
  alb_dns_name   = module.elb.alb_dns_name
  alb_zone_id    = module.elb.alb_zone_id
  record_type    = var.record_type
}
module "acm" {
  source         = "./modules/acm"
  domain_name    = var.record_name
  hosted_zone_id = var.hosted_zone_id
  tags = {
    Project = "ThreatModelling"
    Owner   = "Muna"
  }
}

module "vpc" {
  source = "./modules/vpc"

  vpc_cidr_block      = var.vpc_cidr_block
  public_subnet_cidrs = var.public_subnet_cidrs
  azs                 = var.azs
  tags                = var.tags
}




