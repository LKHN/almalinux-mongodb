variable "instance_type_amd64" {
  type        = string
  description = "EC2 Instance type for x86_64/amd64"
  default     = "t2.small"
}

variable "instance_type_aarch64" {
  type        = string
  description = "EC2 Instance type for AArch64"
  default     = "t4g.small"
}

variable "key_name" {
  type        = string
  description = "Name of the EC2 key pair"
  nullable    = false
}

variable "ssh_private_key_path" {
  type        = string
  description = "The path of the private SSH key for Ansible i.e. ~/.ssh/ssh_private_key"
  nullable    = false
}

variable "security_groups" {
  type        = list(any)
  description = "Name of EC2 security groups"
  default     = null
}

variable "aws_region" {
  type        = string
  description = "AWS Region"
  default     = null
}

variable "aws_access_key" {
  type        = string
  description = "AWS access key"
  default     = null
}

variable "aws_secret_key" {
  type        = string
  description = "AWS secret key"
  default     = null
}

variable "aws_profile" {
  type        = string
  description = "AWS profile name as set in the shared configuration and credentials files"
  default     = null
}
