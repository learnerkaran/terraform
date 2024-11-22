resource "aws_db_instance" "mysql_karan" {
    identifier                  = var.this_db_name              #"karan-db"
    allocated_storage           = var.this_db_size              #20
    storage_type                = var.this_storage_type         #"gp2"  
    #availability_zone           = "ap-south-1b"
    engine                      = var.this_engine_type          #"mysql"
    engine_version              = var.this_engine_version       #"8.0.39"
    instance_class              = var.this_db_instace_class     #"db.t3.micro"
    username                    = var.ths_db_username           #"admin"
    password                    = var.this_db_passwd            #"Admin1234"
    skip_final_snapshot         = var.this_final_snapshot       #true
    port                        = var.this_port_number          #3306
    db_subnet_group_name        = var.this_vpc_db_subnet_name   #aws_db_subnet_group.subnet-group-for-rds.name
    vpc_security_group_ids      = var.this_rds_sg_id            #[aws_security_group.karan_security_group.id]
}

resource "aws_db_subnet_group" "subnet-group-for-rds"{
    name = var.this_db_subnet_name                              #"karan-rds-subnet-group-name"
    subnet_ids = var.this_subnet_id_for_db                      #[aws_subnet.subnet_2.id]

    tags = {
        Name = var.this_karan_rds_subnet_name                   #"karan-rds-subnet-group"
    }
}
