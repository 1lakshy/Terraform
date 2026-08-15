terraform{
        backend "s3" {
    bucket = "terraform-statefile-system-0-bucket"
    key    = "dev/terraform.tfstate"
    region = "ap-south-1"
    encrypt = true
    use_lockfile = true
  }
}