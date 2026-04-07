backend "s3" {
  encrypt = true
  bucket = "singulr-terraform-state"
  key    = "client/terraform.tfstate"
  region = "us-east-1"
}
