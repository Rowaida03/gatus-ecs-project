variable "project_name" {
    description = "Project name for resource naming"
    type = string
}

variable "subnet_ids" {
    description = "List of subnet IDs"
    type = list(string)
}

variable "ecr_repository_url" {
    description = "URL of the ECR repository"
    type = string
}


variable "image_tag" {
    description = "image tag in use"
    type = string
}

variable "target_group_arn" {
    description = "ARN of the ALB target group"
    type = string
}

variable "aws_region" {
    description = "region in which resources are deployed"
    type = string
}

variable "desired_count" {
    type = number
    description = "Number of tasks to run"
}

variable "cloudwatch_name" {
    type = string
}

variable "retention_period" {
    description = "Cloudwatch log retention period"
    type = number
}


variable "container_cpu" {
    description = "CPU units of container"
    type = number
}

variable "container_memory" {
    description = "Memory of the container"
    type = number
}

variable "container_port" {
    description = "port of use in container"
    type = number
}

variable "security_group_ids" {
    description = "IDs of the security groups"
    type = list(string)
}

variable "container_name" {
    type = string
}

variable "execution_role_arn" {
    description = "ARN of ECS task role"
    type = string
}