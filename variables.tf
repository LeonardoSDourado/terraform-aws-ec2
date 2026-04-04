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

variable "ami" {
  type = string
  description = "Amazon Machine Image ID"
}

variable "iam_instance_profile" {
  type = string
  default = null
  description = "Instance profile"
}