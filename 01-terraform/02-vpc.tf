# VPC Resource Block
resource "aws_vpc" "vpc_fullstack_devops" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "vpc-fullstack-devops"
  }
}

# Subnet Resource Block
resource "aws_subnet" "public_subnet_fullstack_devops" {
  vpc_id                  = aws_vpc.vpc_fullstack_devops.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-fullstack-devops"
  }
}

# Internet Gateway Resource Block
resource "aws_internet_gateway" "igw_fullstack_devops" {
  vpc_id = aws_vpc.vpc_fullstack_devops.id

  tags = {
    Name = "igw-fullstack-devops"
  }
}

# Route Table Resource Block
resource "aws_route_table" "public_rt_fullstack_devops" {
  vpc_id = aws_vpc.vpc_fullstack_devops.id

  tags = {
    Name = "public-rt-fullstack-devops"
  }
}

# Route in Route Table Resource Block
resource "aws_route" "public_route_fullstack_devops" {
  route_table_id         = aws_route_table.public_rt_fullstack_devops.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw_fullstack_devops.id
}

# Associate Subnet with Route Table Resource Block
resource "aws_route_table_association" "public_rt_assoc_fullstack_devops" {
  route_table_id = aws_route_table.public_rt_fullstack_devops.id
  subnet_id      = aws_subnet.public_subnet_fullstack_devops.id
}

# Security Group Resource Block
resource "aws_security_group" "sg_fullstack_devops" {
  name        = "fullstack-devops-sg" # changed to avoid AWS restriction
  description = "Security group for fullstack devops"
  vpc_id      = aws_vpc.vpc_fullstack_devops.id

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # consider restricting to your IP
  }

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "fullstack-devops-sg"
  }
}
