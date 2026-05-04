backend "s3" {
  encrypt = true
  bucket = "singulr-terraform-state"
  key    = "ankit-123/terraform.tfstate"
  region = "us-east-1"
}
