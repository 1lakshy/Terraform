terraform{
        backend "s3" {
    bucket = "kmkkkewerwqe455"
    key    = "dev/terraform.tfstate"
    region = "ap-south-1"
    encrypt = true
    use_lockfile = true
  }
}