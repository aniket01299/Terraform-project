resource "aws_key_pair" "new_key" {
    key_name = "terra-key-ec2"
    public_key = file("terra-key-ec2.pub")
}

resource "aws_default_vpc" "vpc_main" {
  
}


resource "aws_security_group" "sg" {
    name = "terraform-sg" 
    vpc_id = aws_default_vpc.vpc_main.id

   #inbound-rule#
    ingress  {
        description = "ssh"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = [ "0.0.0.0/0" ]

    } 

    ingress  {
        description = "http"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = [ "0.0.0.0/0" ]

    } 

    ingress  {
        description = "https"
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = [ "0.0.0.0/0" ]

    } 

    #outbound-rule#

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = [ "0.0.0.0/0" ]
    }

    tags = {
      Name = "terraform-sg"
    }

}

resource "aws_instance" "ec2" {
    key_name = aws_key_pair.new_key.key_name
    instance_type = var.aws_instance_type
    vpc_security_group_ids =  [ aws_security_group.sg.id ]
    ami = var.aws_ami_id
    count = var.instance_count

    user_data = file("nginx-shell.sh")

    root_block_device {
      volume_size =10
      volume_type = "gp3"
    }

    tags = {
      Name = "terraform-server"
    }
  
}