output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_ids" {
  value = [
    aws_subnet.public_1.id,
    aws_subnet.public_2.id
  ]
}

output "public_subnet_azs" {
  value = [
    aws_subnet.public_1.availability_zone,
    aws_subnet.public_2.availability_zone
  ]
}

output "internet_gateway_id" {
  value = aws_internet_gateway.gw.id
}

output "public_route_table_id" {
  value = aws_route_table.example.id
}
