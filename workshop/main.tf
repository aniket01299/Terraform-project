resource "aws_instance" "ec2" {
  
  ami = ""
  instance_type = "t3.micro"
  key_name = "gannu"

  tags = {
    Name = "${var.env}-server"
  }
}
