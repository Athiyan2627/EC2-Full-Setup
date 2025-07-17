provider "aws" {
   region = var.aws_region
}

resource "aws_key_pair" "my_key" {
  key_name    ="mykey"
  public_key  =file(var.public_key_path)
}

resource "aws_security_group" "ec2_sg" {
  name        ="ec2-security-group"
  description ="Allow SSH and HTTP"


  ingress{
    description ="SSH"
    from_port   ="22"
    to_port     ="22"
    protocol    ="tcp"
    cidr_blocks =["0.0.0.0/0"]
  }
  
   ingress{
      description ="HTTP"
      from_port   ="80"
      to_port     ="80"
      protocol    ="tcp"
      cidr_blocks =["0.0.0.0/0"]
  }
  
    egress{
      from_port   =0
      to_port     =0
      protocol    ="-1"
      cidr_blocks =["0.0.0.0/0"]
  }

}

resource "aws_instance" "web" {
  ami                     =var.ami_id
  instance_type           =var.instance_type
  key_name                =aws_key_pair.my_key.key_name
  vpc_security_group_ids =[aws_security_group.ec2_sg.id]
   
  
  user_data = file("script.sh")

  tags ={
    Name="Terraform-web-server"
  }
}
