backend "s3" {
  encrypt = true
  bucket = "singulr-terraform-state"
  key    = "opt/terraform.tfstate"
  region = "us-east-1"
}
