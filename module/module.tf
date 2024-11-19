module "ec2" {
    source = "/root/terraform/resources/ec2/"
    this_ec2_ami = "ami-0dee22c13ea7a9a67"
    this_ec2_instance = "t2.micro"
    this_subnet_id = module.vpc.ec2_subnet_id
    this_vpc_security = [module.vpc.security_group_id]
    ec2_key_name = "karannew-acc-mum-kp"
    this_tag = "TomcatServer"
}

module "vpc" {
    source = "/root/terraform/resources/vpc/"
    this_vpc_cidr = "192.168.0.0/16"
    this_instance_tenancy = "default"
    this_dns_support = true
    this_dns_hostnames = true
    this_vpc_tag = "karan_vpc"
    this_cidr_block_sub1 = "192.168.0.0/17"
    this_az_sub1 = "ap-south-1a"
    this_ec2_subnet_tag = "Subnet1_Instance"
    this_cidr_block_sub2 = "192.168.128.0/17"
    this_az_sub2 = "ap-south-1b"
    this_rds_subnet_tag = "Subnet2_RDS"
    this_vpc_security_tag = "Karan_Security_Group"
    this_cidr_sg_egress_ingress = "0.0.0.0/0"
    this_protocol_sg_egress = -1
    description_sg_egress = "default rule"
    this_from_to_port_sg_ingress_tomcat = 8080
    this_protocol_sg_ingress = "tcp"
    description_sg_ingress_tomcat = "for tomcat"
    this_from_to_port_sg_ingress_mysql = "3306"
    description_sg_ingress_mysql = "for database"
}

output "vpc_arn_i" {
    value = module.vpc.vpc_arn_i
}

output "vpc_id_i" {
    value = module.vpc.vpc_id_i
}

output "vpc_instance_tenancy_i" {
    value = module.vpc.vpc_instance_tenancy_i
}

output "vpc_default_security_group_id_i" {
    value = module.vpc.vpc_default_security_group_id_i
}

output "vpc_main_route_table_id_i" {
    value = module.vpc.vpc_main_route_table_id_i
}

output "vpc_default_route_table_id_i" {
    value = module.vpc.vpc_default_route_table_id_i
}

output "ec2_subnet_id" {
    value = module.vpc.ec2_subnet_id
}

output "rds_subnet_id" {
    value = module.vpc.rds_subnet_id
}

output "security_group_id" {
  value = module.vpc.security_group_id
}

output "ec2_id" {
    value = module.ec2.ec2_id
}

output "ec2_instance_state" {
    value = module.ec2.ec2_instance_state

output "ec2_public_ip" {
    value = module.ec2.ec2_public_ip
}

output "ec2_public_dns" {
    value = module.ec2.ec2_public_dns
}

output "ec2_private_dns" {
    value = module.ec2.ec2_private_dns

output "ec2_arn" {
    value = module.ec2.ec2_arn