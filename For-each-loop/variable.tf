variable "aws_region" {
    default = ap-south-1
  
}

variable "instance" {
    type = map(string)


   default = {
     "dev" = "t3.micro"
     "test" = "t3.micro"
     "prod" = "t3.micro"
   }
}