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
     
provisioner "local-exec" {
    command = "echo ${self.private_ip} >> /tmp/private_ips.txt "
  }
    provisioner "local-exec" {
    working_dir = "/tmp/"
    command = "echo ${self.private_ip} >> workingdir_private_ips.txt "
  }
}


}