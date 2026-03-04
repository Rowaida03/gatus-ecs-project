module "vpc" {
  source = "./modules/vpc"
  
  project_name          = var.project_name
  vpc_cidr              = var.vpc_cidr
  public_subnet_1_cidr  = var.public_subnet_1_cidr
  public_subnet_2_cidr  = var.public_subnet_2_cidr
  private_subnet_1_cidr = var.private_subnet_1_cidr
  private_subnet_2_cidr = var.private_subnet_2_cidr
  az1                   = var.az1
  az2                   = var.az2
}

module "security_groups" {
  source = "./modules/security_groups"

  project_name = var.project_name
  vpc_id       = module.vpc.vpc_id
}

module "ecr" {
  source       = "./modules/ecr"
  project_name = var.project_name
}


module "iam" {
  source       = "./modules/iam"
  project_name = var.project_name
}

module "acm" {
  source  = "./modules/acm"

  project_name   = var.project_name
  domain_name    =  var.domain_name
  hosted_zone_id = var.hosted_zone_id
}

module "alb" {
  source = "./modules/alb"

  project_name      = var.project_name
  public_subnet_ids = [
    module.vpc.public_subnet1_id,
    module.vpc.public_subnet2_id
  ]
  vpc_id            = module.vpc.vpc_id
  certificate_arn   = module.acm.certificate_arn
  alb_sg            = [module.security_groups.alb_sg_id]
  
}

module "ecs" {
  source = "./modules/ecs" 

  project_name = var.project_name
  subnet_ids   = [
    module.vpc.private_subnet1_id,
    module.vpc.private_subnet2_id
  ]
  ecr_repository_url = module.ecr.repository_url
  image_tag          = var.image_tag
  target_group_arn   = module.alb.target_group_arn
  aws_region         = var.aws_region
  desired_count      = var.desired_count
  cloudwatch_name    = var.cloudwatch_name
  retention_period   = var.retention_period
  container_cpu      = var.container_cpu
  container_memory   = var.container_memory
  container_port     = var.container_port
  security_group_ids = [module.security_groups.ecs_sg_id]
  container_name     = var.container_name
  execution_role_arn = module.iam.execution_role_arn
}


module "route53" {
  source = "./modules/route53"

  hosted_zone_id = var.hosted_zone_id
   domain_name   = var.domain_name
   alb_dns_name  = module.alb.alb_dns_name
   alb_zone_id   = module.alb.alb_zone_id
}