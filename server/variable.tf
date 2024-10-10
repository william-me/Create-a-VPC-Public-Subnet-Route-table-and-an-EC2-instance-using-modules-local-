variable "instance_type" {
  description = "EC2 instance type"
  type = string
}
variable "subnet_id" {
  description = "Subnet"
  type = string
}
variable "vpc_id" {
  description = "VPCID"
  type = string
}
variable "ami_id" {
  description = "amivalue"
  type = string
}
variable "availability_zone" {
  description = "azs"
  type = string
}