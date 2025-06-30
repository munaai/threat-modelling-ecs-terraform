module "ecs" {
  source = "./modules/ecs_fargate"
  cluster_name = var.cluster_name
  service_name = var.service_name
  cluster_insight_name = var.cluster_insight_name
  cluster_insight_value = var.cluster_insight_value
  desired_count = var.desired_count
}
