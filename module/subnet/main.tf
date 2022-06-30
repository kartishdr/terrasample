resource "aws_subnet" "main" {
  vpc_id     = var.vpc_id
  cidr_block = var.subnet_range

  tags = {
    Name = var.tags
  }
}
