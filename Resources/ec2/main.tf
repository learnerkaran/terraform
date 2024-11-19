resource "aws_instance" "my_tomcat_server" {
    ami = var.this_ec2_ami #ami-0dee22c13ea7a9a67
    instance_type = var.this_ec2_instance

    subnet_id = var.this_subnet_id
    security_groups = var.this_vpc_security     #[aws_security_group.myec2_sg.name]
    key_name = var.ec2_key_name                 #"karannew-acc-mum-kp"

      user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install -y openjdk-17-jdk
              wget https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.56/bin/apache-tomcat-9.0.56.tar.gz
              tar -xvf apache-tomcat-9.0.56.tar.gz
              mv apache-tomcat-9.0.56 /opt
              bash /opt/apache-tomcat-9.0.56/bin/startup.sh
              
              EOF

  tags = {
    Name = var.this_tag                         #"TomcatServer_tfvars"
  }
}
