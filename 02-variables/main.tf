resource "aws_instance" "terraform_demo" {
    ami = var.ami_id
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.allow_terraform.id] # list
    # label, metadata, info, etc
    tags = var.ec2_tags
}

# it created the default vpc
resource "aws_security_group" "allow_terraform" {
  name        = var.sg_name
  description = "Allow TLS inbound traffic and all outbound traffic"
  
  # outbound traffic 
  egress {
    from_port        = var.port
    to_port          = var.port
    protocol         = "-1" # all traffuc
    cidr_blocks      = var.cidr
  }

  tags = var.sg_tags
}