variable "aws_region" {
    default = "ap-south-1"
  
}

variable "aws_ami_id" {
    default = "ami-01a00762f46d584a1"
  
}

variable "aws_instance_type" {
    default = "t3.micro"
  
}

variable "instance_count" {
    default = 2
    type = number
  
}