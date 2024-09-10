provider "aws" {
  region     = var.region
  access_key = var.AWS_ACCESS_KEY
  secret_key = var.AWS_SECRET_KEY
}

resource "aws_instance" "my_instance" {
  count         = var.Total_Instances
  ami           = var.image
  instance_type = var.instance_type
  key_name      = var.key_name

  tags = {
    Name = "MyInstance-${count.index + 1}"
  }
}

output "instance_ips" {
  value = aws_instance.my_instance.*.public_ip
}
