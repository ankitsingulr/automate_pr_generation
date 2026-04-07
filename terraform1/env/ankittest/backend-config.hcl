backend "s3" {
  encrypt = true
  bucket = "singulr-terraform-state"
  key    = "ankittest/terraform.tfstate"
  region = "us-east-1"
}
