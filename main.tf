provider "aws" {
  region = "us-east-1"
}
data "aws_availability_zones" "available" {}

data "aws_ami" "ubuntu_1" {
  most_recent = true


  owners = ["099720109477"] # Canonical
}

module "vpc" {
  source = "./network"

  vpc_cidr = "10.0.0.0/16"
  public_subnet_cidr = "10.0.1.0/24"
}
module "ec2" {
  source = "./server"
  ami_id = data.aws_ami.ubuntu_1.id

  instance_type = "t2.micro"
  subnet_id = module.vpc.public_subnet_id
  vpc_id = module.vpc.vpc_id
  availability_zone = "us-east-1a"

}
output "availability_zones" {
  value = data.aws_availability_zones.available.names
}