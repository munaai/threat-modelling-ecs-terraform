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

variable "cluster_insight_value" {
    description = "name of the cluster setting value"
    type = string 
}