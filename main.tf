resource "aws_instance" "web" {
  ami           = "ami-0e2031728ef69a466"
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }

  key_name = "test3"
  user_data = file("${path.module}/startup.sh")
  subnet_id = aws_subnet.my_subnet.id

  vpc_security_group_ids = [aws_security_group.allow_tls.id]

}

resource "aws_network_interface" "foo" {
  subnet_id   = aws_subnet.my_subnet.id
  private_ips = ["10.0.1.10"]

  tags = {
    Name = "primary_network_interface"
  }
}

output "public_ip" {
  value = aws_instance.web.public_ip
}