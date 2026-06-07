terraform {
  backend "s3" {
    bucket = "terraform-backend-bala"
    key = "workspace/terraform.tfstate"
    region = "ap-south-1"
    encrypt = true
    
  }
}
