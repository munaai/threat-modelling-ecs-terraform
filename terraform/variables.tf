variable "cluster_name" {
    description = "Name of the ECS cluster"
    type = string
}

variable "service_name" {
    description = "Name of the ECS service"
    type = string
}

variable "desired_count" {
    description = "Number of desired ECS tasks"
    type = number
}

variable "cluster_insight_name" {
    description = "name of the cluster setting name"
    type = string 
}

variable "cluster_insight_value" {
    description = "name of the cluster setting value"
    type = string 
}

variable "container_name" {
    description = "name of the container"
    type = string 
}

variable "container_port" {
    description = "container port"
    type = number 
}

variable "task_family" {
    description = "family name"
    type = string
}

variable "task_cpu" {
    description = "cpu"
    type = string
}

variable "task_memory" {
    description = "memory"
    type = string
}

variable "image_url" {
    description = "link of the image in ecr"
    type = string
}
