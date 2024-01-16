# store the terraform state file in S3

terraform {
  backend "s3" {
    bucket   = "terraform-remote-state-2024"
    key      = "k-task/terraform.tfstate"
    region   = "us-east-1"
    profile  = "default"
  }
}