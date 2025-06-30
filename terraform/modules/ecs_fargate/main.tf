resource "aws_ecs_cluster" "this" {
  name = var.cluster_name

  setting {  // this part enables Cloudwatch Container Insight for monitoring 
    name  = var.cluster_insight_name
    value = var.cluster_insight_value
  }
}
resource "aws_ecs_service" "this" {
  name            = var.service_name
  cluster         = aws_ecs_cluster.this.id
  task_definition = aws_ecs_task_definition.this.arn
  desired_count   = var.desired_count
  iam_role        = aws_iam_role.this.arn
  depends_on      = [aws_iam_role_policy.this]

  load_balancer {
    target_group_arn = aws_lb_target_group.this.arn
    container_name   = var.container_name
    container_port   = var.container_port
  }
}

resource "aws_ecs_task_definition" "this" {
  family                   = var.task_family
  requires_compatibilities = ["FARGATE"]  # wont change
  network_mode             = "awsvpc"     # wont change
  cpu                      = var.task_cpu
  memory                   = var.task_memory
  execution_role_arn       = var.iam_role_arn

  container_definitions = jsonencode([
    {
      name      = var.container_name
      image     = var.image_url  # e.g. your ECR image
      essential = true
      portMappings = [
        {
          containerPort = var.container_port
          hostPort      = var.container_port
          protocol      = "tcp" # wont change
        }
      ]
    }
  ])
}

