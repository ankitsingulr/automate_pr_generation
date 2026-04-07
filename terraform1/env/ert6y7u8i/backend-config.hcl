backend "s3" {
  encrypt = true
  bucket = "singulr-terraform-state"
  key    = "ert6y7u8i/terraform.tfstate"
  region = "us-east-1"
}
