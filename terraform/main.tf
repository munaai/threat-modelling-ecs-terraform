module "ecs" {
  source = "./modules/ecs_fargate"
  cluster_name = var.cluster_name
  service_name = var.service_name
  cluster_insight_name = var.cluster_insight_name
  cluster_insight_value = var.cluster_insight_value
  desired_count = var.desired_count
  container_name = var.container_name
  container_port = var.container_port
  task_family = var.task_family
  task_cpu = var.task_cpu
  task_memory = var.task_memory
  image_url = var.image_url
  iam_role_arn = module.iam.execution_role_arn #passed from iam output
}

module "iam" {
  source = "./modules/iam"
  role_name = var.role_name
  assume_service = var.assume_service
  policy_name = var.policy_name
}

module "security_groups" {
    source = "./modules/security_groups"
    alb_sg_name = var.alb_sg_name
    alb_sg_description = var.alb_sg_description
    vpc_id = var.vpc_id
    alb_ingress_http_from_port = var.alb_ingress_http_from_port
    alb_ingress_http_to_port = var.alb_ingress_http_to_port
    alb_ingress_cidr_blocks = var.alb_ingress_cidr_blocks
    alb_ingress_https_from_port = var.alb_ingress_https_from_port
    alb_ingress_https_to_port = var.alb_ingress_https_to_port
    ecs_egress_cidr_blocks = var.ecs_egress_cidr_blocks
    ecs_sg_name = var.ecs_sg_name
    ecs_sg_description = var.ecs_sg_description
    ecs_ingress_from_port = var.ecs_ingress_from_port
    ecs_ingress_to_port = var.ecs_ingress_to_port
    ecs_egress_from_port = var.ecs_egress_from_port
    ecs_egress_to_port = var.ecs_egress_to_port
    ingress_protocol = var.ingress_protocol
    egress_protocol = var.egress_protocol
}
