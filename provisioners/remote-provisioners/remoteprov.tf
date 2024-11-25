provider "aws" {
  region = "ap-south-1"
  profile = "config"
  shared_credentials_files = ["/root/.aws/credentials"]
    default_tags {
                tags = {
                    name = "3tier"
                }
    }
}
resource "aws_instance" "this_aws_instance" {
    ami = "ami-0dee22c13ea7a9a67"
    vpc_security_group_ids = ["sg-094dd7e45545c0059"]
    key_name = "karannew-acc-mum-kp"
    instance_type = "t2.micro"
  
  provisioner "remote-exec" {
    inline = [
      "sudo yum update",
      "sudo yum install -y nginx",
      "sudo systemctl start nginx"
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu" # Default user for ec2-user AMIs; replace if needed
      private_key = file("${path.module}/id_rsa.pem")
      host        = self.public_ip
    }
  }

  tags = {
    Name = "Karan Instance"
  }
}