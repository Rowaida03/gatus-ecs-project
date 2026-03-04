variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC network"
}

variable "az1" {
  type        = string
  description = "First AZ used by VPC"
}

variable "public_subnet_1_cidr" {
  description = "CIDR block for public subnet 1"
  type        = string
}

variable "private_subnet_1_cidr" {
  description = "CIDR  block for private subnet 1"
  type        = string
}

variable "az2" {
  description = "Second AZ"
  type        = string
}

variable "public_subnet_2_cidr" {
  description = "CIDR block for public subnet 2"
  type        = string
}

variable "private_subnet_2_cidr" {
  description = "CIDR block for private subnet 2"
  type        = string
}

variable "project_name" {
  description = "Name used to tag and identify project resources"
  type = string
}

variable "hosted_zone_id" {
  description = "Route53 hosted zone ID used for DNS records"
  type = string
}

variable "domain_name" {
  description = "Domain name used for this app"
  type = string
}

variable "image_tag" {
  description = "Docker image tag used for ECS deployments"
  type        = string
}

variable "aws_region" {
  description = "AWS region where infrastructure will be deployed"
  type        = string
}

variable "desired_count" {
  description = "number of ECS tasks"
  type = number
}

variable "container_cpu" {
  description = "CPU units for the container"
  type    = number
}

variable "container_memory" {
  description = "Memory allocated to the container in MB"
  type    = number
}

variable "container_port" {
  description = "Port container listening on"
  type    = number
}

variable "container_name" {
  description = "Name assigned to the container"
  type    = string
}

variable "cloudwatch_name" {
  description = "Cloudwatch log group name used by ECS"
  type        = string
}

variable "retention_period" {
  description = "Number of days Cloudwatch logs are retained"
  type    = number
}