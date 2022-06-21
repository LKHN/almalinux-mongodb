resource "aws_instance" "al8-amd64" {
  ami                         = data.aws_ami.almalinux8_amd64.id
  associate_public_ip_address = true
  instance_type               = var.instance_type_amd64
  key_name                    = var.key_name
  security_groups             = var.security_groups
  tags = {
    Name = "AlmaLinux OS 8 MongoDB x86_64"
  }
}
resource "aws_instance" "al8-aarch64" {
  ami                         = data.aws_ami.almalinux8_aarch64.id
  associate_public_ip_address = true
  instance_type               = var.instance_type_aarch64
  key_name                    = var.key_name
  security_groups             = var.security_groups
  tags = {
    Name = "AlmaLinux OS 8 MongoDB AArch64"
  }
}
resource "aws_instance" "al9-amd64" {
  ami                         = data.aws_ami.almalinux9_amd64.id
  associate_public_ip_address = true
  instance_type               = var.instance_type_amd64
  key_name                    = var.key_name
  security_groups             = var.security_groups
  tags = {
    Name = "AlmaLinux OS 9 MongoDB x86_64"
  }
}
resource "aws_instance" "al9-aarch64" {
  ami                         = data.aws_ami.almalinux9_aarch64.id
  associate_public_ip_address = true
  instance_type               = var.instance_type_aarch64
  key_name                    = var.key_name
  security_groups             = var.security_groups
  tags = {
    Name = "AlmaLinux OS 9 MongoDB AArch64"
  }
}

resource "local_file" "ansible_inventory" {
  content = templatefile("${path.module}/inventory.tftpl", {
    "almalinux-8-amd64"   = aws_instance.al8-amd64.public_dns
    "almalinux-8-aarch64" = aws_instance.al8-aarch64.public_dns
    "almalinux-9-amd64"   = aws_instance.al9-amd64.public_dns
    "almalinux-9-aarch64" = aws_instance.al9-aarch64.public_dns
    "ssh_priv_key_path"   = var.ssh_private_key_path
  })
  filename = "../configuration/inventory.yaml"
}
