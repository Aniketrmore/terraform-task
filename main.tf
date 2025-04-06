#It is for use default vpc & create their SG

#resource "aws_security_group" "my-sg" {
#  # ... other configuration ...
#  name = "sg"
#  description = "this will add a TF SG"
#  vpc_id = aws_default_vpc.default.id
#  ingress {
#    from_port        = 22
#    to_port          = 22
#    protocol         = "tcp"
#    cidr_blocks      = ["0.0.0.0/0"]
#  }
#
#  ingress {
#    from_port        = 80
#    to_port          = 80
#    protocol         = "tcp"
#    cidr_blocks      = ["0.0.0.0/0"]
#}
#
#  egress {
#    from_port        = 0
#    to_port          = 0
#    protocol         = "-1"
#    cidr_blocks      = ["0.0.0.0/0"]
#}
#}

#resource aws_default_vpc default {

#}

resource "aws_key_pair" "id_ed25519" {
    key_name   = "aniket"
    public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINpShMM65moEOnb/yzBPzCUR/O/Q8bTdWpPCDQ0XK8uC root@LAPTOP-1EVOAO4B"
}

resource "aws_instance" "my_instance" {
    for_each = tomap({
        ec2-name-micro = "t2.micro"
        ec2-name-medium = "t2.medium"
    })
    key_name = aws_key_pair.id_ed25519.key_name
    subnet_id = aws_subnet.first.id                      #using perticular subnet
    security_groups = [aws_security_group.my-vpc-sg.id]  #using perticular vpc & their SG
    instance_type = each.value
    ami = var.ec2_ami_id #ubuntu
    user_data = file("install_nginx.sh")

    tags = {
        Name = each.key
    }
}