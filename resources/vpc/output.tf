output "vpc_arn_i" {
    value = aws_vpc.my_vpc.arn
}

output "vpc_id_i" {
    value = aws_vpc.my_vpc.id
}

output "vpc_instance_tenancy_i" {
    value = aws_vpc.my_vpc.instance_tenancy
}

output "vpc_default_security_group_id_i" {
    value = aws_vpc.my_vpc.default_security_group_id
}

output "vpc_main_route_table_id_i" {
    value = aws_vpc.my_vpc.main_route_table_id
}

output "vpc_default_route_table_id_i" {
    value = aws_vpc.my_vpc.default_route_table_id
}

output "ec2_subnet_id" {
    value = aws_subnet.subnet_1.id
}

output "rds_subnet_id" {
    value = aws_subnet.subnet_2.id
}

output "security_group_id" {
  value = aws_security_group.karan_security_group.id
}