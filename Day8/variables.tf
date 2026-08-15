variable "environment" {
  type        = string
  default     = "dev"
}

variable "channel_name" {
  type    = string
  default = "ttwp"
}

variable "region" {
  type    = string
  default = "ap-south-1"
}

variable "instance_count" {
  default = 1
  type = number
}

variable "monitoring_enabled" {
  description = "Enable detailed monitoring for EC2 instance"
  type = bool
  default = true
}


variable "associate_public_ip"{
  description = "Associate public IP Address with EC2 instances"
  type = bool
  default = true
}

variable "cidr_block" {
  description = "CIDR block for the VPC"
  type = list(string)
  default = ["10.0.0.0/8","192.168.0.0/16","172.16.0.0/12"]
}

variable "allowed_vm_types" {
  description = "List of allowed VM types"
  type = list(string)
  default = ["t2.micro","t2.small","t3.micro","t3.small"]
}

# List Example
variable "allowed_region" {
  description = "List of allowed AWS regions"
  type = list(string)
  default = ["ap-south-1","us-east-1","us-west-2","eu-west-1"]
}

# Map Example
variable "tags" {
  type = map(string)
  default = {
    Environment = "dev"
    Name = "dev-Instance"
    created_by = "terraform"
  }
}

# Tuple Example
variable "ingress_values" {
  type = tuple([number,string,number])
  default = [443,"tcp",443]
}

# Object Example
variable "config" {
  type = object({
    region = string,
    monitoring = bool,
    instance_count = number
  })

  default = {
    region = "ap-south-1",
    monitoring = true,
    instance_count = 1,
  }
}

variable "bucket_names" {
  description = "list of S3 bucket names to create"
  type = list(string)
  default = ["hbefdszknfsj-234u12i3","jwendfsjw-23949324"]
}

variable "bucket_name_set" {
  description = "set of S3 bucket names to create"
  type = set(string)
  default = ["dskgfdszknfsj-234u12i3","dfgnjkidsdndfsjw-23949324"]
}