backend "s3" {
  encrypt = true
  bucket = "singulr-terraform-state"
  key    = "clas/terraform.tfstate"
  region = "us-east-1"
}
