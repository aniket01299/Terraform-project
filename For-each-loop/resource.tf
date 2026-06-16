provider "aws" {
  region = var.aws_region
}
resource "aws_instance" "ec2" {


   for_each = var.instance

   ami = "ami-07a00cf47dbbc844c"
   instance_type = each.value

   tags = {
    Name = each.key
   }  
}