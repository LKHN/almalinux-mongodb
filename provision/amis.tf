data "aws_ami" "almalinux8_amd64" {
  owners      = ["764336703387"]
  most_recent = true
  name_regex  = "AlmaLinux OS 8.* x86_64"
}

data "aws_ami" "almalinux8_aarch64" {
  owners      = ["764336703387"]
  most_recent = true
  name_regex  = "AlmaLinux OS 8.* aarch64"
}

data "aws_ami" "almalinux9_amd64" {
  owners      = ["764336703387"]
  most_recent = true
  name_regex  = "AlmaLinux OS 9.* x86_64"
}

data "aws_ami" "almalinux9_aarch64" {
  owners      = ["764336703387"]
  most_recent = true
  name_regex  = "AlmaLinux OS 9.* aarch64"
}
