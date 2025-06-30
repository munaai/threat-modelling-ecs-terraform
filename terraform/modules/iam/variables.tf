variable "cluster_name" {
    description = "ECS cluster name"
    type = string
}

variable "service_name" {
    description = "ECS service name"
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