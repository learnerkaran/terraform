output "db_address" {
    value = aws_db_instance.mysql_karan.address 
}

output "db_arn" {
    value = aws_db_instance.mysql_karan.arn
}

output "db_allocated_storage" {
    value = aws_db_instance.mysql_karan.allocated_storage
}

output "db_availability_zone" {
    value = aws_db_instance.mysql_karan.availability_zone
}

output "db_db_name" {
    value = aws_db_instance.mysql_karan.db_name
}

output "db_endpoint" {
    value = aws_db_instance.mysql_karan.endpoint
}

output "db_engine" {
    value = aws_db_instance.mysql_karan.engine
}

output "db_engine_version_actual" {
    value = aws_db_instance.mysql_karan.engine_version_actual
}

output "db_id" {
    value = aws_db_instance.mysql_karan.id
}

output "db_hosted_zone_id" {
    value = aws_db_instance.mysql_karan.hosted_zone_id
}

output "db_instance_class" {
    value = aws_db_instance.mysql_karan.instance_class
}

output "db_listener_endpoint" {
    value = aws_db_instance.mysql_karan.listener_endpoint
}

output "db_port" {
    value = aws_db_instance.mysql_karan.port
}

output "db_status" {
    value = aws_db_instance.mysql_karan.status
}

output "db_resource_id" {
    value = aws_db_instance.mysql_karan.resource_id
}

output "db_storage_encrypted" {
    value = aws_db_instance.mysql_karan.storage_encrypted
}

output "db_username" {
    value = aws_db_instance.mysql_karan.username
}

output "db_subnet_group_name" {
    value = aws_db_subnet_group.subnet-group-for-rds.id
}