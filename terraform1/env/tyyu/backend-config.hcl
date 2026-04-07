backend "s3" {
  encrypt = true
  bucket = "singulr-terraform-state"
  key    = "tyyu/terraform.tfstate"
  region = "us-east-1"
}
