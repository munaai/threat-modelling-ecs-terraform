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
}
