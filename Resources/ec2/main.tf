resource "aws_instance" "my_tomcat_server" {
    ami = var.this_ec2_ami #ami-0dee22c13ea7a9a67
    instance_type = var.this_ec2_instance
    associate_public_ip_address = var.this_associate_public_ip_address
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

resource "aws_lb" "my_alb" {
  name               = var.this_name                      #"my-alb"
  internal           = var.this_internal                  #false
  load_balancer_type = var.this_load_balancer_type        #"application"
  security_groups    = var.this_alb_security_group        #[var.alb_security_group]
  subnets            = var.this_public_subnets            #var.public_subnets

  tags = {
    Name = var.this_Lb_tag_name                           #"MyLoadBalancer"
  }
}

resource "aws_lb_target_group" "my_target_group" {
  name        = var.this_Lb_tag_name                      #"my-target-group"
  port        = var.this_tg_port                          #80
  protocol    = var.this_tg_protocol                      #"HTTP"
  vpc_id      = var.this_tg_vpc_id                        #var.vpc_id
  health_check {
    path = var.this_healthcheck_tg_path                   #"/"
  }
}

resource "aws_lb_listener" "https_listener" {
  load_balancer_arn = var.this_load_balancer_arn          #aws_lb.my_alb.arn
  port              = var.this_lb_listener_port           #443
  protocol          = var.this_lb_protocol                #"HTTPS"
  ssl_policy        = var.this_lb_sslpolicy               #"ELBSecurityPolicy-2016-08"
  certificate_arn   = var.this_lb_certificate_arn         #var.acm_certificate_arn

  default_action {
    type             = var.this_lb_default_action_type    #"forward"
    target_group_arn = var.this_lb_target_group_arn       #aws_lb_target_group.my_target_group.arn
  }
}

resource "aws_lb_listener" "http_redirect" {
  load_balancer_arn = var.this_load_balancer_arn          #aws_lb.my_alb.arn
  port              = var.this_lb_http_redirect_port      #80
  protocol          = var.this_lb_http_protocol           #"HTTP"

  default_action {
    type = var.this_lb_default_action_type_http           #"redirect"

    redirect {
      port        = var.this_lb_redirect_https_port       #"443"
      protocol    = var.this_lb_redirect_https_protocol   #"HTTPS"
      status_code = var.this_lb_redirect_https_status_code  #"HTTP_301"
    }
  }
}

resource "aws_launch_template" "my_launch_template" {
  #name          = "my-launch-template"
  #instance_type = var.instance_type
  #image_id      = var.ami_id
  #key_name      = var.key_pair

  ami = var.this_ec2_ami #ami-0dee22c13ea7a9a67
  instance_type = var.this_ec2_instance
  associate_public_ip_address = var.this_associate_public_ip_address
  subnet_id = var.this_subnet_id
  security_groups = var.this_vpc_security     #[aws_security_group.myec2_sg.name]
  key_name = var.ec2_key_name                 #"karannew-acc-mum-kp"
  user_data = base64encode(<<-EOF
        #!/bin/bash
        apt update -y
        apt install -y openjdk-17-jdk
        wget https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.56/bin/apache-tomcat-9.0.56.tar.gz
        tar -xvf apache-tomcat-9.0.56.tar.gz
        mv apache-tomcat-9.0.56 /opt
        bash /opt/apache-tomcat-9.0.56/bin/startup.sh
        
        EOF
  )
  #user_data = base64encode(<<-EOF
  #            #!/bin/bash
  #            apt update -y
  #            apt install -y apache2
  #            systemctl start apache2
  #            EOF
  )
}

resource "aws_autoscaling_group" "my_asg" {
  desired_capacity     = var.this_asg_capacity            #2
  max_size             = var.this_asg_max_size            #5
  min_size             = var.this_ags_min_size            #1
  vpc_zone_identifier  = var_this_asg_zone_identifier     #var.private_subnets
  launch_template {
    id      = var.this_launch_temp_id                     #aws_launch_template.my_launch_template.id
    version = var.this_launch_template_version            #"$Latest"
  }
  target_group_arns = [aws_lb_target_group.my_target_group.arn]

  tags = [
    {
      key                 = "Name"
      value               = "ASG-Instance"
      propagate_at_launch = true
    }
  ]
}