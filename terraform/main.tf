module "ecs" {
  source = "./modules/ecs_fargate"
  cluster_name = var.cluster_name
  service_name = var.service_name
}
