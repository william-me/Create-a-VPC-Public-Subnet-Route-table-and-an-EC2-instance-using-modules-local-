output "vpc_id" {
  value = aws_vpc.myvpc.id
}
output "public_subnet_id" {
  value = aws_subnet.firstsubnet.id
}
output "route_table_id" {
  value = "aws_route_table.public.id"
}
