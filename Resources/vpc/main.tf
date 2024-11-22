resource "aws_vpc" "my_vpc" {
    cidr_block = var.this_vpc_cidr                  #"192.168.0.0/16"
    instance_tenancy = var.this_instance_tenancy    #"default"
    enable_dns_support = var.this_dns_support            #true
    enable_dns_hostnames = var.this_dns_hostnames        #true

        tags = {
        Name = var.this_vpc_tag                     #"karan_vpc"
    }
}

resource "aws_subnet" "subnet_1" {
    vpc_id = aws_vpc.my_vpc.id
    cidr_block = var.this_cidr_block_sub1           #"192.168.0.0/17"
    availability_zone = var.this_az_sub1            #"ap-south-1a"
    map_public_ip_on_launch = var.this_publicip_give
    tags = {
        Name = var.this_ec2_subnet_tag                    #"Subnet1_Instance"
    }
}

resource "aws_subnet" "subnet_2"{
    vpc_id = aws_vpc.my_vpc.id
    cidr_block = var.this_cidr_block_sub2           #"192.168.128.0/17"
    availability_zone = var.this_az_sub2            #"ap-south-1b"
    tags = {
        Name = var.this_rds_subnet_tag                  #"Subnet2_RDS"
    }
}

resource "aws_security_group" "karan_security_group" {
    vpc_id = aws_vpc.my_vpc.id
    tags = {
        Name = var.this_vpc_security_tag                #"Karan_Security_Group"
    }
}

resource "aws_vpc_security_group_egress_rule" "egress_rule" {
    security_group_id = aws_security_group.karan_security_group.id
    cidr_ipv4 = var.this_cidr_sg_egress_ingress          #var.this_cidr_sg_egress                 #"0.0.0.0/0"
    #from_port = 0
    #to_port = 0
    ip_protocol = var.this_protocol_sg_egress           #-1
    description = var.description_sg_egress             #"default rule"
}

resource "aws_vpc_security_group_ingress_rule" "ingress_rule_tomcat" {
    security_group_id = aws_security_group.karan_security_group.id
    cidr_ipv4 = var.this_cidr_sg_egress_ingress         #var.this_cidr_sg_ingress_tomcat          #"0.0.0.0/0"
    from_port = var.this_from_to_port_sg_ingress_tomcat                         #var.this_from_port_sg_ingress_tomcat     #8080
    to_port = var.this_from_to_port_sg_ingress_tomcat                           #var.this_to_port_sg_ingress_tomcat         #8080
    ip_protocol = var.this_protocol_sg_ingress                                  #"tcp"
    description = var.description_sg_ingress_tomcat                             #"for tomcat"
}

resource "aws_vpc_security_group_ingress_rule" "ingress_rule_mysql" {
    security_group_id = aws_security_group.karan_security_group.id
    cidr_ipv4 = var.this_cidr_sg_egress_ingress                                 #"0.0.0.0/0"
    from_port = var.this_from_to_port_sg_ingress_mysql                          #3306
    to_port = var.this_from_to_port_sg_ingress_mysql                            #3306
    ip_protocol = var.this_protocol_sg_ingress                                  #"tcp"
    description = var.description_sg_ingress_mysql                              #"for database"
}