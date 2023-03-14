resource "aws_ec2_instance" "jenkins" {
  instance_type               = "t2.micro"
  ami                         = "ami-0574da719dca65348"
  subnet_id                   = aws_subnet.triserver_subnet["1"].id
  vpc_security_group_ids      = [aws_security_group.triserver_sg.id]
  user_data                   = file("user_data.sh")
  associate_public_ip_address = true
  key_name                    = "windows11"

}

resource "aws_security_group" "jenkins_sg" {
  name        = "triserver_sg"
  description = "allow incoming traffic on SSH"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
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
