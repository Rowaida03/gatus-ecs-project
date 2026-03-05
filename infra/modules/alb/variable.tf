variable "project_name" {
  type = string
}

variable "public_subnet_ids" {
  description = "List of subnet IDs for ALB"
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC ID where ALB is"
  type        = string
}

variable "certificate_arn" {
  description = "ARN of the ACM certificate for HTTPS"
  type        = string
}

variable "alb_sg" {
  description = "Security group for the ALB"
  type        = list(string)
}