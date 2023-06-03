resource "aws_security_group" "web_server" {
  name_prefix = "web-server-sg"

ingress {
     from_port   = 22
     to_port     = 22
     protocol    = "tcp"
     cidr_blocks = ["0.0.0.0/0"]
   }

   ingress {
     from_port   = 80
     to_port     = 80
     protocol    = "tcp"
     cidr_blocks = ["0.0.0.0/0"]
   }


   egress {
     from_port   = 0
     to_port     = 0
     protocol    = "-1"
     cidr_blocks = ["0.0.0.0/0"]
   }
}
resource "aws_instance" "web" {
  ami           = "ami-id"
  instance_type = "t2.micro"
  key_name      = "Key-Name"
  tags = {
            Name = "test"
           }
  security_groups = [
    aws_security_group.web_server.name
  ]

  user_data = "${file("test.sh")}"
}
