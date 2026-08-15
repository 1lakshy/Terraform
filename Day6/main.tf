resource "aws_instance" "example" {
    count = var.instance_count
    ami = 
    instance_type = "t2.micro"
    region = var.region


    tag = {
        Environment = var.environment
        Name = "${var.environment}-EC2-Instance"
    }
}