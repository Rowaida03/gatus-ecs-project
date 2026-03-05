vpc_cidr = "10.0.0.0/16"

az1 = "eu-west-2a"
az2 = "eu-west-2b"

public_subnet_1_cidr  = "10.0.1.0/24"
private_subnet_1_cidr = "10.0.2.0/24"

public_subnet_2_cidr  = "10.0.3.0/24"
private_subnet_2_cidr = "10.0.4.0/24"

project_name = "gatus-proj"
aws_region   = "eu-west-2"

domain_name    = "tm.gatus-rowaida.co.uk"

desired_count  = 2
container_cpu  = 256
container_memory = 512
container_port = 8080
container_name = "gatus"
cloudwatch_name = "/ecs/gatus"
retention_period = 7