backend "s3" {
  encrypt = true
  bucket = "singulr-terraform-state"
  key    = "testall/terraform.tfstate"
  region = "us-east-1"
}
