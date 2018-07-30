variable "vpc_name" {
  default     = "Staging"
  description = "Name tag for the VPC to be created"
}

variable "vpc_cidr" {
  default     = "192.168.0.0/20"
  description = "Name tag for the VPC to be created"
}

resource "aws_vpc" "main" {
  cidr_block = "${var.vpc_cidr}"

  tags {
    Name = "${var.vpc_name}"
  }
}

module "pub_sn_a" {
  source                  = "github.com/opstree-terraform/subnet"
  vpc_id                  = "${aws_vpc.main.id}"
  cidr                    = "192.168.0.0/23"
  az                      = "us-west-2a"
  map_public_ip_on_launch = "true"
}

module "pub_sn_b" {
  source                  = "github.com/opstree-terraform/subnet"
  vpc_id                  = "${aws_vpc.main.id}"
  cidr                    = "192.168.2.0/23"
  az                      = "us-west-2b"
  map_public_ip_on_launch = "true"
}
