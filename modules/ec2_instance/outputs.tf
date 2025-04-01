output "ec2_intance_name" {
  value = aws_instance.my_ec2.tags["Name"]
}
output "ec2_instance_os" {
  value = aws_instance.my_ec2.os
}
output "ec2_instance_publci_ip" {
  value = aws_instance.my_ec2.public_ip
}
