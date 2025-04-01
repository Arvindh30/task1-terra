variable "ingress_rules" {
  description = "value"
  type = list(object({
    from_port = number
    to_port = number
    protocol = string
    cidr_blocks = list(string)
    description = string 
  }))
}

variable "egress_rules" {
  description = "value"
  type = list(object({
    from_port = number
    to_port = number
    protocol = string
    cidr_blocks = list(string)
    description = string 
  }))
}

variable "ami_value" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "sg_name_val" {
  description = "Security Group Name"
  type        = string
}

variable "key_name" {
  description = "Name of the EC2 key pair"
  type        = string
}

variable "instance_type_value" {
  description = "EC2 Instance Type"
  type        = string
}

variable "volume_size" {
  description = "Root volume size (in GB)"
  type        = number
}

variable "volume_type" {
  description = "Volume Type"
  type        = string
}
