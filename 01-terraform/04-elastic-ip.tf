resource "aws_eip" "fullstack_devops_eip" {
  instance = aws_instance.public_ec2_instance.id

  # Ensure the IGW exists before associating EIP
  depends_on = [aws_internet_gateway.igw_fullstack_devops]

  tags = {
    Name = "fullstack-devops-eip"
  }
}

