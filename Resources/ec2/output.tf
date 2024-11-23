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

output "lb_arn" {
    value = aws_lb.my_alb.arn
}

output "lb_dns_name" {
    value = aws_lb.my_alb.dns_name
}

output "lb_id" {
    value = aws_lb.my_alb.lb_id
}

output "lb_listener_id" {
    value = aws_lb_listener.https_listener.id
}

output "lb_listener_id" {
    value = aws_lb_listener.https_listener.id
}

output "launch_template_id" {
    value = aws_launch_template.my_launch_template.id
}

output "launch_template_latest_version" {
    value = aws_launch_template.my_launch_template.latest_version
}

output "lb_target_group_id" {
    value = aws_lb_target_group.my_target_group.id
}

output "lb_target_group_name" {
    value = aws_lb_target_group.my_target_group.name
}

output "lb_target_group_load_balancer_arns" {
    value = aws_lb_target_group.my_target_group.load_balancer_arns
}

output "autoscaling_group_id" {
    value = aws_autoscaling_group.my_asg.id
}

output "autoscaling_group_arn" {
    value = aws_autoscaling_group.my_asg.arn
}

output "autoscaling_group_name" {
    value = aws_autoscaling_group.my_asg.iname
}