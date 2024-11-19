output "ec2_id" {
    value = aws_instance.my_tomcat_server.id
}

output "ec2_instance_state" {
    value = aws_instance.my_tomcat_server.instance_state
}

output "ec2_public_ip" {
    value = aws_instance.my_tomcat_server.public_ip
}

output "ec2_public_dns" {
    value = aws_instance.my_tomcat_server.public_dns
}

output "ec2_private_dns" {
    value = aws_instance.my_tomcat_server.private_dns
}

output "ec2_arn" {
    value = aws_instance.my_tomcat_server.arn
}