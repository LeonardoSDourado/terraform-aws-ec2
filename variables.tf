variable "sg_name" {
  type= string
  description = "Security Group name"
}

variable "ingress_rules" {
  type = map(object({source_addr = string, from_port = number, to_port = number, protocol = string, description = string}))
}

variable "egress_rules" {
  type = map(object({destination_addr = string, from_port = number, to_port = number, protocol = string, description = string}))
}

variable "vpc_id" {
  type = string
  description = "ID da VPC"
}

variable "subnet_id" {
  type = string
  description = "ID da subnet"
}

variable "ec2_tags" {
  type = map(any)
  description = "EC2 tags"
}

variable "public_ip" {
  type = bool
  description = "Associate public IP"
  default = false
}

variable "user_data" {
  type = string
  description = "User data"
}

variable "role_name" {
  type = string
  description = "Role name for EC2 SSM"
}

variable "ssm_policy" {
  type = string
  description = "Policy attached to EC2 SSM Role"
}

variable "ami" {
  type = string
  description = "Amazon Machine Image ID"
}
