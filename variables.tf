variable "aws_region" {
  default = "us-east-1"
}

variable "ami_id" {
  default = "ami-0150ccaf51ab55a51"  # Amazon Linux 2 (us-east-1)
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  default = "mykey"
}

variable "public_key_path" {
  default = "C:\\Users\\athiy\\Downloads\\mykey.pub"  # Or the path to your existing public key
}
