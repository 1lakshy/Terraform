data "aws_ssm_parameter" "al2023_ami" {
  name = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
}


resource "aws_instance" "example" {
  count = var.instance_count

  ami           = data.aws_ssm_parameter.al2023_ami.value
  instance_type = var.allowed_vm_types[2]

  monitoring = var.monitoring_enabled

  vpc_security_group_ids = [
    aws_security_group.allow_tls.id
  ]

  tags = var.tags
}


resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "allow_tls"
  }
}


resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.allow_tls.id

  cidr_ipv4   = var.cidr_block[0]
  from_port   = var.ingress_values[0]
  ip_protocol = var.ingress_values[1]
  to_port     = var.ingress_values[2]
}


resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.allow_tls.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"
}