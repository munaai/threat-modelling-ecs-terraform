variable "cluster_name" {
  description = "ECS cluster name"
  type        = string
}

variable "service_name" {
  description = "ECS service name"
  type        = string
}

variable "desired_count" {
  description = "Number of desired ECS tasks"
  type        = number
}

variable "cluster_insight_name" {
  description = "name of the cluster setting name"
  type        = string
}

variable "cluster_insight_value" {
  description = "name of the cluster setting value"
  type        = string
}

variable "container_name" {
  description = "name of the container"
  type        = string
}

variable "container_port" {
  description = "container port"
  type        = number
}
variable "task_family" {
  description = "family name"
  type        = string
}
variable "task_cpu" {
  description = "cpu"
  type        = string
}

variable "task_memory" {
  description = "memory"
  type        = string
}

variable "image_url" {
  description = "link of the image in ecr"
  type        = string
}

variable "execution_role_arn" {
  description = "iam role imported"
  type        = string
}

variable "target_group_arn" {
}

variable "subnet_ids" {
  type = list(string)
}

variable "security_group_ids" {
  type = list(string)
}
