
resource "aws_instance" "this_aws_instance" {
    ami = "ami-0dee22c13ea7a9a67"
    vpc_security_group_ids = ["sg-094dd7e45545c0059"]
    key_name = "karannew-acc-mum-kp"
    instance_type = "t2.micro"
     
    provisioner "file" {
    source      = "abc.txt"
    destination = "/home/ubuntu/readme.md"
      connection {
    type     = "ssh"
    user     = "ubuntu"
    private_key = file("${path.module}/id_rsa.pem")
    host     = "${self.public_ip}"
  }
  
  
  }


}