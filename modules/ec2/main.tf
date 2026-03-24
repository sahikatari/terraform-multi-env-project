data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

resource "aws_instance" "ec2" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  lifecycle {
  prevent_destroy = true
}
  subnet_id     = var.subnet_id
  vpc_security_group_ids = [var.sg_id]

  tags = {
    Name = "${var.env}-ec2"
  }
}
