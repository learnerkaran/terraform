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