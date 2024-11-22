module "ec2" {
    source = "/root/terraform/Resources/ec2/"
    this_ec2_ami = "ami-0dee22c13ea7a9a67"
    this_ec2_instance = "t2.micro"
    this_subnet_id = module.vpc.ec2_subnet_id
    this_associate_public_ip_address = true
    this_vpc_security = [module.vpc.security_group_id]
    ec2_key_name = "karannew-acc-mum-kp"
    this_tag = "TomcatServer"
}

module "vpc" {
    source = "/root/terraform/Resources/vpc/"
    this_vpc_cidr = "192.168.0.0/16"
    this_instance_tenancy = "default"
    this_dns_support = true
    this_dns_hostnames = true
    this_vpc_tag = "karan_vpc"
    this_cidr_block_sub1 = "192.168.0.0/17"
    this_az_sub1 = "ap-south-1a"
    this_ec2_subnet_tag = "Subnet1_Instance"
    this_cidr_block_sub2 = "192.168.128.0/17"
    this_publicip_give = true
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

module "rds" {
    source = "/root/terraform/Resources/rds/"
    this_db_name = "karan-db"
    this_db_size = 20
    this_storage_type = "gp2"
    this_engine_type = "mysql"
    this_engine_version = "8.0.39"
    this_db_instace_class = "db.t3.micro"
    ths_db_username = "admin"
    this_db_passwd = "Admin1234"
    this_final_snapshot = true
    this_port_number = 3306
    this_rds_sg_id = [module.vpc.security_group_id]
    this_vpc_db_subnet_name = module.rds.db_subnet_group_name
    this_db_subnet_name = "karan-rds-subnet-group-name" 
    this_subnet_id_for_db = [module.vpc.rds_subnet_id, module.vpc.ec2_subnet_id]
    this_karan_rds_subnet_name = "karan-rds-subnet-group"
}

output "db_subnet_group_name" {
    value = module.rds.db_subnet_group_name
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
}

output "ec2_public_ip" {
    value = module.ec2.ec2_public_ip
}

output "ec2_public_dns" {
    value = module.ec2.ec2_public_dns
}

output "ec2_private_dns" {
    value = module.ec2.ec2_private_dns
}

output "ec2_arn" {
    value = module.ec2.ec2_arn
}