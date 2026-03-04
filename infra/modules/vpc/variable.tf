variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "public_subnet_1_cidr" {
  type        = string
  description = "CIDR block for public subnet 1"
}


variable "private_subnet_1_cidr" {
  type        = string
  description = "CIDR  block for private subnet 1"
}

variable "az1" {
  type        = string
  description = "First AZ"
}

variable "public_subnet_2_cidr" {
  type        = string
  description = "CIDR block for public subnet 2"
}

variable "private_subnet_2_cidr" {
  type        = string
  description = "CIDR block for private subnet 2"
}

variable "az2" {
  type        = string
  description = "Second AZ"
}

variable "project_name" {
  type = string
  description = "The name of the project"
  
}