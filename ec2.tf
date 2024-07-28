resource "aws_instance" "Jotaro" {
  instance_type          = "t2.micro"
  user_data              = file("setup.sh")
  vpc_security_group_ids = [aws_security_group.sg-demo1.id]
  subnet_id              = aws_subnet.dio.id
  availability_zone      = "us-east-1a"
  ami                    = "ami-03972092c42e8c0ca"
  tags = {
    Name = "Narutoweb1"
  }
}

resource "aws_instance" "Josuke" {
  instance_type          = "t2.micro"
  user_data              = file("setup.sh")
  vpc_security_group_ids = [aws_security_group.sg-demo1.id]
  subnet_id              = aws_subnet.private2.id
  availability_zone      = "us-east-1b"
  ami                    = "ami-03972092c42e8c0ca"
  tags = {
    Name = "Sasukeweb1"
  }
}
