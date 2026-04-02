backend "s3" {
  encrypt = true
  bucket = "singulr-terraform-state"
  key    = "test12/terraform.tfstate"
  region = "us-east-1"
}
