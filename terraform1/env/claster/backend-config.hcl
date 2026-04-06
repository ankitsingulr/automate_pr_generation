backend "s3" {
  encrypt = true
  bucket = "singulr-terraform-state"
  key    = "claster/terraform.tfstate"
  region = "us-east-1"
}
