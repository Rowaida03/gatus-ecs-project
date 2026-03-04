terraform {
  backend "s3" {
    bucket         = "gatus-project-tf-state"
    key            = "terraform.tfstate"
    region         = "eu-west-2"
    dynamodb_table = "terraform-lock"
    encrypt        = true

  }
}