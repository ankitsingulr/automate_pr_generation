backend "s3" {
  encrypt = true
  bucket = "singulr-terraform-state"
  key    = "test1234o/terraform.tfstate"
  region = "us-east-1"
}
