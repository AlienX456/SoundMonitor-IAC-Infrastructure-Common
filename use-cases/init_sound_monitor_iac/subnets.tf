resource "aws_subnet" "soundmonitor-mainsubnet" {
  vpc_id                  = aws_vpc.sound_monitor_vpc.id
  cidr_block              = "10.0.0.0/25"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "soundmonitor-mainsubnet"
  }
}

resource "aws_subnet" "soundmonitor-alternativesubnet" {
  vpc_id                  = aws_vpc.sound_monitor_vpc.id
  cidr_block              = "10.0.0.128/25"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = false

  tags = {
    Name = "soundmonitor-alternativesubnet"
  }
}

