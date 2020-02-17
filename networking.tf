
// Create VPC

resource "aws_vpc" "main" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "default"

  tags = {
    Name = "TerraformVpc"
    Location = "Banglore"
  }
}

// Create Subnet

resource "aws_subnet" "main" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Subnet-1"
  }
}