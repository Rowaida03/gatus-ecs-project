variable "hosted_zone_id" {
  description = "Route 53 hosted zone ID"
  type        = string
}

variable "domain_name" {
  description = "Contains the domain name"
  type        = string
}

variable "alb_dns_name" {
  description = "The ALB's DNS name"
  type        = string
}

variable "alb_zone_id" {
  description = "The ALB's zone ID"
  type        = string
}



