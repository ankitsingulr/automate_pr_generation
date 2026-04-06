backend "s3" {
  encrypt = true
  bucket = "singulr-terraform-state"
  key    = "234567/terraform.tfstate"
  region = "us-east-1"
}
