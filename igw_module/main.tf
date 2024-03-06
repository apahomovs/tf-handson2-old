resource "aws_internet_gateway" "myvpc_igw" {
  count = var.create_attatch_igw ? 1 : 0
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "myvpc_igw"
  }
}