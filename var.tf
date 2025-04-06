variable "aws_instance_type" {
   type = string
   default = "t2.micro"
}

variable "ec2_ami_id" {
    default = "ami-0e35ddab05955cf57"
    type = string
}