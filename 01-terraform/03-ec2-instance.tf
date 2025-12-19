resource "aws_instance" "public_ec2_instance" {
  ami                    = "ami-0ecb62995f68bb549"
  instance_type          = "t2.micro"
  key_name               = "devops-fullstack-keypair"
  subnet_id              = aws_subnet.public_subnet_fullstack_devops.id
  vpc_security_group_ids = [aws_security_group.sg_fullstack_devops.id]
  user_data              = file("apache-install.sh")

  tags = {
    Name = "public-ec2-instance"
  }
}
