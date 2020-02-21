
// Create VPC


resource "aws_vpc" "main" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "default"

  tags = {
    Name        = "TerraformVpc-${terraform.workspace}"
    Location    = "Banglore"
    Environment = "${terraform.workspace}"
  }
}

resource "aws_subnet" "public" {
  count             = "${local.az_count}"
  vpc_id            = "${aws_vpc.main.id}"
  cidr_block        = "${cidrsubnet(var.vpc_cidr, 8, count.index)}"
  availability_zone = "${local.az_names[count.index]}"
  tags = {
    Name = "Public-${count.index + 1}"
  }
}