output "ec2_public_ip" {
  value = aws_instance.ec2_linuxtips.public_ip
  description = "EC2 public IP"
}