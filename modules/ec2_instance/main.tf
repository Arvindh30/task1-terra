#define keypair
resource "aws_key_pair" "my_kp" {
  key_name = var.key_name
  public_key = file("id_rsa.pub")
}

#extract vpc data
data "aws_default_vpc" "my_df_vpc" {
  default = true
}

#extract subnet data
data "aws_default_subnet" "my_df_subnet" {
    vpc_id = data.aws_default_vpc.my_df_vpc.id
}

#define security group
resource "aws_security_group" "my_sg" {
  name = var.sg_name_val
  vpc_id = data.aws_default_vpc.my_df_vpc.id

  #ingress rules
  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
      description = ingress.value.description
    }
  }

  #outbound rules
  dynamic "egress" {
    for_each = var.egress_rules
    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
      description = egress.value.description
    }
  }
}

#define instance
resource "aws_instance" "my_ec2" {
    ami = var.ami_value
    instance_type = var.instance_type_value
    subnet_id = data.aws_default_subnet.my_df_subnet.id
    tags = {
      Name = "Task-1_EC2"
    }
    root_block_device {
      volume_size = var.volume_size
      volume_type = var.volume_type
    }
    depends_on = [ aws_key_pair.my_kp, aws_security_group.my_sg ]
}