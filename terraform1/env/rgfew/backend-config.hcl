backend "s3" {
  encrypt = true
  bucket = "singulr-terraform-state"
  key    = "rgfew/terraform.tfstate"
  region = "us-east-1"
}
