resource "aws_security_group" "sg_linuxtips" {
  name        = "sg_linuxtips"
  description = "SG ${var.sg_name} - Allow inbound traffic and outbound traffic"
  vpc_id      = var.vpc_id

  tags = {
    Name = var.sg_name
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ingress" {
  for_each = var.ingress_rules
  security_group_id = aws_security_group.sg_linuxtips.id
  cidr_ipv4         = each.value["source_addr"]
  from_port         = each.value["from_port"]
  ip_protocol       = each.value["protocol"]
  to_port           = each.value["to_port"]
  description       = each.value["description"]
}

resource "aws_vpc_security_group_egress_rule" "allow_egress" {
  for_each = var.egress_rules
  security_group_id = aws_security_group.sg_linuxtips.id
  cidr_ipv4         = each.value["destination_addr"]
  from_port         = each.value["from_port"]
  ip_protocol       = each.value["protocol"]
  to_port           = each.value["to_port"]
  description       = each.value["description"]
}

resource "aws_instance" "ec2_linuxtips" {
  ami           = var.ami
  instance_type = "t3.micro"
  associate_public_ip_address = var.public_ip
  subnet_id = var.subnet_id
  vpc_security_group_ids = [aws_security_group.sg_linuxtips.id]
  tags = var.ec2_tags
  user_data = var.user_data
  iam_instance_profile = var.iam_instance_profile
}